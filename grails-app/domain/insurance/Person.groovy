package insurance

class Person extends Client {

    static hasMany = [licenses: License, passports: Passport]

    static constraints = {
    }
}
