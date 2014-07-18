package insurance

import grails.transaction.Transactional
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.springframework.security.core.context.SecurityContextHolder

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class CompanyController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {

        params.max = Math.min(max ?: 10, 100)

        if (SecurityContextHolder.getContext().getAuthentication().getPrincipal() != "anonymousUser") {
            def me = User.findByUsername(SecurityContextHolder.getContext().getAuthentication().getPrincipal().username)

            if (SpringSecurityUtils.ifAnyGranted("ROLE_MANAGER")) {
                respond Company.list(params).findAll { it.seller.manager == me }, model: [companyInstanceCount: Company.count()]
            }
        }
    }

    def show(Company companyInstance) {
        respond companyInstance
    }

    /*
    * Если пользователь менеджер и продавец компании
    * */

    def create() {
        def companyInstance = new Company(params)
        if (SecurityContextHolder.getContext().getAuthentication().getPrincipal() != "anonymousUser") {
            def me = User.findByUsername(SecurityContextHolder.getContext().getAuthentication().getPrincipal().username)
            if (SpringSecurityUtils.ifAnyGranted("ROLE_SELLER")) {
                companyInstance.seller = me
            }
        }
        respond companyInstance
    }

    @Transactional
    def save(Company companyInstance) {
        if (companyInstance == null) {
            notFound()
            return
        }

        if (companyInstance.hasErrors()) {
            respond companyInstance.errors, view: 'create'
            return
        }

        companyInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'company.label', default: 'Company'), companyInstance.id])
                redirect companyInstance
            }
            '*' { respond companyInstance, [status: CREATED] }
        }
    }

    def edit(Company companyInstance) {
        def me = User.findByUsername(SecurityContextHolder.getContext().getAuthentication().getPrincipal().username)
        if(SpringSecurityUtils.ifAnyGranted("ROLE_SELLER") && companyInstance.seller == me) {
            respond companyInstance
        } else if (SpringSecurityUtils.ifAnyGranted("ROLE_ADMIN")) respond companyInstance
    }

    @Transactional
    def update(Company companyInstance) {
        if (companyInstance == null) {
            notFound()
            return
        }

        if (companyInstance.hasErrors()) {
            respond companyInstance.errors, view: 'edit'
            return
        }

        companyInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Company.label', default: 'Company'), companyInstance.id])
                redirect companyInstance
            }
            '*' { respond companyInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Company companyInstance) {

        if (companyInstance == null) {
            notFound()
            return
        }

        companyInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Company.label', default: 'Company'), companyInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'company.label', default: 'Company'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
