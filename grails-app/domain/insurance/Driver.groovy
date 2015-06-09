package insurance

class Driver extends Person {

    static hasOne = [vehicle:Vehicle]

    static constraints = {
        vehicle(nullable: true)
    }

    Integer getPricePerMinute() {
        int res = 100 //TODO: Другая цена?
        vehicle?.categories?.each {
            res += it.price
        }
        res
    }

    static searchable = true
}
