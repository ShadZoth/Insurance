package insurance

class License {

    String number
    Date issueDate
    Date expirationDate
    //TODO: Категории будут правильно преобразованы в битмапу.
    //TODO: Предупреждение у констрейнта, вероятно, не пропадёт
    Integer categories
    Person owner

    Set<Category> getCategories() {
        def res = new HashSet<Category>()
        int cat = categories
        Category.values().each {
            if (cat % 2) {
                res.add(it)
            }
            cat /= 2
        }
        res
    }

    void setCategories(Set<Category> cat) {
        categories = 0;
        for (Category c : cat) {
            categories += c.value
        }
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
