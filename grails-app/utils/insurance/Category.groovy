package insurance

import org.codehaus.groovy.grails.plugins.web.taglib.FormatTagLib

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

    @Override
    String toString() {

        switch (this) {
            case CONDITIONER:
                return getMessage("conditioner")
            case SMOKING:
                return getMessage("smoking")
            case CHILDREN:
                return getMessage("children")
            case HUGEBACK:
                return getMessage("hugeBack")
            case VAN:
                return getMessage("van")
            case PREMIUM:
                return getMessage("premium")
            case DISABLED:
                return getMessage("disabled")
            case VIP:
                return getMessage("vip")
            default:
                return super.toString()
        }
    }

    private static String formString(String fieldName) {
        "vehicle.${fieldName}.label"
    }

    private String getMessage(String s) {
        VehicleController.messageSource.getMessage(
                formString(s),
                new Object[0],
                super.toString(),
                FormatTagLib.resolveLocale(null)
        )
    }
}