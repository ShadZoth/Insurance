package insurance

import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.springframework.security.core.context.SecurityContextHolder

import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_SELLER', 'ROLE_CALL_CENTER'])

@Transactional(readOnly = true)
class WarrantController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def realPath = servletContext.getRealPath("/reports/images/")
        params.max = Math.min(max ?: 10, 100)
        def me = User.findByUsername(SecurityContextHolder.getContext().getAuthentication().getPrincipal().username)

        if (SpringSecurityUtils.ifAnyGranted("ROLE_MANAGER")) {
            def theList = Warrant.createCriteria().list(params) {
                and {
                    'in'("client", (me.sellers.collect {it.clients}).flatten())
                }
            }
            respond theList, model: [warrantInstanceCount: (Warrant.createCriteria().count() {
                and {
                    'in'("client", (me.sellers.collect {it.clients}).flatten())
                }
            }), realPath:realPath]
        } else if (SpringSecurityUtils.ifAnyGranted("ROLE_SELLER")) {

            def theList = Warrant.createCriteria().list(params) {
                and {
                    'in'("client", me.clients)
                }
            }
            respond theList, model: [warrantInstanceCount: (Warrant.createCriteria().count {
                and {
                    'in'("client", me.clients)
                }
            })]
        } else
            respond Warrant.list(params), model: [warrantInstanceCount: (Warrant.count), realPath:realPath]
    }

    def show(Warrant warrantInstance) {
        respond warrantInstance
    }

    def showReport(Warrant warrantInstance) {
        def realPath = servletContext.getRealPath("/reports/images/")
        respond warrantInstance, model: [certificateFail: !warrantInstance?.vehicle?.certificates, companyFail: warrantInstance?.client?.getClass() == Company, realPath:realPath]
    }

    def create() {

        def me = User.findByUsername(SecurityContextHolder.getContext().getAuthentication().getPrincipal().username)
        def theList = null;

        if (SpringSecurityUtils.ifAnyGranted("ROLE_SELLER")) {

            theList = Client.list().findAll({
                it.seller==me
            })

        }

        respond new Warrant(params),
                model: [warrantClientId: params["client_id"], myClientList:theList]
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
        def me = User.findByUsername(SecurityContextHolder.getContext().getAuthentication().getPrincipal().username)
        def theList = null;

        if (SpringSecurityUtils.ifAnyGranted("ROLE_SELLER")) {

            theList = Client.list().findAll({
                it.seller==me
            })

        }

        respond warrantInstance, model: [myClientList:theList]
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
