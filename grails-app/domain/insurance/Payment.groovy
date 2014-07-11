package insurance

class Payment {

    Date date
    BigDecimal amount
    Accident accident

    static belongsTo = Accident

    static constraints = {
    }
}
