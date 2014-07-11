package insurance

class Price {

    Date since
    BigDecimal value
    Product product
    static constraints = {
    }

    static belongsTo = Product
}
