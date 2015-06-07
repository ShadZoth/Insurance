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

    List<User> getDispatchers() {
        if (hasRoleService.serviceMethod(this, 'ROLE_MANAGER')) {
            return ManagerDispatcher.findAllByManager(this).dispatcher
        } else {
            return null
        }
    }

    void setDispatchers(List<User> dispatchers) {
        executeUpdate 'DELETE FROM ManagerDispatcher WHERE manager=:manager', [manager: this]
        for (User dispatcher : dispatchers) {
            addDispatcher(dispatcher)
        }
    }

    void addDispatcher(User dispatcher) {
        if (hasRoleService.serviceMethod(this, 'ROLE_MANAGER')
                && hasRoleService.serviceMethod(dispatcher, 'ROLE_DISPATCHER')
                && !dispatcher.manager) {
            new ManagerDispatcher(manager: this, dispatcher: dispatcher).save(flush: true, insert: true)
        }
    }

    void removeDispatcher(User dispatcher) {
        executeUpdate 'DELETE FROM ManagerDispatcher WHERE manager=:manager AND dispatcher=:dispatcher', [manager: this, dispatcher: dispatcher]
    }

    User getManager() { // SELLER only
        if (hasRoleService.serviceMethod(this, 'ROLE_DISPATCHER')) {
            return ManagerDispatcher.findByDispatcher(this)?.manager
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
                 'ROLE_DISPATCHER',
                 'ROLE_CALL_CENTER'],
                validator: { val, obj ->
                    if (SpringSecurityUtils.ifAnyGranted('ROLE_MANAGER')) {
                        return val == 'ROLE_DISPATCHER'
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
