package insurance

class Vehicle {

    String model
    int year
    BigDecimal price
    Category category

    static hasMany = [accidents: Accident]

    static constraints = {
    }
}
