package insurance

class Person {

    static hasMany = [passports: Passport]

    def getSortedPassports() {
        passports?.sort()
    }

    static constraints = {
        passports(size: 1..100)
    }


    @Override
    public String toString() {

        if (passports) {
            Passport passport = passports.findAll({
                it.person == id
                it.issueDate
            }).max(new Comparator<Passport>() {
                @Override
                int compare(Passport o1, Passport o2) {
                    o1.issueDate - o2.issueDate
                }
            });

            return "${passport.lastName} ${passport.firstName.charAt(0)}. ${passport.fathName.charAt(0)}."
        } else
            return "id${id}: Информация о паспортных данных не предоставлена"
    }

    static searchable = true
}
