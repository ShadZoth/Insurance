package insurance

class Driver extends Person {

    static hasOne = [vehicle:Vehicle]

    static constraints = {
        vehicle(nullable: true)
    }

    Integer getPricePerMinute() {
        if (vehicle) {
            switch (vehicle.category) {
                case Category.CONDITIONER:
                    return 10;
                case Category.PREMIUM:
                    return 15;
                case Category.HUGEBACK:
                    return 20;
                case Category.VAN:
                    return 35;
                default:
                    return 100;
            }
        }
        return 0;
    }

    static searchable = true
}
