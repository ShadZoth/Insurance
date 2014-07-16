import insurance.Role
import insurance.User
import insurance.UserRole

class BootStrap {

    def init = { servletContext ->

        def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
        def managerRole = new Role(authority: 'ROLE_MANAGER').save(flush: true)
        def sellerRole = new Role(authority: 'ROLE_SELLER').save(flush: true)
        def callCenterRole = new Role(authority: 'ROLE_CALL_CENTER').save(flush: true)

        def testUser = new User(username: 'me', password: 'password')
        testUser.save(flush: true)
        testUser.enabled = true

        def testSeller = new User(username: 'he', password: 'password')
        testSeller.save(flush: true)
        testSeller.enabled = true

        UserRole.create testUser, adminRole, true
        UserRole.create testSeller, sellerRole, true

        assert User.count() == 2
        assert Role.count() == 4
        assert UserRole.count() == 2
    }
    def destroy = {

    }
}
