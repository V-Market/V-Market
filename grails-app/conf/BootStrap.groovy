import v.market.*

class BootStrap {

    def springSecurityService

    def init = { servletContext ->
        def samples = [
                'gabtorrespen',
        ]
        def samples2 = [
                [name:'Exito',addresss:'Cl. 74 #Carrera 28A - 06',latitud:"4.667970" , longitud:"-74.069777"],
                [name:'Exito',addresss:"Carrera 59A 79 - 30",latitud:"4.683649" , longitud:"-74.079962"],
                [name:'Exito',addresss:"Av. las americas #68A - 84",latitud:"4.6295696" , longitud:"-74.1246289"],
                [name:'Exito',addresss:"Carrera 78B #35 - 70",latitud:"4.6239553" , longitud:"-74.1483517"],
                [name:'Exito',addresss:"Carrera 78k #42S - 53",latitud:"4.6230303" , longitud:"-74.1544752"],
                [name:'Exito',addresss:"Cl 65 Sur #9-54",latitud:"4.6047479" , longitud:"-74.1835471"],
                [name:'Exito',addresss:"Carrera 86 #56BS-37",latitud:"4.641135" , longitud:"-74.1538064"],
                [name:'Exito',addresss:"Cra. 72a #23-83",latitud:"4.6595012" , longitud:"-74.118663"],
                [name:'Exito',addresss:"Carrera 68B #24-39",latitud:"4.6533344" , longitud:"-74.109127"],
                [name:'Exito',addresss:"Cl. 26 #62-47",latitud:"4.6481066" , longitud:"-74.1013781"],
                [name:'Exito',addresss:"Calle 20a Sur #5a-34",latitud:"4.5721946" , longitud:"-74.0917733"],
                [name:'Exito',addresss:"Cra. 7 #32-84",latitud:"4.6194227" , longitud:"-74.0675875"],
                [name:'Exito',addresss:"Cl. 52 #13-70",latitud:"4.6401947" , longitud:"-74.0660409"],
                [name:'Exito',addresss:"Entrada A La KR68 Al Sur #7",latitud:"4.5931677" , longitud:"-74.1238933"],
                [name:'Exito',addresss:"Cra. 13 #16",latitud:"4.5825327" , longitud:"-74.0970069"],
                [name:'Exito',addresss:"Transversal 31 #11 Sur-54",latitud:"4.598257" , longitud:"-74.1097288"],
                [name:'Exito',addresss:"Carrera 68c #79-30",latitud:"4.6836768" , longitud:"-74.0800589"],
                [name:'Exito',addresss:"Carrera 68 #4D-90",latitud:"4.6863989" , longitud:"-74.0742007"],
                [name:'Exito',addresss:"Avenida Calle 127 #202",latitud:"4.7030903" , longitud:"-74.041687"],
                [name:'Exito',addresss:"Cra. 9 #134",latitud:"4.7124885" , longitud:"-74.03312"],
                [name:'Exito',addresss:"Avenida Carrera 45 #172a-98",latitud:"4.7546986" , longitud:"-74.0445791"]
        ]

        def userRole = SecRole.findByAuthority("ROLE_USER") ?: new SecRole(authority: "ROLE_USER").save()
        def adminRole = SecRole.findByAuthority("ROLE_ADMIN") ?: new SecRole(authority: "ROLE_ADMIN").save()

        def carrito = Carrito.findById(1);
        if(carrito != null){
            println("Carrito cargado en Bootstrap")
        }else {
            carrito = new Carrito(current: true).save(flush: true);
            println("Carrito creado en Bootstrap")
        }

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

        // Almacenes
        if(!stores) {
            samples2.each { data ->
                def store = new Almacen(
                        name: data.name,
                        streetAddress: data.addresss,
                        lat: data.latitud,
                        lng: data.longitud,
                        almacenImage: new File('C:/Users/Gabriel/Pictures/flecchas.jpg').getBytes()
                )
                if (store.validate()) {
                    println("Creating store ${data.name}")
                    store.save(flush: true)
                    stores << store
                } else {
                    println("Error in account bootstrap for ${data.name}")
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
