import insurance.Client

class BootStrap {

    def init = { servletContext ->
        def c = new Client()
        c.registrationDate = new Date()
        c.archived = true
        c.save()
    }
    def destroy = {
    }
}
