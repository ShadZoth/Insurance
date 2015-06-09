package insurance

class Vehicle {

    String model
    int year
    List<Category> categories = []
    Driver owner
    Manufacturer manufacturer

    //CONDITIONER(1), SMOKING(2), CHILDREN(4), HUGEBACK(8), VAN(16), PREMIUM(32), DISABLED(64), VIP(128)

    boolean isConditioner() {
        checkCategories(Category.CONDITIONER)
    }

    void setConditioner(boolean val) {
        updateCategories(Category.CONDITIONER, val)
    }

    boolean isSmoking() {
        checkCategories(Category.SMOKING)
    }

    void setSmoking(boolean val) {
        updateCategories(Category.SMOKING, val)
    }

    boolean isChildren() {
        checkCategories(Category.CHILDREN)
    }

    void setChildren(boolean val) {
        updateCategories(Category.CHILDREN, val)
    }

    boolean isHugeBack() {
        checkCategories(Category.HUGEBACK)
    }

    void setHugeBack(boolean val) {
        updateCategories(Category.HUGEBACK, val)
    }

    boolean isVan() {
        checkCategories(Category.VAN)
    }

    void setVan(boolean val) {
        updateCategories(Category.VAN, val)
    }

    boolean isPremium() {
        checkCategories(Category.PREMIUM)
    }

    void setPremium(boolean val) {
        updateCategories(Category.PREMIUM, val)
    }

    boolean isDisabled() {
        checkCategories(Category.DISABLED)
    }

    void setDisabled(boolean val) {
        updateCategories(Category.DISABLED, val)
    }

    boolean isVip() {
        checkCategories(Category.VIP)
    }

    void setVip(boolean val) {
        updateCategories(Category.VIP, val)
    }

    def updateCategories(Category category, boolean val) {
        if (checkCategories(category)) {
            if (!val) {
                categories.remove(category)
            }
        } else if (val) {
            categories.add(category)
        }
    }

    boolean checkCategories(Category category) {
        categories.contains(category)
    }

    static belongsTo = [Driver, Manufacturer]
    static hasMany = [certificates: Certificate]

    static constraints = {
        model(maxSize: 30)
        year(min: 1900, max: Calendar.getInstance().get(Calendar.YEAR))
        manufacturer()
    }

    static searchable = true


    @Override
    public String toString() {
        "$manufacturer $model $year"
    }
}
