package insurance

class Accident {

    Date dateTime
    BigDecimal damage
    Vehicle vehicle

    static belongsTo = Vehicle

    static constraints = {
    }
}
