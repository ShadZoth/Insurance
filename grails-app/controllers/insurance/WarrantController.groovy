package insurance

import grails.transaction.Transactional
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.springframework.security.core.context.SecurityContextHolder

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class WarrantController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def res = Warrant.list(params).findAll {
            def me = User.findByUsername(SecurityContextHolder.getContext().getAuthentication().getPrincipal().username)
            def s = new HasRoleService()
            if (SpringSecurityUtils.ifAnyGranted("ROLE_ADMIN") || SpringSecurityUtils.ifAnyGranted("ROLE_CALL_CENTER")) {
                return true
            } else if (SpringSecurityUtils.ifAnyGranted("ROLE_MANAGER")) {
                return it.client.seller.manager == me
            } else if (SpringSecurityUtils.ifAnyGranted("ROLE_SELLER")) {
                return it.client.seller == me
            }
        }
        respond res, model: [warrantInstanceCount: res.size()]
    }

    def show(Warrant warrantInstance) {
        respond warrantInstance
    }

    def create() {
        respond new Warrant(params)
    }

    @Transactional
    def save(Warrant warrantInstance) {
        if (warrantInstance == null) {
            notFound()
            return
        }

        if (warrantInstance.hasErrors()) {
            respond warrantInstance.errors, view: 'create'
            return
        }

        warrantInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'warrant.label', default: 'Warrant'), warrantInstance.id])
                redirect warrantInstance
            }
            '*' { respond warrantInstance, [status: CREATED] }
        }
    }

    def edit(Warrant warrantInstance) {
        respond warrantInstance
    }

    @Transactional
    def update(Warrant warrantInstance) {
        if (warrantInstance == null) {
            notFound()
            return
        }

        if (warrantInstance.hasErrors()) {
            respond warrantInstance.errors, view: 'edit'
            return
        }

        warrantInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Warrant.label', default: 'Warrant'), warrantInstance.id])
                redirect warrantInstance
            }
            '*' { respond warrantInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Warrant warrantInstance) {

        if (warrantInstance == null) {
            notFound()
            return
        }

        warrantInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Warrant.label', default: 'Warrant'), warrantInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'warrant.label', default: 'Warrant'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
