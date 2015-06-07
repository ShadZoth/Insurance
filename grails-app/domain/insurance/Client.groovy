package insurance

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

class Client extends Person {
    Date registrationDate = new Date(Calendar.getInstance().get(Calendar.YEAR) - 1900, Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH))
    Boolean archived = false
    User dispatcher

    static belongsTo = User

    Date getRegistrationDate() {
        return registrationDate
    }

    void setRegistrationDate(Date registrationDate) {
        this.registrationDate = registrationDate
    }

    static searchable = true

    static mapping = {
        tablePerHierarchy(true)
        registrationDate sqlType: "date"
    }

    static hasMany = [contacts: Contact]

    //def hasRoleService
    static constraints = {
        registrationDate(nullable: false)
        archived()
        dispatcher(validator: { val, obj ->
            def authority = "ROLE_DISPATCHER"
            SpringSecurityUtils.authoritiesToRoles(val.authorities).contains(authority)
//            obj.hasRoleService.serviceMethod(val, authority) почему то не работает, а должно
        })
    }


    @Override
    public String toString() {
        return "";
    }
}
