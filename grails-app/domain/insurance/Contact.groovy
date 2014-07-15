package insurance

class Contact {

    String value
    Client client
    ContactType type

    String getEmail() {
        if (type == ContactType.EMAIL) {
            return value
        } else {
            return "1234@yandex.ru"
        }
    }

    static belongsTo = Client

    static transient

    static constraints = {
        value()
        email email: true
        client()
        type()
    }

    private static enum ContactType {
        ADDRESS("Адрес"), PHONE("Телефон"), EMAIL("Электронная почта")

        ContactType(String s) {
            russian = s
        }

        String russian

        String toString() {
            russian
        }
    }

    String toString() {
        "${type}: ${value}"
    }

}
