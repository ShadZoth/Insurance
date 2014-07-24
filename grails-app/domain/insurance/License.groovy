package insurance

import static insurance.Category.*

class License implements Comparable<License> {

    String number
    Date issueDate
    Integer categories = 0
    Person owner

    Date getExpirationDate() {
        if (issueDate) {
            def res = issueDate.toCalendar()
            res.add(Calendar.YEAR, 10)
            return res.time
        } else {
            return new Date()
        }
    }

    Set<Category> getCategories() {
        def res = new TreeSet<Category>()
        int cat = categories
        Category.values().each {
            if (cat % 2) {
                res.add(it)
            }
            cat /= 2
        }
        res
    }

    String cats() { getCategories().toString() }

    Boolean getA() {
        gCategory(A)
    }

    void setA(Boolean b) {
        sCategory(b, A)
    }

    Boolean getB() {
        gCategory(B)
    }

    void setB(Boolean b) {
        sCategory(b, B)
    }

    Boolean getC() {
        gCategory(C)
    }

    void setC(Boolean b) {
        sCategory(b, C)
    }

    Boolean getD() {
        gCategory(D)
    }

    void setD(Boolean b) {
        sCategory(b, D)
    }

    Boolean getE() {
        gCategory(E)
    }

    void setE(Boolean b) {
        sCategory(b, E)
    }

    Boolean getTb() {
        gCategory(Tb)
    }

    void setTb(Boolean b) {
        sCategory(b, Tb)
    }

    Boolean getTm() {
        gCategory(Tm)
    }

    void setTm(Boolean b) {
        sCategory(b, Tm)
    }

    private boolean gCategory(Category categories) {
        getCategories().contains(categories)
    }

    private void sCategory(boolean b, Category category) {
        Set<Category> c = getCategories()
        if (b) {
            c.add(category)
        } else if (gCategory(category)) {
            c.remove(category)
        }
        setCategories(c)
    }

    void setCategories(Set<Category> cat) {
        def c = 0
        cat.each {
            c += it.value
        }
        categories = c
    }

    static belongsTo = Person

    static searchable = true

    static constraints = {
        number(nullable: false, unique: true)
        owner()
        issueDate(nullable: false, shared: 'upToDate')
        expirationDate()
        categories validator: { val, obj -> (obj.a || obj.b || obj.c || obj.d || obj.e || obj.tb || obj.tm) }
    }

    static mapping = {
        issueDate sqlType: "date"
        expirationDate sqlType: "date"
    }


    @Override
    public String toString() {
        "${owner} ${number}"
    }

    @Override
    int compareTo(License o) {
        issueDate - o.issueDate
    }
}
