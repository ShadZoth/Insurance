package insurance

class Manufacturer {

    String name
    static hasMany = [vehicles: Vehicle]
    static constraints = {
    }
}
