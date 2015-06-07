package insurance

class Vehicle {

    String model
    int year
    Category category
    Driver owner
    Manufacturer manufacturer

    static belongsTo = [Driver, Manufacturer]
    static hasMany = [certificates: Certificate]

    static constraints = {
        model(maxSize: 30)
        year(min: 1900, max: Calendar.getInstance().get(Calendar.YEAR))
        category()
        manufacturer()
    }

    static searchable = true


    @Override
    public String toString() {
        "$manufacturer $model $year"
    }
}
