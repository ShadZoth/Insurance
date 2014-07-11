package insurance

class Contact {

    String value
    Client client

    static belongsTo = Client

    static constraints = {
    }

    private static enum ContactType {
        ADRESS, PHONE, EMAIL
    }

}
