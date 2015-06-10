package insurance

import groovy.util.logging.Log4j

class Service {
    Client client
    String addressStart
    String addressEnd
    Date expectedStartTime
    Date realStartTime
    Date endTime
    Driver driver
    List<Category> cats = []
    Company otherCompany

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

    def getCategories() {
        if (cats) {
            def string = cats.toString()
            return string.substring(1, string.length() - 1)
        } else {
            return " - ";
        }
    }

    def updateCategories(Category category, boolean val) {
        if (checkCategories(category)) {
            if (!val) {
                cats.remove(category)
            }
        } else if (val) {
            cats.add(category)
        }
    }

    boolean checkCategories(Category category) {
        cats.contains(category)
    }

    def getValidDrivers() {
        Driver.list().find {
            vldt(it, this)
        }
    }

    boolean vldt(Driver d, Service s) {
        def res = true
        if (d) {
            s.cats.each {
                res &= d?.vehicle?.cats?.contains(it)
            }
        }
        res
    }

    static constraints = {
        client(nullable: false)
        expectedStartTime(nullable: false)
        addressStart(nullable: false)
        driver (
                nullable: true,
                validator: { val, obj ->
                    def res = true
                    if (val) {
                        obj.cats.each {
                            res &= val?.vehicle?.cats?.contains(it)
                        }
                    }
                    res
                }
        )
        otherCompany(
                nullable: true,
                validator: { val, obj ->
                    return !(val && obj.realStartTime)
                }
        )
        realStartTime(nullable: true)
        endTime(nullable: true)
    }

    @Override
    public String toString() {
        return id;
    }

    int getDuration() {
        if (endTime && realStartTime) {
            (endTime?.getTime() - realStartTime?.getTime()) / 1000 / 60
        } else {
            return 0
        }
    }


    String getPrice() {
        if (endTime && realStartTime) {
            return (driver && endTime && realStartTime) ? driver?.pricePerMinute * duration : null
        } else {
            return '0'
        }
    }

    def getAvailableDrivers() {
        def busyDrivers = Service.where {
            realStartTime == null || endTime != null
        }.list()?.driver?.id

        for (def a : busyDrivers) {
            Log4j.println(a)
        }

        return Driver.where {
            busyDrivers.contains(id) == false
        }
    }

    static searchable = true


}
