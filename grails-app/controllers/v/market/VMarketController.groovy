package v.market

class VMarketController {

    //def NotifierService

    def index() { }

    def contact(){
    }

    def emailUser(){

        if(params.email == "" || params.subject == "" || params.body == ""){
            flash.message = "Algunos campos no fueron llenados !!!"
        }
        else {
            flash.message = null
        }
        redirect(action: "contact")
        /*NotifierService.emailFromUser(
                params.email
        )*/
    }
}
