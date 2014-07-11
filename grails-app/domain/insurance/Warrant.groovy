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
    }
}
