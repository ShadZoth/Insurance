package insurance

class Contact {

    String value
    Client client
    ContactType contactType

    static belongsTo = Client

    static constraints = {
        value()
        client()
        contactType()
    }

    private static enum ContactType {
        ADRESS, PHONE, EMAIL
    }

}
