import v.market.*

class BootStrap {

    def springSecurityService

    def init = { servletContext ->
        def samples = [
                'gabtorrespen',
        ]
        def samples2 = [
                'Exito',
        ]

        def userRole = SecRole.findByAuthority("ROLE_USER") ?: new SecRole(authority: "ROLE_USER").save()
        def adminRole = SecRole.findByAuthority("ROLE_ADMIN") ?: new SecRole(authority: "ROLE_ADMIN").save()

        def users = User.list() ?: []
        def stores = Almacen.list() ?: []

        if(!users){
            samples.each {username ->
                def user = new User(
                        username: username,
                        password: "12345",
                        passwordConfirm: "12345",
                        name: "gabriel",
                        lastname: "torres",
                        email: "gabtorrespen@unal.edu.co",
                        birthday: new Date(),
                        gender: "M",
                        age: 9
                )
                if (user.hasErrors()){
                    println("FIRST VALIDATION")
                    user.errors.each {
                        err ->
                            println(err)
                    }
                }
                if(user.validate()){
                    println("Creating user ${username}")
                    user.save(flush: true)
                    users << user

                    def role = SecRole.findByAuthority('ROLE_ADMIN')
                    SecUserSecRole.create user, role, true
                }
                else{
                    println("Error in account bootstrap for ${username}")
                    user.errors.each {
                        err ->
                            println(err)
                    }
                }
            }
        }

        // ALmacenes
        if(!stores) {
            samples2.each { name ->
                def store = new Almacen(
                        name: "Exito",
                        streetAddress: "Carrera 59A 79 - 30",
                        lat: "4.683649",
                        lng: "-74.079962",
                        almacenImage: new File('C:/Users/Damperius/Downloads/BogCpt0a13.jpg').getBytes()
                )
                if (store.validate()) {
                    println("Creating store ${name}")
                    store.save(flush: true)
                    stores << store
                } else {
                    println("Error in account bootstrap for ${name}")
                    store.errors.each {
                        err ->
                            println(err)
                    }
                }
            }
        }
        println(User.list())
    }



    def destroy = {
    }
}
