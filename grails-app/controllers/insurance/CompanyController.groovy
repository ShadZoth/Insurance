package insurance

import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.springframework.security.core.context.SecurityContextHolder

import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_DISPATCHER', 'ROLE_CALL_CENTER'])

@Transactional(readOnly = true)
class CompanyController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def me = User.findByUsername(SecurityContextHolder.getContext().getAuthentication().getPrincipal().username)

        if (SpringSecurityUtils.ifAnyGranted("ROLE_MANAGER")) {
            def theList = Company.createCriteria().list(params) {
                and {
                    'in'("dispatcher", me.dispatchers)
                }
            }
            respond theList, model: [companyInstanceCount: (Company.createCriteria().count() {
                and {
                    'in'("dispatcher", me.dispatchers)
                }
            })]
        } else if (SpringSecurityUtils.ifAnyGranted("ROLE_DISPATCHER")) {

            def theList = Company.createCriteria().list(params) {
                and {
                    eq("dispatcher", me)
                }
            }
            respond theList, model: [companyInstanceCount: (Company.createCriteria().count {
                and {
                    eq("dispatcher", me)
                }
            })]
        } else
            respond Company.list(params), model: [companyInstanceCount: (Company.count)]
    }

    def show(Company companyInstance) {
        respond companyInstance
    }

    /*
    * Если пользователь -- продавец, то задать его по-умолчанию в поле dispatcher
    * */

    def create() {
        def companyInstance = new Company(params)
        respond companyInstance
    }

    @Transactional
    def save(Company companyInstance) {
        if (companyInstance == null) {
            notFound()
            return
        }

        if (companyInstance.hasErrors()) {
            respond companyInstance.errors, view: 'create'
            return
        }

        companyInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'company.label', default: 'Company'), companyInstance.id])
                redirect companyInstance
            }
            '*' { respond companyInstance, [status: CREATED] }
        }
    }

    def edit(Company companyInstance) {
        def me = User.findByUsername(SecurityContextHolder.getContext().getAuthentication().getPrincipal().username)
        if (SpringSecurityUtils.ifAnyGranted("ROLE_DISPATCHER") && companyInstance.dispatcher == me) {
            respond companyInstance
        } else if (SpringSecurityUtils.ifAnyGranted("ROLE_ADMIN")) respond companyInstance
    }

    @Transactional
    def update(Company companyInstance) {
        if (companyInstance == null) {
            notFound()
            return
        }

        if (companyInstance.hasErrors()) {
            respond companyInstance.errors, view: 'edit'
            return
        }

        companyInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Company.label', default: 'Company'), companyInstance.id])
                redirect companyInstance
            }
            '*' { respond companyInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Company companyInstance) {

        if (companyInstance == null) {
            notFound()
            return
        }

        companyInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Company.label', default: 'Company'), companyInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'company.label', default: 'Company'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
