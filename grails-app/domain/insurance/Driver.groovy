package insurance

class Driver {
    static hasOne = [vehicle:Vehicle]

    static constraints = {
        vehicle(nullable: true)
        // TODO: check passport
    }

    String getName() {
        toString()
    }

    Integer getPricePerMinute() {
        int res = 100 //TODO: Другая цена?
        vehicle?.cats?.each {
            res += it.price
        }
        res
    }

    static searchable = true

    static hasMany = [passports: Passport]

    def getSortedPassports() {
        passports?.sort()
    }

    @Override
    public String toString() {

        if (passports) {
            Passport passport = passports.findAll({
                it.driver.id == id
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
}