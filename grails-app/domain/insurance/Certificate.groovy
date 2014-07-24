package insurance

class Certificate {

    String number
    String color
    Date issueDate
    String ownerFirstName
    String ownerLastName
    String vin
    Vehicle vehicle
    static def licensePlateRegexp = ~/([ABEKMHOPCTYXАВЕКМНОРСТУХ]{1}\d{3}[ABEKMHOPCTYXАВЕКМНОРСТУХ]{2}(\d{2,3}))|([ABEKMHOPCTYXАВЕКМНОРСТУХ]{2}\d{3}(\d{2,3}))|([ABEKMHOPCTYXАВЕКМНОРСТУХ]{2}\d{4}(\d{2,3}))|(\d{4}[ABEKMHOPCTYXАВЕКМНОРСТУХ]{2}(\d{2,3}))/

    static belongsTo = Vehicle

    static mapping = {
        issueDate sqlType: "date"
    }

    static searchable = true

    static constraints = {
        number(nullable: false, validator: { val, obj ->
            Boolean m = false
            val.toUpperCase().find(licensePlateRegexp) {
                match -> m = match
            }
            m
        })
        vehicle()
        color(maxSize: 18)
        issueDate(nullable: false, shared: 'upToDate')
        ownerFirstName(nullable: false, maxSize: 30)
        ownerLastName(nullable: false, maxSize: 30)
        vin(maxSize: 17)
    }


    @Override
    public String toString() {
        return "${vehicle}, ${number}";
    }
}
