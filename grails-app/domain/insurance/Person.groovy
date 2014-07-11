package insurance

class Person extends Client {

    static hasMany = [licenses: License]

    static constraints = {
    }
}
