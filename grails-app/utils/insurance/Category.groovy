package insurance

public enum Category {
    CONDITIONER(1), SMOKING(2), CHILDREN(4), HUGEBACK(8), VAN(16), PREMIUM(32), DISABLED(64), VIP(128)

    int value

    Category(def v) {
        value = v;
    }
}