package insurance

class Payment {

    Date date
    BigDecimal amount
    Accident accident
    Warrant warrant

    static belongsTo = [Accident, Warrant]

    static constraints = {
        warrant validator: { val, obj ->
            val.vehicle == obj.accident.vehicle
        }
        accident validator: { val, obj ->
            val.vehicle == obj.warrant.vehicle
        }
        amount(nullable: false, min: 0.0)
        date(nullable: false)
    }

    static mapping = {
        // amount sqlType: "money", length: 10
        date sqlType: "timestamp without time zone"
    }

    static searchable = true

    @Override
    public String toString() {
        return "$date $warrant : $amount";
    }
}
