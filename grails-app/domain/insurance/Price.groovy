package insurance

class Price {

    Date since
    BigDecimal value
    Product product
    static constraints = {
        product()
        since()
        value() // TODO: в БД определить как money
    }

    static belongsTo = Product
}
