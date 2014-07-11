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

    static constraints = {
        vehicle()
        number(nullable: false)
        color(size: 0..18)
        issueDate(nullable: false)
        ownerFirstName(nullable: false, maxSize: 30)
        ownerLastName(nullable: false, maxSize: 30)
        vin(maxSize: 17)
    }
}
