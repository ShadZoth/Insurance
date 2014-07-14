package insurance

class Product {

    String name

    Boolean corporate

    Boolean individual

    static hasMany = {
        pricelist: Price
    }

    static constraints = {
        name(nullable: false)
        corporate()
        individual()
    }


    @Override
    public String toString() {
        return name;
    }
}
