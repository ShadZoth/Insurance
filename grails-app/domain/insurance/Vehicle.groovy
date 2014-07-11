package insurance

class Vehicle {

    String model
    int year
    BigDecimal price
    Category category
    Client owner
    Manufacturer manufacturer

    static belongsTo = [Client, Manufacturer]
    static hasMany = [accidents: Accident, certificates: Certificate]

    static constraints = {
    }
}
