package insurance

public enum Category {
    A(1), B(2), C(4), D(8), E(16), M(32), Tb(64), Tm(128)

    def value

    Category(def v) {
        value = v;
    }
}