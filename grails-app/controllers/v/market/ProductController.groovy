package v.market

import grails.plugin.springsecurity.annotation.Secured

import grails.plugin.springsecurity.annotation.Secured
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured('permitAll')
class ProductController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Product.list(params), model:[productInstanceCount: Product.count()]
    }

    def show(Product productInstance) {
        respond productInstance
    }

    def create() {
        respond new Product(params)
    }

    @Transactional
    def save(Product productInstance) {
        if (productInstance == null) {
            notFound()
            return
        }

        if (productInstance.hasErrors()) {
            respond productInstance.errors, view:'create'
            return
        }

        productInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'product.label', default: 'Product'), productInstance.id])
                redirect productInstance
            }
            '*' { respond productInstance, [status: CREATED] }
        }
    }

    def edit(Product productInstance) {
        respond productInstance
    }

    def newProduct(){
        def cate = ['Salud y Aseo','Licores','Refrigerados','Frutas y Verduras','Alimentos y bebidas']
        def alma = Almacen.list(params)
        respond new Product(params) , model: [categories:cate,stores:alma]
    }

    def upload(Product productInstance){
            def f = request.getFile('image')
            if(!f.empty) {
                productInstance.imageByte=f.getBytes()
            }
            else {
                flash.message = 'file cannot be empty'
            }
    }

    def clicksearch(){

        def listafiltrada = []

        if(params.lookup==""){
            listafiltrada=Product.list()
        }
        else{
            def cadena = (params.lookup)
            Product.list().each(){
                if(it.name.toLowerCase().contains(cadena.toLowerCase())){
                   listafiltrada << it
                }
            }
        }

        if((params.vcategory) != null){
            listafiltrada.removeAll{it.category != params.category}
        }
        if((params.vstore) != null){
            listafiltrada.removeAll{it.shops.toString() != params.shops}
        }
        if((params.vprize) != null){
            listafiltrada.removeAll{it.prize > Double.parseDouble(params.prize)}
        }
        //chain action:'search', model:[lista:listafiltrada]
        forward action:'search', model:[lista:listafiltrada]

    }

    def search(){
        def cate = ['Salud y Aseo','Licores','Refrigerados','Frutas y Verduras','Alimentos Varios']
        def alma = Almacen.list(params)

        respond Product.list(params), model:[productInstanceCount: Product.count(),categories: cate,stores: alma]
    }

    def showImage() {
        def productInstance = Product.get(params.id)
        response.outputStream << productInstance.imageByte // write the image to the outputstream
        response.outputStream.flush()
    }

    @Transactional
    def createProduct(Product product){

        product.clearErrors()

        def f = request.getFile('image')

        def almacen = Almacen.get(params.shops)
        product.shops=almacen

        if(!f.empty) {
            product.imageByte=f.getBytes()
        }
        if(f.empty){
            flash.message = "No ha subido ninguna imagen del producto"
            redirect(action: "newProduct")
        }
        else if(!(f.contentType.equals("image/jpeg") || f.contentType.equals("image/png") ) ){
            flash.message = "El tipo de archivo debe ser JPEG o PNG"
            redirect(action: "newProduct")
        }
        else if (product.validate()) {

            println("Creating product ${params.name}")
            product.save(flush: true)

            redirect action: "list_product"

        } else {
            println("Error in account bootstrap for ${params.product}")
            product.errors.each {
                err ->
                    println(err)
            }
            forward action: 'newProduct', model: [product: product]
        }
    }

    @Transactional
    def update(Product productInstance) {
        if (productInstance == null) {
            notFound()
            return
        }

        if (productInstance.hasErrors()) {
            respond productInstance.errors, view:'edit'
            return
        }

        productInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Product.label', default: 'Product'), productInstance.id])
                redirect productInstance
            }
            '*'{ respond productInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Product productInstance) {

        if (productInstance == null) {
            notFound()
            return
        }

        productInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Product.label', default: 'Product'), productInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def _one_product(Product productInstance){
        respond productInstance
    }
    def list_product(){
        respond Product.all
    }

    def showProductImage(){
        def product = Product.get(params.id)
        response.outputStream << product.imageByte
        response.outputStream.flush()
    }

    def addProductToCarrito(){
        def productInstance = Product.findById(params.id)
        session.carrito.addToProducts(productInstance).save(flush: true)
        redirect(controller: 'product', action: 'list_product')
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
        redirect(controller: 'product', action: 'list_product')
    }
}
