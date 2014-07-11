package insurance

class Payment {

    Date date
    BigDecimal amount
    Accident accident
    Warrant warrant

    static belongsTo = [Accident, Warrant]

    static constraints = {
    }
}
