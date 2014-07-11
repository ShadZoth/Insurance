package insurance

class Client {
    Date registrationDate
    Boolean archived

    static hasMany = [vehicles: Vehicle]

    static constraints = {

    }
}
