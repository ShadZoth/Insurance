package insurance

class Certificate {

    String number
    String color
    Date issueDate
    String ownerFirstName
    String ownerLastName
    String vin
    Vehicle vehicle

    static belongsTo = Vehicle

    static mapping = {
        issueDate sqlType: "date"
    }

    static searchable = true

    static constraints = {
        number(nullable: false)
        vehicle()
        color(maxSize: 18)
        issueDate(nullable: false, shared: 'upToDate')
//                validator: {val, obj ->
//                    moreThanLast(val, obj) && upToDate(val)
//                })
        ownerFirstName(nullable: false, maxSize: 30)
        ownerLastName(nullable: false, maxSize: 30)
        vin(maxSize: 17)
    }


    @Override
    public String toString() {
        return "${vehicle}, ${number}";
    }
}
