package insurance

class Client {
    Date registrationDate
    Boolean archived

    static hasMany = [vehicles: Vehicle, contacts: Contact, warrants: Warrant]

    static constraints = {
        registrationDate(nullable: false)
        archived()
    }
}
