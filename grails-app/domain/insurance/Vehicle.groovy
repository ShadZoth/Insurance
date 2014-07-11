package insurance

class Vehicle {

    String model

    int year

    BigDecimal price

    static hasMany = [accidents: Accident]

    static constraints = {
    }
}
