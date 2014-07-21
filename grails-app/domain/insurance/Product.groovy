package insurance

class Product {

    String name

    Boolean corporate

    Boolean individual

    static hasMany = [pricelist: Price]

    Price getCurrentPrice() {
        if (pricelist) {
            return pricelist.max(new Comparator<Price>() {
                @Override
                int compare(Price o1, Price o2) {
                    o1.since - o2.since
                }
            });
        } else {
            return null
        }
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
