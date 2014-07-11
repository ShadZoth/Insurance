package insurance

class Certificate {

    String number
    String color
    Date issueDate
    String ownerFirstName
    String ownerLastName
    String VIN
    Vehicle vehicle

    static belongsTo = Vehicle

    static constraints = {
    }
}
