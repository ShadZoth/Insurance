package insurance

class Warrant {

    Date issueDate
    Date expireDate
    BigDecimal price
    String number
    Client client

    static belongsTo = Client

    static hasMany = [payments: Payment]

    static constraints = {
    }
}
