package insurance

class HasRoleServiceTagLib {

    def hasRoleService
    def usersHavingRole = { attrs ->
       out<< g.select([id: attrs.id, name: attrs.name, from:
                insurance.User.list().findAll {
                hasRoleService.serviceMethod(it, attrs.role)
            }, optionKey: attrs.optionKey, required: attrs.required,
                value: attrs.value, class: attrs.class])
    }
}
