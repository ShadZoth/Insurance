package insurance

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class PassportController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Passport.list(params), model: [passportInstanceCount: Passport.count()]
    }

    def show(Passport passportInstance) {
        respond passportInstance
    }

    def create() {
        respond new Passport(params)
    }

    @Transactional
    def save(Passport passportInstance) {
        if (passportInstance == null) {
            notFound()
            return
        }

        if (passportInstance.hasErrors()) {
            respond passportInstance.errors, view: 'create'
            return
        }

        passportInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'passport.label', default: 'Passport'), passportInstance.id])
                redirect passportInstance
            }
            '*' { respond passportInstance, [status: CREATED] }
        }
    }

    def edit(Passport passportInstance) {
        respond passportInstance
    }

    @Transactional
    def update(Passport passportInstance) {
        if (passportInstance == null) {
            notFound()
            return
        }

        if (passportInstance.hasErrors()) {
            respond passportInstance.errors, view: 'edit'
            return
        }

        passportInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Passport.label', default: 'Passport'), passportInstance.id])
                redirect passportInstance
            }
            '*' { respond passportInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Passport passportInstance) {

        if (passportInstance == null) {
            notFound()
            return
        }

        passportInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Passport.label', default: 'Passport'), passportInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'passport.label', default: 'Passport'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
