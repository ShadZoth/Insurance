package insurance

class Contact {
    String value
    ContactType type

    boolean deleted
    static transients = [ 'deleted' ]
    static belongsTo = [client:Client]

    String getEmail() {
        if (type == ContactType.EMAIL) {
            return value
        } else {
            return "1234@yandex.ru"
        }
    }

    static searchable = true


    static constraints = {
        value()
        email email: true
        client()
        type()
    }

    public static enum ContactType {
        ADDRESS("Адрес"), PHONE("Телефон"), EMAIL("Электронная почта")

        ContactType(String s) {
            russian = s
        }

        String russian

        String getKey(){
            name()
        }

        String toString() {
            russian
        }
    }

    String toString() {
        "${type}: ${value}"
    }

}
