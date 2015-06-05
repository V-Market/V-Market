import v.market.*

class BootStrap {

    def springSecurityService

    def init = { servletContext ->
        def samples = [
                'gabtorrespen',
        ]

        def userRole = SecRole.findByAuthority("ROLE_USER") ?: new SecRole(authority: "ROLE_USER").save()
        def adminRole = SecRole.findByAuthority("ROLE_ADMIN") ?: new SecRole(authority: "ROLE_ADMIN").save()

        def users = User.list() ?: []
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
        println(User.list())
    }

    def destroy = {
    }
}
