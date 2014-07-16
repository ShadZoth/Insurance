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
        def managerRole = new Role(authority: 'ROLE_MANAGER').save(flush: true)
        def sellerRole = new Role(authority: 'ROLE_SELLER').save(flush: true)
        def callCenterRole = new Role(authority: 'ROLE_CALL_CENTER').save(flush: true)

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
