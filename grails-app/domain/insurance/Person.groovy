package insurance

class Person extends Client {

    static hasMany = [licenses: License, passports: Passport]

    static constraints = {
    }


    @Override
    public String toString() {
        Passport passport = passports.findAll({
            it.person == id
            it.issueDate
        }).max(new Comparator<Passport>() {
            @Override
            int compare(Passport o1, Passport o2) {
                o2.issueDate - o1.issueDate
            }
        });

        passport.lastName + " " + passport.firstName
        + " " + passport.birthDate + " " + passport.number
    }
}
