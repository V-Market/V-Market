package v.market


class AuthController {

    //static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {

        //[categories:['Salud y Aseo','Licores','Refrigerados','Frutas y Verduras', 'Alimentos varios']]
        def cate = [[1:'saludyaseo',2:'Salud y Aseo'],[1:'licores',2:'Licores'],[1:'refrigerados',2:'Refrigerados'],[1:'frutasyverduras',2:'Frutas y Verduras'],[1:'alimentosvarios',2:'Alimentos Varios']]
        def cat = new String("'#saludyaseo','#licores','#refrigerados','#frutasyverduras','#alimentosvarios'").encodeAsRaw();
        //def cat = new String("'#refrigerados','#carnes','#fritos'").encodeAsRaw();
        //def cate = ['Refrigerados','Carnes','Fritos'];
        //def divs = ['#Refrigerados','#Carnes','#Fritos'];
        //def cate = ['Salud y Aseo','Licores','Refrigerados','Frutas y Verduras', 'Alimentos varios']
        def divs = ['#saludyaseo','#licores','#refrigerados','#frutasyverduras','#alimentosvarios']
        [categories: cat,cate:cate];

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
