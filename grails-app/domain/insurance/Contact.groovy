package insurance

class Contact {

    String value
    Client client
    ContactType type

    static belongsTo = Client

    static constraints = {
    }

    private static enum ContactType {
        ADRESS, PHONE, EMAIL
    }

}
