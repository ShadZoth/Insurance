import insurance.Client
import insurance.Role
import insurance.User
import insurance.UserRole

class BootStrap {

    def init = { servletContext ->
        def c = new Client()
        c.registrationDate = new Date()
        c.archived = true
        c.save()

        def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
        def userRole = new Role(authority: 'ROLE_USER').save(flush: true)

        def testUser = new User(username: 'me', password: 'password')
        testUser.save(flush: true)
        testUser.enabled = true

        UserRole.create testUser, adminRole, true

        assert User.count() == 1
        assert Role.count() == 2
        assert UserRole.count() == 1
    }
    def destroy = {

    }
}
