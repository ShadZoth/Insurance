import insurance.Client
import insurance.Role
import insurance.User
import insurance.UserRole

class BootStrap {

    def init = { 
        def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
        def managerRole = new Role(authority: 'ROLE_MANAGER').save(flush: true)
        def sellerRole = new Role(authority: 'ROLE_SELLER').save(flush: true)
        def callCenterRole = new Role(authority: 'ROLE_CALL_CENTER').save(flush: true)

        def testUser = new User(username: 'admin', password: 'password')
        testUser.save(flush: true)
        testUser.enabled = true

        UserRole.create testUser, adminRole, true


        def testManager = new User(username: 'manager', password: 'password')
        testManager.save(flush: true)
        testManager.enabled = true

        UserRole.create testManager, managerRole, true

        def testSeller = new User(username: 'seller', password: 'password')
        testSeller.save(flush: true)
        testSeller.enabled = true

        UserRole.create testSeller, sellerRole, true

        def testCallCenter = new User(username: 'call', password: 'password')
        testCallCenter.save(flush: true)
        testCallCenter.enabled = true

        UserRole.create testCallCenter, callCenterRole, true

        assert User.count() == 4
        assert Role.count() == 4
        assert UserRole.count() == 4
    }

    def destroy = {

    }
}
