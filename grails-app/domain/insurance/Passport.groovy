package insurance

class Passport {

    String number
    Date issueDate
    String firstName
    String lastName
    Date birthDate
    Person person
    Sex sex

    static belongsTo = Person

    static constraints = {
    }

    private static enum Sex {
        MALE, FEMALE
    }
}
