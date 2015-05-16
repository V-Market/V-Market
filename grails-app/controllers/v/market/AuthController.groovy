package v.market

class AuthController {

    //static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
    }

    def doLogin(){
        if(request.method=="POST") {
            def user = User.findByUserNameAndPassword(params.username, params.password);
            print(user)
            if (user) {
                session.user = user;
                redirect(controller: "user", action: "profile")
            } else {
                flash.message = "Sorry, ${params.username}. Please try again"
                session.user = null
                params.flashMessage = flash.message
                forward(controller: "auth", action: "index")
            }
        }
    }
}
