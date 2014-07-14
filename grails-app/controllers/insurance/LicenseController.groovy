package insurance

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class LicenseController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond License.list(params), model: [licenseInstanceCount: License.count()]
    }

    def show(License licenseInstance) {
        respond licenseInstance
    }

    def create() {
        respond new License(params)
    }

    @Transactional
    def save(License licenseInstance) {
        if (licenseInstance == null) {
            notFound()
            return
        }

        if (licenseInstance.hasErrors()) {
            respond licenseInstance.errors, view: 'create'
            return
        }

        licenseInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'license.label', default: 'License'), licenseInstance.id])
                redirect licenseInstance
            }
            '*' { respond licenseInstance, [status: CREATED] }
        }
    }

    def edit(License licenseInstance) {
        respond licenseInstance
    }

    @Transactional
    def update(License licenseInstance) {
        if (licenseInstance == null) {
            notFound()
            return
        }

        if (licenseInstance.hasErrors()) {
            respond licenseInstance.errors, view: 'edit'
            return
        }

        licenseInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'License.label', default: 'License'), licenseInstance.id])
                redirect licenseInstance
            }
            '*' { respond licenseInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(License licenseInstance) {

        if (licenseInstance == null) {
            notFound()
            return
        }

        licenseInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'License.label', default: 'License'), licenseInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'license.label', default: 'License'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
