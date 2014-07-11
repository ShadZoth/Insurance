package insurance

class Vehicle {

    String model
    int year
    BigDecimal price
    Category category
    Client owner

    static belongsTo = Client
    static hasMany = [accidents: Accident, certificates: Certificate]

    static constraints = {
    }
}
