import insurance.Role
import insurance.User
import insurance.UserRole

class BootStrap {

    def init = { 
        def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
        def managerRole = new Role(authority: 'ROLE_MANAGER').save(flush: true)
        def sellerRole = new Role(authority: 'ROLE_SELLER').save(flush: true)
        def callCenterRole = new Role(authority: 'ROLE_CALL_CENTER').save(flush: true)

        def testUser = new User(username: 'me', password: 'password', authority: 'ROLE_ADMIN')
        testUser.save(flush: true)
        testUser.mergeAuthorities()
        testUser.enabled = true

        def testSeller = new User(username: 'he', password: 'password', authority: 'ROLE_SELLER')
        testSeller.save(flush: true)
        testSeller.mergeAuthorities()
        testSeller.enabled = true

        def testManager = new User(username: 'she', password: 'password', authority: 'ROLE_MANAGER')
        testManager.save(flush: true)
        testManager.mergeAuthorities()
        testManager.enabled = true

        assert User.count() == 3
        assert Role.count() == 4
        assert UserRole.count() == 3
    }
    def destroy = {

    }
}
