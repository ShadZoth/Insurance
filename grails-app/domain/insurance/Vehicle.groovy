package insurance

class Vehicle {

    String model
    int year
    BigDecimal price
    Category category
    Client owner
    Manufacturer manufacturer

    static belongsTo = [Client, Manufacturer]
    static hasMany = [accidents: Accident, certificates: Certificate]

    static constraints = {
        owner()
        model(maxSize: 30)
        year(min: 1900, Calendar.getInstance().get(Calendar.YEAR))
        price()
        category()
        manufacturer()
    }

    /*static mapping = {
        price sqlType: "money"
    }*/


    @Override
    public String toString() {
        "$manufacturer $model $year"
    }
}
