import insurance.*

class BootStrap {

    Random rand = new Random()

    List surnames = [
            "Ivanov" ,
            "Petrov" ,
            "Sidorov" ,
            "Sidel'nikov" ,
            "Kuvshivkin" ,
            "Shmakov" ,
            "Boriskin" ,
            "Kuchiev" ,
            "Luzhin" ,
            "Slyakotin" ,
            "Ponomaryov" ,
            "Kizyakov" ,
            "Sorotnikov" ,
            "Fomichov" ,
            "Isakov" ,
            "Dmitriev" ,
            "Gavrilov" ,
            "Bazhenov" ,
            "Magomedaliev" ,
            "Ibtyanov" ,
            "Tsmakalov",
            "Barishnikov",
            "Seleznev",
            "Pasternakov"
    ]

    List manNames = [
            "Alexandr",
            "Victor" ,
            "Semyon" ,
            "Grirogiy" ,
            "Georgiy" ,
            "Vasiliy" ,
            "Ivan" ,
            "Aleksey" ,
            "Gavrila" ,
            "Magomed" ,
            "Abdyla" ,
            "Aleksandr" ,
            "Dmitriy" ,
            "Sergey" ,
            "Mihail" ,
            "Mavrodiy" ,
            "Boris" ,
            "Arkadiy",
            "Oleg",
            "Veniamin",
            "Linus"
    ]

    List womanNames = [
            "Kristina" ,
            "Mariya" ,
            "Anfisa" ,
            "Izol'da" ,
            "Dazdraperma" ,
            "Lyudmila" ,
            "Nadezhda" ,
            "Nataliya" ,
            "Natal'ya" ,
            "Ekaterina" ,
            "Marina" ,
            "Zulphiya" ,
            "Polina" ,
            "Ol'ga" ,
            "Anastasiya" ,
            "Valeriya"

    ]

    List universalFathNames = [
            "Borisov" ,
            "Kirillov" ,
            "Semyonov" ,
            "Vitaliev" ,
            "Dmitriev" ,
            "Arkad'ev" ,
            "Grigor'ev" ,
            "Kazbekov" ,
            "Olegov" ,
            "Edgarov" ,
            "Anatol'ev" ,
            "Maximov",
            "Leontyev"
    ]

    List sexer = ["na" , "ich" , "a"]

    List companiesNameParts = [
            "ko",
            "pa",
            "za",
            "cha",
            "gri",
            "bee",
            "zui",
            "chi",
            "pjo",
            "go",
            "loo",
            "stro",
            "chto",
            "ber",
            "dang",
            "uber",
            "croy",
            "bon"
    ]

    def init = {
        new Role(authority: 'ROLE_ADMIN').save(flush: true)
        new Role(authority: 'ROLE_MANAGER').save(flush: true)
        new Role(authority: 'ROLE_SELLER').save(flush: true)
        new Role(authority: 'ROLE_CALL_CENTER').save(flush: true)

        def testUser = new User(username: 'me',
                password: 'password',
                authority: 'ROLE_ADMIN')
        testUser.save(flush: true)
        testUser.mergeAuthorities()
        testUser.enabled = true

        (1..2).collect {
            new User(username: "manager$it",
                    password: 'password',
                    authority: 'ROLE_MANAGER')
        }.each {
            it.save(flush: true)
            it.mergeAuthorities()
            it.enabled = true
        }

        (1..4).collect {
            [new User(username: "seller$it",
                    password: 'password',
                    authority: 'ROLE_SELLER'),
             User.findByUsername("manager${(it % 2) + 1}")]
        }.each {
            it[0].save(flush: true)
            it[0].mergeAuthorities()
            it[0].enabled = true
            it[1].addSeller(it[0])
        }

        (1..2).collect {
            new User(username: "call_center$it",
                    password: 'password',
                    authority: 'ROLE_CALL_CENTER')
        }.each {
            it.save(flush: true)
            it.mergeAuthorities()
            it.enabled = true
        }


        // Генерирует мужчин (быдлокод)
        (1..75).each {
            User seller = findSeller(it)
            def p = new Person(seller: seller)
            p.save(flush: true)
            def birthDate = new Date().toCalendar()
            birthDate.add(Calendar.YEAR, -18)
            def issueDate = new Date().toCalendar()
            issueDate.add(Calendar.YEAR, -4)
            def pass = new Passport(number: it,
                    person: p,
                    lastName: surnames.get(rand.nextInt(surnames.size())),
                    firstName: manNames.get(rand.nextInt(manNames.size())),
                    fathName: "${universalFathNames.get(rand.nextInt(universalFathNames.size()))}${sexer.get(1)}",
                    birthDate: birthDate.time,
                    sex: Passport.Sex.MALE,
                    issueDate: issueDate.time)
            pass.save(flush: true)
        }


        // Генерирует женщин (быдлокод)
        (76..150).each {
            User seller = findSeller(it)
            def p = new Person(seller: seller)
            p.save(flush: true)
            def birthDate = new Date().toCalendar()
            birthDate.add(Calendar.YEAR, -18)
            def issueDate = new Date().toCalendar()
            issueDate.add(Calendar.YEAR, -4)
            def pass = new Passport(number: it,
                    person: p,
                    lastName: "${surnames.get(rand.nextInt(surnames.size()))}${sexer.get(2)}",
                    firstName: womanNames.get(rand.nextInt(womanNames.size())),
                    fathName: "${universalFathNames.get(rand.nextInt(universalFathNames.size()))}${sexer.get(0)}",
                    birthDate: birthDate.time,
                    sex: Passport.Sex.FEMALE,
                    issueDate: issueDate.time)
            pass.save(flush: true)
        }

        // Генерирует названия компаний и ИНН (быдлокод не меньший, чем выше)
        (151..200).collect {
            new Company(name: nextName,
                    inn: "${it}${1000000000 - rand.nextInt(99999999)}",
                    seller: findSeller(it))
        }*.save()

        ["OSAGO", "KASKO"].each {
            def p = new Product(name: it, individual: true, corporate: true)
            p.save(flush: true)
            new Price(value: 1500, since: new Date().toCalendar().time, product: p).save()
        }

        ["Holden",
         "Tickford",
         "Ford Performance Vehicles",
         "Ford Australia",
         "Anasagasti",
         "Autoar",
         "Crespi",
         "Hispano-Argentina",
         "Agrale",
         "Lobini",
         "MP-Lafer",
         "TAC Motors",
         "Troller",
         "AC",
         "Allard",
         "Alvis",
         "Armstrong Siddeley",
         "Ascari",
         "Aston Martin",
         "Austin-Healey",
         "Bentley Motors",
         "Bristol",
         "British Leyland",
         "Caterham",
         "Daimler",
         "Elva",
         "Ginetta",
         "Gordon Keeble",
         "Hillman",
         "Humber",
         "Jaguar",
         "Jensen",
         "Jowett",
         "Lanchester",
         "Land Rover",
         "Lister",
         "Lotus",
         "Marcos",
         "MG",
         "MG Cars",
         "Mini Cooper",
         "Morgan",
         "Morris",
         "Noble",
         "Riley",
         "Rolls Royce",
         "Rover",
         "Singer",
         "Sunbeam",
         "Triumph",
         "Trojan",
         "TVR",
         "Vauxhall",
         "Wolseley"].collect {
            new Manufacturer(name: it)
        }*.save()
    }

    private String getNextName() {
        "${nextSyllable}${nextSyllable}${nextSyllable}".capitalize()
    }

    private getNextSyllable() {
        companiesNameParts.get(rand.nextInt(companiesNameParts.size()))
    }

    static def hasRoleService
    private static User findSeller(int i) {
        def sellers = User.list().findAll {
            hasRoleService.serviceMethod(it, 'ROLE_SELLER')
        }
        def seller = sellers.get(i % sellers.size())
        seller
    }

    def destroy = {

    }
}
