package insurance

class Price {

    Date since
    BigDecimal value
    Product product
    static constraints = {
        product()
        since()
        value()
    }

    static belongsTo = Product

    static mapping = {
        since sqlType: "date"
        value sqlType: "money"
    }
}
