import insurance.*

class BootStrap {

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

        def birthDate = new Date().toCalendar()
        birthDate.add(Calendar.YEAR, -18)
        def issueDate = new Date().toCalendar()
        issueDate.add(Calendar.YEAR, -4)

        (1..150).each {
            def i = it
            User seller = findSeller(i)
            def p = new Person(seller: seller)
            p.save(flush: true)
            def pass = new Passport(number: it,
                    person: p,
                    lastName: "Ivanov$it",
                    firstName: "Ivan$it",
                    fathName: "Ivanvich$it",
                    birthDate: birthDate.time,
                    sex: Passport.Sex.MALE,
                    issueDate: issueDate.time)
            pass.save(flush: true)
        }

        (151..200).collect {
            new Company(name: "Company$it",
                    inn: "${it}${it}${it}${it}",
                    seller: findSeller(it))
        }*.save()

        def p = new Product(name: "Product1",
                individual: true,
                corporate: false)
        p.save(flush: true)

        (1..2).collect {
            def expireDate = new Date().toCalendar()
            expireDate.add(Calendar.MONTH, 1)
            new Warrant(issueDate: new Date().toCalendar().time,
                    expireDate: expireDate.time,
                    price: 100500,
                    number: 6538,
                    client: Person.list()[it],
                    product: p)
        }*.save(flush: true)
    }

    private static User findSeller(int i) {
        def sellers = User.list().findAll {
            it.hasRole('ROLE_SELLER')
        }
        def seller = sellers.get(i % sellers.size())
        seller
    }

    def destroy = {

    }
}
