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


    @Override
    public String toString() {
        return "" + date + " " + warrant + ":" + amount;
    }
}
