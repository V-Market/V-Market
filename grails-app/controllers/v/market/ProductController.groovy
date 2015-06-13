package v.market



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
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

        respond new Product(params)
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

    def search(){
        respond Product.list(params), model:[productInstanceCount: Product.count()]
    }

    def showImage() {
        def productInstance = Product.get(params.id)
        response.outputStream << productInstance.imageByte // write the image to the outputstream
        response.outputStream.flush()
    }

    @Transactional
    def createProduct(Product product){

        product.clearErrors()

        //product.id = product.name+"/"+product.trademark+"/"+product.description+"/"+product.present+"/"+product.size+"/"+product.shops

        def f = request.getFile('image')

        if(!f.empty) {
            product.imageByte=f.getBytes()
            //flash.message = "No se ha subido ninguna imagen"
            //redirect(controller: "product")
        }
        if(!(f.contentType.equals("image/jpeg") || f.contentType.equals("image/png") ) ){
            flash.message = "El tipo de archivo debe ser JPEG o PNG"
            redirect(action: "newProduct")
        }
        else if (product.validate()) {



            println("Creating product ${params.name}")
            product.save(flush: true)


            redirect action: "newProduct"

        } else {
            println("Error in account bootstrap for ${params.product}")
            product.errors.each {
                err ->
                    println(err)
            }
            render view: 'newProduct', model: [product: product]
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
}
