package insurance

import grails.transaction.Transactional
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

@Transactional
class HasRoleService {

    def serviceMethod(User user, String authority) {
        SpringSecurityUtils.authoritiesToRoles(user.authorities).contains(authority)
    }
}
