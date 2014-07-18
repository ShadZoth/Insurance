package insurance

import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_SELLER', 'ROLE_CALL_CENTER'])


@Transactional(readOnly = true)
class ClientController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Client.list(params), model: [clientInstanceCount: Client.count()]
    }

    def show(Client clientInstance) {
        if (clientInstance.getClass().equals(Person.class)) {
            redirect controller: 'person', action: 'show', id: clientInstance.id
        } else if (clientInstance.getClass().equals(Company.class)) {
            redirect controller: 'company', action: 'show', id: clientInstance.id
        } else
            respond clientInstance
    }

    def create() {
        redirect controller: params.cl, action: 'create'
    }

    @Transactional
    def save(Client clientInstance) {
        if (clientInstance == null) {
            notFound()
            return
        }

        if (clientInstance.hasErrors()) {
            respond clientInstance.errors, view: 'create'
            return
        }

        clientInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'client.label', default: 'Client'), clientInstance.id])
                redirect clientInstance
            }
            '*' { respond clientInstance, [status: CREATED] }
        }
    }

    def edit(Client clientInstance) {
        if (clientInstance.getClass().equals(Person.class)) {
            redirect controller: 'person', action: 'edit', id: clientInstance.id
        } else if (clientInstance.getClass().equals(Company.class)) {
            redirect controller: 'company', action: 'edit', id: clientInstance.id
        } else
            respond clientInstance
    }

    @Transactional
    def update(Client clientInstance) {
        if (clientInstance == null) {
            notFound()
            return
        }

        if (clientInstance.hasErrors()) {
            respond clientInstance.errors, view: 'edit'
            return
        }

        clientInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Client.label', default: 'Client'), clientInstance.id])
                redirect clientInstance
            }
            '*' { respond clientInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Client clientInstance) {

        if (clientInstance == null) {
            notFound()
            return
        }

        clientInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Client.label', default: 'Client'), clientInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'client.label', default: 'Client'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
