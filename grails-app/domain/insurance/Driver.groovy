package insurance

class Driver extends Person {

    static hasOne = [vehicle:Vehicle]

    static constraints = {
        vehicle(nullable: true)
    }

    Integer getPricePerMinute() {
        if (vehicle) {
            switch (vehicle.category) {
                case Category.SEDAN:
                    return 10;
                case Category.HATCHBACK:
                    return 15;
                case Category.WAGON:
                    return 20;
                case Category.VAN:
                    return 35;
                default:
                    return 0;
            }
        }
        return 0;
    }

    static searchable = true
}
