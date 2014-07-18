package insurance

import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_SELLER', 'ROLE_CALL_CENTER'])


@Transactional(readOnly = true)
class AccidentController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Accident.list(params), model: [accidentInstanceCount: Accident.count()]
    }

    def show(Accident accidentInstance) {
        respond accidentInstance
    }

    def create() {
        respond new Accident(params)
    }

    @Transactional
    def save(Accident accidentInstance) {
        if (accidentInstance == null) {
            notFound()
            return
        }

        if (accidentInstance.hasErrors()) {
            respond accidentInstance.errors, view: 'create'
            return
        }

        accidentInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'accident.label', default: 'Accident'), accidentInstance.id])
                redirect accidentInstance
            }
            '*' { respond accidentInstance, [status: CREATED] }
        }
    }

    def edit(Accident accidentInstance) {
        respond accidentInstance
    }

    @Transactional
    def update(Accident accidentInstance) {
        if (accidentInstance == null) {
            notFound()
            return
        }

        if (accidentInstance.hasErrors()) {
            respond accidentInstance.errors, view: 'edit'
            return
        }

        accidentInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Accident.label', default: 'Accident'), accidentInstance.id])
                redirect accidentInstance
            }
            '*' { respond accidentInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Accident accidentInstance) {

        if (accidentInstance == null) {
            notFound()
            return
        }

        accidentInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Accident.label', default: 'Accident'), accidentInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'accident.label', default: 'Accident'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
