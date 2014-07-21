package insurance

class Person extends Client {

    static hasMany = [licenses: License, passports: Passport]

    static constraints = {
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
