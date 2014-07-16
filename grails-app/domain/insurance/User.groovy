package insurance

class User {

	transient springSecurityService

	String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
    List<User> sellers //BOSS only

    List<User> getSellers() {
        if (hasRole('ROLE_MANAGER')) {
            return sellers
        } else {
            return null
        }
    }

    void setSellers(List<User> sellers) {
        if (hasRole('ROLE_MANAGER')) {
            this.sellers = sellers
        } else {
            this.sellers = null
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
}
