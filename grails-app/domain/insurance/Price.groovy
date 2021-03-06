package insurance

class Price implements Comparable<Price> {

    Date since
    BigDecimal value
    Product product
    static constraints = {
        product()
        since validator: { val, obj ->
            def lil = new Date(Calendar.getInstance().get(Calendar.YEAR) - 1900,
                    Calendar.getInstance().get(Calendar.MONTH),
                    Calendar.getInstance().get(Calendar.DAY_OF_MONTH))
            def res = val >= lil
            return res
        }
        value(min: 0.0) // TODO: в БД определить как money
    }

    static belongsTo = [Product]

    static mapping = {
        since sqlType: "date"
        // value sqlType: "money"
    }

    static searchable = true

    @Override
    public String toString() {
        return "$value руб.";
    }

    @Override
    int compareTo(Price o) {
        since - o.since
    }
}