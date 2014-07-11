package insurance

class Company extends Client {

    String name
    String inn

    static constraints = {
        name(nullable: false, maxSize: 30)
        inn(nullable: false, size: 10..12)
    }
}
