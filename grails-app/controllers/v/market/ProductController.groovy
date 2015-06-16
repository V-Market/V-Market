package v.market

import grails.plugin.springsecurity.annotation.Secured
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured('permitAll')
class ProductController {

    static allowedMethods = [save: "POST", delete: "DELETE", update: "POST"]

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
        def cate = ['Salud y Aseo','Licores','Refrigerados','Frutas y Verduras','Alimentos y bebidas']
        respond productInstance, model: [product: productInstance,categories: cate,stores: Almacen.list()]
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

        def image = request.getFile('image')
        if(!image.empty)product.imageByte=image.getBytes()
        def almacen = AlmacenInfo.findByAlmacenId(params.store)
        Product productExist = Product.findByNameAndSizeAndTrademark(params.name,params.size,params.trademark)


        if(productExist) {
            if (!almacen) {
                productExist.addToStores(new AlmacenInfo(price: params.price, rating: params.rating, almacenId: params.store))
                productExist.save flush: true
                redirect action: "list_product"
            } else {
                flash.message = "Ya existe este producto, editalo ! "
                redirect action: "edit", id: productExist.id
            }
        }
        else if(image.empty){
            flash.message = "No ha subido ninguna imagen del producto"
            redirect(action: "newProduct")
        }
        else if(!(image.contentType.equals("image/jpeg") || image.contentType.equals("image/png") ) ){
            flash.message = "El tipo de archivo debe ser JPEG o PNG"
            redirect(action: "newProduct")
        }
        else if (product.validate()) {

            product.addToStores(new AlmacenInfo(price: params.price,rating: params.rating, almacenId: params.store))
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
    def update(Product product) {

        product.clearErrors()

        def image = request.getFile('image')
        if(!image.empty)product.imageByte=image.getBytes()

        def almacen = AlmacenInfo.findByAlmacenId(params.store)


        if(!(image.contentType.equals("image/jpeg") || image.contentType.equals("image/png") || image.empty) ){
            flash.message = "El tipo de archivo debe ser JPEG o PNG"
            redirect(action: "edit")
        }
        else if (product.validate()) {
            product.removeFromStores(almacen)
            product.addToStores(new AlmacenInfo(price: params.price,rating: params.rating, almacenId: params.store))
            println("Updating product ${product.name}")
            product.save(flush: true)

            redirect action: "list_product"

        } else {
            println("Error in account bootstrap for ${params.product}")
            product.errors.each {
                err ->
                    println(err)
            }
            forward action: 'edit', model: [product: product]
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
        def targetUri = params.targetUri ?: "/"
        redirect(uri: targetUri)
        //redirect(controller: 'product', action: 'list_product')
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
        def targetUri = params.targetUri ?: "/"
        redirect(uri: targetUri)
        //redirect(controller: 'product', action: 'list_product')
    }

    def Salud_y_Aseo(){
        respond Product.findAllByCategory('Salud y Aseo')
    }

    def Licores(){
        respond Product.findAllByCategory('Licores')
    }
    def Refrigerados(){
        respond Product.findAllByCategory('Refrigerados')
    }
    def Frutas_Y_Verduras(){
        respond Product.findAllByCategory('Frutas y Verduras')
    }
    def Alimentos_Y_Bebidas(){
        respond Product.findAllByCategory('Alimentos y bebidas')
    }

    static def getSimilarProducts(params){
        def similarProducts = []
        Product.list().each(){
            if(it.name.toLowerCase().contains(params.name.toLowerCase()) || params.name.toLowerCase().contains(it.name.toLowerCase())){
                similarProducts << it
            }
            if(it.trademark.toLowerCase().contains(params.trademark.toLowerCase()) || params.trademark.toLowerCase().contains(it.trademark.toLowerCase())){
                similarProducts << it
            }
            if(it.category.toLowerCase().contains(params.category.toLowerCase()) || params.category.toLowerCase().contains(it.category.toLowerCase())){
                similarProducts << it
            }
        }
        return similarProducts[0..4]
    }
}
