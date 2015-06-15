package v.market

class CarritoController {

    def index() {}

    def show(){
        respond session.carrito
    }

    def getDistance(){

        List<Almacen> almacenes = Almecen.findAll();

    }

    def addProductToCarrito(){
        def productInstance = Product.findById(params.id)
        session.carrito.addToProducts(productInstance).save(flush: true)
        redirect(controller: 'carrito', action: 'show')
    }

    def removeProductFromCarrito(){
        def productInstance = Product.findById(params.id)
        def carrito = Carrito.findById(session.carrito.id)
        carrito.removeFromProducts(productInstance)
        if(!carrito.save(flush: true)){
            carrito.errors.each {
                err ->
                    println(err)
            }
        }
        session.carrito = carrito;
        redirect(controller: 'carrito', action: 'show')
    }
}
