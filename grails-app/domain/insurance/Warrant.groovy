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
        number(readonly:true,  nullable: false)
        client()
        product()
        issueDate(nullable: false)
        expireDate(nullable: false)
        price() // TODO: в БД определить как money
    }

    static mapping = {
        //    price sqlType: "money"
        issueDate sqlType: "date"
        expireDate sqlType: "date"
    }


    @Override
    public String toString() {
        return number;
    }
}
