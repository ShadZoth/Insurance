package insurance

class Client {
    Date registrationDate
    Boolean archived

    static mapping = {
        tablePerHierarchy(false)
    }

    static hasMany = [vehicles: Vehicle, contacts: Contact, warrants: Warrant]

    static constraints = {
        registrationDate(nullable: false)
        archived()
    }
}
