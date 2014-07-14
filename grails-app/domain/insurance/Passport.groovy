package insurance

class Passport {

    String number
    Date issueDate
    String firstName
    String lastName
    String fathName
    Date birthDate
    Person person
    Sex sex

    static belongsTo = Person

    static constraints = {
        person()
        number(nullable: false)
        issueDate(nullable: false)
        firstName(maxSize: 40)
        lastName(maxSize: 40)
        fathName(maxSize: 40)
        birthDate(nullable: false)
        sex()
    }

    private static enum Sex {
        MALE("Мужской"), FEMALE("Женский")

        Sex(String s) {
            russian = s
        }

        String russian

        String toString() {
            russian
        }
    }

    static mapping = {
        issueDate sqlType: "date"
        birthDate sqlType: "date"
    }

    @Override
    public String toString(){
        "$lastName $firstName $number"
    }
}
