package insurance

class Client {
    Date registrationDate
    Boolean archived

    static hasMany = [vehicles: Vehicle, contacts: Contact]

    static constraints = {

    }
}
