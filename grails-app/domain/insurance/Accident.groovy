package insurance

class Accident {

    Date dateTime
    BigDecimal damage
    Vehicle vehicle

    static belongsTo = Vehicle

    static hasMany = [payments: Payment]

    static constraints = {
        dateTime()
        damage()
        vehicle()
    }

    static mapping = {
        dateTime sqlType: "timestamp without time zone"
        damage sqlType: "money"
    }

    @Override
    public String toString() {
        return dateTime +
                " ["+
                vehicle +
                "] : " + damage;
    }
}
