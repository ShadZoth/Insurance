package insurance

import org.springframework.security.core.GrantedAuthority

class Role implements GrantedAuthority {

	String authority

	static mapping = {
        table('`role`')
		cache true
	}

	static constraints = {
		authority blank: false, unique: true
	}
}
