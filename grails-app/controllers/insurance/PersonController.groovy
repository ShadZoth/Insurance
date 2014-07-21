package insurance

import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.springframework.security.core.context.SecurityContextHolder

import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_SELLER', 'ROLE_CALL_CENTER'])


@Transactional(readOnly = true)
class PersonController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]


    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def me = User.findByUsername(SecurityContextHolder.getContext().getAuthentication().getPrincipal().username)

        if (SpringSecurityUtils.ifAnyGranted("ROLE_MANAGER")) {
            def theList = Person.createCriteria().list(params) {
                and {
                    'in'("seller", me.sellers)
                }
            }
            respond theList, model: [personInstanceCount: (Person.createCriteria().count() {
                and {
                    'in'("seller", me.sellers)
                }
            })]
        } else if (SpringSecurityUtils.ifAnyGranted("ROLE_SELLER")) {

            def theList = Person.createCriteria().list(params) {
                and {
                    eq("seller", me)
                }
            }
            respond theList, model: [personInstanceCount: (Person.createCriteria().count {
                and {
                    eq("seller", me)
                }
            })]
        } else
            respond Person.list(params), model: [personInstanceCount: (Person.count)]
    }

    def show(Person personInstance) {
        respond personInstance
    }

    /*
    * Содержит проверку
    * Если юзер продавец, то задать его по-умлочанию.
    * */

    def create() {
        def personInstance = new Person(params)
        respond personInstance
    }

    @Transactional
    def save(Person personInstance) {
        if (personInstance == null) {
            notFound()
            return
        }

        if (personInstance.hasErrors()) {
            respond personInstance.errors, view: 'create'
            return
        }

        personInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'person.label', default: 'Person'), personInstance.id])
                redirect personInstance
            }
            '*' { respond personInstance, [status: CREATED] }
        }
    }

    def edit(Person personInstance) {
        def me = User.findByUsername(SecurityContextHolder.getContext().getAuthentication().getPrincipal().username)
        if (SpringSecurityUtils.ifAnyGranted("ROLE_SELLER") && personInstance.seller == me) {
            respond personInstance
        } else if (SpringSecurityUtils.ifAnyGranted("ROLE_ADMIN")) respond personInstance
    }

    @Transactional
    def update(Person personInstance) {
        if (personInstance == null) {
            notFound()
            return
        }

        if (personInstance.hasErrors()) {
            respond personInstance.errors, view: 'edit'
            return
        }

        personInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Person.label', default: 'Person'), personInstance.id])
                redirect personInstance
            }
            '*' { respond personInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Person personInstance) {

        if (personInstance == null) {
            notFound()
            return
        }

        personInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Person.label', default: 'Person'), personInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
