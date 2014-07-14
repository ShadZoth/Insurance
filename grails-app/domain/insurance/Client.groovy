package insurance

class Client {
    Date registrationDate = new Date(Calendar.getInstance().get(Calendar.YEAR) - 1900, Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH))
    Boolean archived

    Date getRegistrationDate() {
        return registrationDate
    }

    void setRegistrationDate(Date registrationDate) {

    }

    static mapping = {
        tablePerHierarchy(true)
        registrationDate  sqlType: "date"
    }

    static hasMany = [vehicles: Vehicle, contacts: Contact, warrants: Warrant]

    static constraints = {
        registrationDate(nullable: false)
        archived()
    }


    @Override
    public String toString() {
        return "";
    }
}
