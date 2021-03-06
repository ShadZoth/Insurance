package insurance

import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_SELLER', 'ROLE_CALL_CENTER'])


@Transactional(readOnly = true)
class PriceController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Price.list(params), model: [priceInstanceCount: Price.count()]
    }

    def show(Price priceInstance) {
        respond priceInstance
    }

    def create() {
        respond new Price(params), model: [priceProductId: params["product_id"]]
    }

    @Transactional
    def save(Price priceInstance) {
        if (priceInstance == null) {
            notFound()
            return
        }

        if (priceInstance.hasErrors()) {
            respond priceInstance.errors, view: 'create'
            return
        }

        priceInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'price.label', default: 'Price'), priceInstance.id])
                redirect priceInstance
            }
            '*' { respond priceInstance, [status: CREATED] }
        }
    }

    def edit(Price priceInstance) {
        respond priceInstance
    }

    @Transactional
    def update(Price priceInstance) {
        if (priceInstance == null) {
            notFound()
            return
        }

        if (priceInstance.hasErrors()) {
            respond priceInstance.errors, view: 'edit'
            return
        }

        priceInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Price.label', default: 'Price'), priceInstance.id])
                redirect priceInstance
            }
            '*' { respond priceInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Price priceInstance) {

        if (priceInstance == null) {
            notFound()
            return
        }

        priceInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Price.label', default: 'Price'), priceInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'price.label', default: 'Price'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
