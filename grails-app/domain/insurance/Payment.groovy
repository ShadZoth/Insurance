package insurance

class Payment {

    Date date
    BigDecimal amount
    Accident accident
    Warrant warrant

    static belongsTo = [Accident, Warrant]

    static constraints = {
        warrant()
        accident()
        amount(nullable: false)
        date(nullable: false)
    }

    static mapping = {
        // amount sqlType: "money", length: 10
        date sqlType: "timestamp without time zone"
    }


    @Override
    public String toString() {
        return "" + date + " " + warrant + ":" + amount;
    }
}
