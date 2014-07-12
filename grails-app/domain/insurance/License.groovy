package insurance

class License {

    String number
    Date issueDate
    Date expirationDate
    Integer categories = 0
    Person owner

    String getCategories() {
        def res = new ArrayList<Category>()
        int cat = categories
        Category.values().each {
            if (cat % 2) {
                res.add(it)
            }
            cat /= 2
        }
        def rr = ""
        res.each { rr += "$it " }
        rr
    }

    //TODO: Категории пишутся пользователем через пробел.
    //TODO: Правильность ввода не проверяется. To be continued...
    void setCategories(String cat) {
        println cat
        def c = 0
        cat.split(" ").each {
            c += Category.valueOf(it).value
        }
        categories = c
    }

    static belongsTo = Person

    static constraints = {
        owner()
        number(nullable: false)
        issueDate(nullable: false)
        expirationDate()
        categories()
    }
}
