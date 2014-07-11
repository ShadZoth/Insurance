package insurance

class Passport {

    String number
    Date issueDate
    String firstName
    String lastName
    Date birthDate

    static constraints = {
    }

    private static enum Sex {
        MALE, FEMALE
    }
}
