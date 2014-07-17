import insurance.Role
import insurance.User

class BootStrap {

    def init = { 
        def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
        def managerRole = new Role(authority: 'ROLE_MANAGER').save(flush: true)
        def sellerRole = new Role(authority: 'ROLE_SELLER').save(flush: true)
        def callCenterRole = new Role(authority: 'ROLE_CALL_CENTER').save(flush: true)

        def testUser = new User(username: 'me',
                password: 'password',
                authority: 'ROLE_ADMIN')
        testUser.save(flush: true)
        testUser.mergeAuthorities()
        testUser.enabled = true

        (1..2).collect {
            new User(username: "manager$it",
                    password: 'password',
                    authority: 'ROLE_MANAGER')
        }.each {
            it.save(flush: true)
            it.mergeAuthorities()
        }

        (1..4).collect {
            new User(username: "seller$it",
                    password: 'password',
                    authority: 'ROLE_SELLER')
        }.each {
            it.save(flush: true)
            it.mergeAuthorities()
        }
    }
    def destroy = {

    }
}
