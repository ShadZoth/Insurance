package insurance

class Payment {

    Date date
    BigDecimal amount
    Accident accident
    Warrant warrant

    static belongsTo = [Accident, Warrant]

    static constraints = {
        date(nullable: false)
        amount(nullable: false)
        accident()
        warrant()
    }
}
