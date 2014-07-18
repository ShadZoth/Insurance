package insurance

import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_SELLER', 'ROLE_CALL_CENTER'])

@Transactional(readOnly = true)
class WarrantController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Warrant.list(params), model: [warrantInstanceCount: Warrant.count()]
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
