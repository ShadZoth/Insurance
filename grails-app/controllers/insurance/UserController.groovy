package insurance

import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.springframework.security.core.context.SecurityContextHolder

import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN', 'ROLE_MANAGER'])

@Transactional(readOnly = true)
class UserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def hasRoleService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        // получаем себя
        def me = User.findByUsername(SecurityContextHolder.getContext().getAuthentication().getPrincipal().username)

        if (SpringSecurityUtils.ifAnyGranted('ROLE_MANAGER')) {
            def list = User.createCriteria().list(params) {
                or {
                    'in'("username", (me.sellers.collect { it.username }).flatten())
                    and {
                        'in'("username", User.list().findAll {
                            it.manager == null;
                        }.username)
                        eq("authority", "ROLE_SELLER")
                    }
                }
            }
            respond list, model: [userInstanceCount: User.createCriteria().count(){
                or {
                    'in'("username", (me.sellers.collect { it.username }).flatten())

                    and {
                        'in'("username", User.list().findAll {
                            it.manager == null;
                        }.username)
                        eq("authority", "ROLE_SELLER")
                    }
                }
            }]
        } else if (SpringSecurityUtils.ifAnyGranted('ROLE_ADMIN')) {
            respond User.list(params), model: [userInstanceCount: User.count()]
        }
    }

    def show(User userInstance) {
        respond userInstance
    }

    @Transactional
    def addManager(User userInstance) {
        def me = User.findByUsername(SecurityContextHolder.getContext().getAuthentication().getPrincipal().username)
        me.addSeller(userInstance)
        request.withFormat {
            form multipartForm {
                redirect userInstance
            }
            '*' { respond userInstance }
        }
    }

    def create() {
        //TODO: Добавить значение по умолчанию "ROLE_SELLER", если залогинен
        //TODO: менеджер
        respond new User(params)
    }

    @Transactional
    def save(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view: 'create'
            return
        }

        userInstance.save flush: true
        userInstance.mergeAuthorities()
        if (SpringSecurityUtils.ifAnyGranted("ROLE_MANAGER")) {
            def me = User.findByUsername(SecurityContextHolder.getContext().getAuthentication().getPrincipal().username)
            me.addSeller(userInstance)
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: CREATED] }
        }
    }

    def edit(User userInstance) {
        respond userInstance
    }

    @Transactional
    def update(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view: 'edit'
            return
        }

        userInstance.save flush: true
        userInstance.mergeAuthorities()

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

}
