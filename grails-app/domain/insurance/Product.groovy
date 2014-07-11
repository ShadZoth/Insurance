package insurance

class Product {

    String name

    Boolean corporate

    Boolean individual

    static hasMany = {
        pricelist: Price
    }

    static constraints = {
    }
}
