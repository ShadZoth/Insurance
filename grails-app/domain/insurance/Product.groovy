package insurance

class Product {

    String name
    Boolean corporate
    Boolean individual

    static hasMany = [pricelist: Price]

    // Возвращает последнюю цену
    Price getCurrentPrice() {
        pricelist?.max()
    }

    // Возвращает цены, отсортированные по дате
    Price getSortedPricelist() {
       pricelist?.sort()
    }

    static constraints = {
        name(nullable: false)
        corporate()
        individual()
    }

    static searchable = true

    @Override
    public String toString() {
        return name;
    }
}