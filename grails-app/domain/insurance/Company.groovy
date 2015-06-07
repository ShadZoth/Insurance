package insurance

class Company {

    String name
    String inn

    static constraints = {
        name(nullable: false, maxSize: 30)
        inn(nullable: false, size: 10..12)
    }

    static searchable = true

    @Override
    public String toString() {
        return name;
    }
}
