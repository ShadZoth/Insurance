package insurance

class License {

    String number
    Date issueDate
    Date expirationDate
    int categories
    Person owner

    static belongsTo = Person

    static constraints = {
        owner()
        number(nullable: false)
        issueDate(nullable: false)
        expirationDate()
        categories() // TODO: Упаковать побитово - ?
    }
}
