package insurance

import org.springframework.security.core.context.SecurityContextHolder

class HasRoleServiceTagLib {

    def hasRoleService
    def usersHavingRole = { attrs ->
       out<< g.select([id: attrs.id, name: attrs.name, from:
               User.list().findAll {
                   if (attrs.onlyMe) {
                       def me = User.findByUsername(SecurityContextHolder.getContext().getAuthentication().getPrincipal().username)
                       return it == me
                   } else {
                       return hasRoleService.serviceMethod(it, attrs.role)
                   }
               }, optionKey: attrs.optionKey, required: attrs.required,
                value: attrs.value, class: attrs.class])
    }
}
