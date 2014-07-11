package insurance

class Warrant {

    Date issueDate
    Date expireDate
    BigDecimal price
    String number
    Client client
    Product product

    static belongsTo = [Client, Product]

    static hasMany = [payments: Payment]

    static constraints = {
        client()
        product()
        issueDate(nullable: false)
        expireDate(nullable: false)
        price() // TODO: в БД определить как money
        number(nullable: false)
    }
}
