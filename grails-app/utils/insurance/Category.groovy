package insurance

public enum Category {
    SEDAN(1), HATCHBACK(2), WAGON(4), VAN(8)

    def value

    Category(def v) {
        value = v;
    }
}