package insurance

public enum Category {
    //TODO: Другие цены?
    CONDITIONER(10),
    SMOKING(10),
    CHILDREN(10),
    HUGEBACK(10),
    VAN(10),
    PREMIUM(10),
    DISABLED(10),
    VIP(10)

    int price

    Category(def v) {
        price = v;
    }
}
