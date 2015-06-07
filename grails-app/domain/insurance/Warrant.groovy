package insurance

class Warrant {

    Date issueDate
    Date expireDate
    BigDecimal price
    String number
    Client client
    Product product
    Vehicle vehicle

    static belongsTo = [Client, Product]

    static constraints = {
        number(editable: false, nullable: false)
        client()
        vehicle(validator: { val, obj -> obj.client.vehicles.contains(val) })
        product(validator: { val, obj ->
            switch (obj.client) {
                case Person: return val.individual; break;
                case Company: return val.corporate; break;
            }
        })
        issueDate(nullable: false, shared: 'upToDate')
        expireDate(nullable: false, validator: { val, obj ->
            val > obj.issueDate
        })
        price(min: 0.0)
        vehicle()
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
