package insurance

class Accident {

    Date dateTime
    BigDecimal damage
    Vehicle vehicle

    static searchable = true

    static belongsTo = Vehicle

    static hasMany = [payments: Payment]

    static constraints = {
        vehicle()
        dateTime()
        damage()
    }

    static mapping = {
        dateTime sqlType: "timestamp without time zone"
        // damage sqlType: "money"
    }

    @Override
    public String toString() {
        return "$dateTime [$vehicle] : $damage";
    }
}
