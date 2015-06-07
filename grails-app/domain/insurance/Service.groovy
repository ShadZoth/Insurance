package insurance

class Service {
    Client client
    String addressStart
    String addressEnd
    Date expectedStartTime
    Date realStartTime
    Date endTime
    Driver driver

    static constraints = {
        client(nullable: false)
        expectedStartTime(nullable: false)
        addressStart(nullable: false)
    }

    static mapping = {
        expectedStartTime sqlType: "date"
        realStartTime sqlType: "date"
        endTime sqlType: "date"
    }

    @Override
    public String toString() {
        return id;
    }

    int getPrice() {
        return driver.pricePerMinute * ((endTime.getTime() - realStartTime.getTime()) / 1000 / 60);
    }

    static searchable = true


}
