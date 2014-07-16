package insurance

class User {

	transient springSecurityService

	String username
	String password
    String authority
    boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
    List<User> sellers = []//Manager only

    List<User> getSellers() {
        if (hasRole('ROLE_MANAGER')) {
            return sellers
        } else {
            return null
        }
    }

    void setSellers(List<User> sellers) {
        this.sellers = []
        for (User seller : sellers) {
            addSeller(seller)
        }
    }

    void addSeller(User seller) {
        if (hasRole('ROLE_MANAGER')
                && seller.hasRole('ROLE_SELLER')
                && !seller.manager) {
            sellers.add(seller)
        }
    }

    void removeSeller(User seller) {
        sellers.remove(seller)
    }

    User getManager() { // SELLER only
        if (hasRole('ROLE_SELLER')) {
            return list().find {
                it.sellers && it.sellers.contains(this)
            }
        } else {
            return null
        }
    }

    boolean hasRole(String authority) {
        for (Role r : authorities) {
            if (r.authority.equals(authority)) {
                return true
            }
        }
        return false
    }

    static hasMany = [clients: Client]

    static constraints = {
		username blank: false, unique: true
		password blank: false
        authority(inList:
                ['ROLE_ADMIN',
                 'ROLE_MANAGER',
                 'ROLE_SELLER',
                 'ROLE_CALL_CENTER'])
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
