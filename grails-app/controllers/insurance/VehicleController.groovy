package insurance

import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_DISPATCHER', 'ROLE_CALL_CENTER'])


@Transactional(readOnly = true)
class VehicleController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Vehicle.list(params), model: [vehicleInstanceCount: Vehicle.count()]
    }

    def show(Vehicle vehicleInstance) {
        respond vehicleInstance
    }

    def create() {
        respond new Vehicle(params), model:[vehicleClientId:params["client_id"]]
    }

    @Transactional
    def save(Vehicle vehicleInstance) {
        if (vehicleInstance == null) {
            notFound()
            return
        }

        if (vehicleInstance.hasErrors()) {
            respond vehicleInstance.errors, view: 'create'
            return
        }

        vehicleInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'vehicle.label', default: 'Vehicle'), vehicleInstance.id])
                redirect vehicleInstance
            }
            '*' { respond vehicleInstance, [status: CREATED] }
        }
    }

    def edit(Vehicle vehicleInstance) {
        respond vehicleInstance
    }

    @Transactional
    def update(Vehicle vehicleInstance) {
        if (vehicleInstance == null) {
            notFound()
            return
        }

        if (vehicleInstance.hasErrors()) {
            respond vehicleInstance.errors, view: 'edit'
            return
        }

        vehicleInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Vehicle.label', default: 'Vehicle'), vehicleInstance.id])
                redirect vehicleInstance
            }
            '*' { respond vehicleInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Vehicle vehicleInstance) {

        if (vehicleInstance == null) {
            notFound()
            return
        }

        vehicleInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Vehicle.label', default: 'Vehicle'), vehicleInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'vehicle.label', default: 'Vehicle'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
