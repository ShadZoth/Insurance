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
        dateTime shared: 'upToDate'
        damage(min: 0.0)
    }

    static mapping = {
        dateTime sqlType: "date"
        // damage sqlType: "money"
    }

    @Override
    public String toString() {
        return "$dateTime [$vehicle] : $damage";
    }
}
