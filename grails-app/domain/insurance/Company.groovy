package insurance

class Company extends Client {

    String name
    String INN
    static hasMany = {
        representatives: Person
    }
    static constraints = {
    }
}
