package insurance

class Client {
    Date registrationDate = new Date(Calendar.getInstance().get(Calendar.YEAR) - 1900, Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH))
    Boolean archived = false
    User seller

    static belongsTo = User

    Date getRegistrationDate() {
        return registrationDate
    }

    void setRegistrationDate(Date registrationDate) {

    }

    static searchable = true

    static mapping = {
        tablePerHierarchy(true)
        registrationDate sqlType: "date"
    }

    static hasMany = [vehicles: Vehicle, contacts: Contact, warrants: Warrant]

    static def hasRoleService
    static constraints = {
        registrationDate(nullable: false)
        archived()
        seller(validator: { val, obj ->
            def authority = "ROLE_SELLER"
            return hasRoleService.serviceMethod(val, authority)
        })
    }


    @Override
    public String toString() {
        return "";
    }
}
