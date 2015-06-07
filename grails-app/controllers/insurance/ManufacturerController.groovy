package insurance

import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_DISPATCHER', 'ROLE_CALL_CENTER'])


@Transactional(readOnly = true)
class ManufacturerController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Manufacturer.list(params), model: [manufacturerInstanceCount: Manufacturer.count()]
    }

    def show(Manufacturer manufacturerInstance) {
        respond manufacturerInstance
    }

    def create() {
        respond new Manufacturer(params)
    }

    @Transactional
    def save(Manufacturer manufacturerInstance) {
        if (manufacturerInstance == null) {
            notFound()
            return
        }

        if (manufacturerInstance.hasErrors()) {
            respond manufacturerInstance.errors, view: 'create'
            return
        }

        manufacturerInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'manufacturer.label', default: 'Manufacturer'), manufacturerInstance.id])
                redirect manufacturerInstance
            }
            '*' { respond manufacturerInstance, [status: CREATED] }
        }
    }

    def edit(Manufacturer manufacturerInstance) {
        respond manufacturerInstance
    }

    @Transactional
    def update(Manufacturer manufacturerInstance) {
        if (manufacturerInstance == null) {
            notFound()
            return
        }

        if (manufacturerInstance.hasErrors()) {
            respond manufacturerInstance.errors, view: 'edit'
            return
        }

        manufacturerInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Manufacturer.label', default: 'Manufacturer'), manufacturerInstance.id])
                redirect manufacturerInstance
            }
            '*' { respond manufacturerInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Manufacturer manufacturerInstance) {

        if (manufacturerInstance == null) {
            notFound()
            return
        }

        manufacturerInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Manufacturer.label', default: 'Manufacturer'), manufacturerInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'manufacturer.label', default: 'Manufacturer'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
