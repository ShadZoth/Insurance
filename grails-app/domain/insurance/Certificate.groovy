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
        number(nullable: false)
        vehicle()
        color(size: 0..18)
        issueDate(nullable: false)
        ownerFirstName(nullable: false, maxSize: 30)
        ownerLastName(nullable: false, maxSize: 30)
        vin(maxSize: 17)
    }


    @Override
    public String toString() {
        return vehicle +
                " : " + number;
    }
}
