package insurance

class Warrant {

    Date issueDate
    Date expireDate
    BigDecimal price
    String number
    Client client
    Product product
    //TODO: Vehicle vehicle??

    static belongsTo = [Client, Product]

    static hasMany = [payments: Payment]

    static constraints = {
        number(editable: false, nullable: false)
        client()
        product() //TODO: Констрейнт individual corporate
        issueDate(nullable: false, shared: 'upToDate')
        expireDate(nullable: false, validator: { val, obj ->
            val > obj.issueDate
        })
        price()
    }

    static mapping = {
        //    price sqlType: "money"
        issueDate sqlType: "date"
        expireDate sqlType: "date"
    }

    static searchable = true

    @Override
    public String toString() {
        return number;
    }

    String getNumber() {
        return "WR-2014-${get4Id()}"
    }

    /**
     * Возвращает id приведенный к формату 0..id (4 символа)
     * @return id приведенный к формату 0..id (4 символа)
     */
    String get4Id() {
        StringBuilder result = new StringBuilder("0000")
        result.append(id)
        result.substring(result.length() - 4, result.length())
    }
}
