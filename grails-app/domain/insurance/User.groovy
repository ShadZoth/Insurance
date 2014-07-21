package insurance

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

class User  {

	transient springSecurityService
    def hasRoleService

    String username
	String password
    String authority
    boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

    List<User> getSellers() {
        if (hasRoleService.serviceMethod(this, 'ROLE_MANAGER')) {
            return ManagerSeller.findAllByManager(this).seller
        } else {
            return null
        }
    }

    void setSellers(List<User> sellers) {
        executeUpdate 'DELETE FROM ManagerSeller WHERE manager=:manager', [manager: this]
        for (User seller : sellers) {
            addSeller(seller)
        }
    }

    void addSeller(User seller) {
        if (hasRoleService.serviceMethod(this, 'ROLE_MANAGER')
                && hasRoleService.serviceMethod(seller, 'ROLE_SELLER')
                && !seller.manager) {
            new ManagerSeller(manager: this, seller: seller).save(flush: true, insert: true)
        }
    }

    void removeSeller(User seller) {
        executeUpdate 'DELETE FROM ManagerSeller WHERE manager=:manager AND seller=:seller', [manager: this, seller: seller]
    }

    User getManager() { // SELLER only
        if (hasRoleService.serviceMethod(this, 'ROLE_SELLER')) {
            return ManagerSeller.findBySeller(this)?.manager
        } else {
            return null
        }
    }

    static hasMany = [clients: Client]

    static constraints = {
		username blank: false, unique: true
		password blank: false
        authority(inList:
                ['ROLE_ADMIN',
                 'ROLE_MANAGER',
                 'ROLE_SELLER',
                 'ROLE_CALL_CENTER'],
                validator: { val, obj ->
                    if (SpringSecurityUtils.ifAnyGranted('ROLE_MANAGER')) {
                        return val == 'ROLE_SELLER'
                    }
                    return true
                })
    }

	static mapping = {
        table('`user`')
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}

    String toString() {
        username
    }

    void mergeAuthorities() {
        UserRole.removeAll(this)
        UserRole.create(this, Role.findByAuthority(authority), true)
    }
}
