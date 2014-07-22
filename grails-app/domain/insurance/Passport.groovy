package insurance

class Passport implements Comparable<Passport> {

    String number
    Person person
    String lastName
    String firstName
    String fathName
    Date birthDate
    Date issueDate
    Sex sex

    static belongsTo = Person

    static constraints = {
        number(nullable: false)
        person()
        lastName(maxSize: 40)
        firstName(maxSize: 40)
        fathName(maxSize: 40, nullable: true)
        birthDate(nullable: false, shared: "upToDate")
        sex()
        issueDate(nullable: false, validator: {
            val, obj ->
                def greg = obj.birthDate.toCalendar()
                greg.add(Calendar.YEAR, 14)
                val >= greg.time && val <= new Date()
        })
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

    static searchable = true

    static mapping = {
        issueDate sqlType: "date"
        birthDate sqlType: "date"
    }

    @Override
    public String toString(){
        "$lastName $firstName $number"
    }

    @Override
    int compareTo(Passport o) {
        issueDate - o.issueDate
    }
}
