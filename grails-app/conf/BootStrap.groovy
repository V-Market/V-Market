import v.market.User

class BootStrap {

    def init = { servletContext ->
        new User(userName: "gabtorrespen",password:"123").save()
    }

    def destroy = {
    }
}
