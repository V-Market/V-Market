package v.market


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AlmacenController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE", savecoordinate: 'POST']

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Almacen.list(params), model: [almacenInstanceCount: Almacen.count()]
    }

    def show(Almacen almacenInstance) {
        respond almacenInstance
    }

    def create() {
        respond new Almacen(params)
    }

    @Transactional
    def save(Almacen almacenInstance) {
        if (almacenInstance == null) {
            notFound()
            return
        }

        if (almacenInstance.hasErrors()) {
            respond almacenInstance.errors, view: 'create'
            return
        }

        almacenInstance.save flush: true
        session.almacenId = almacenInstance.getId()
        redirect(action: 'addmapcoordinates')
        /*request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'almacen.label', default: 'Almacen'), almacenInstance.id])
                redirect almacenInstance
            }
            '*' { respond almacenInstance, [status: CREATED] }
        }*/
    }

    def edit(Almacen almacenInstance) {
        respond almacenInstance
    }

    @Transactional
    def update(Almacen almacenInstance) {
        if (almacenInstance == null) {
            notFound()
            return
        }

        if (almacenInstance.hasErrors()) {
            respond almacenInstance.errors, view: 'edit'
            return
        }

        almacenInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Almacen.label', default: 'Almacen'), almacenInstance.id])
                redirect almacenInstance
            }
            '*' { respond almacenInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Almacen almacenInstance) {

        if (almacenInstance == null) {
            notFound()
            return
        }

        almacenInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Almacen.label', default: 'Almacen'), almacenInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'almacen.label', default: 'Almacen'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    def addmapcoordinates(){
        def almacenId = session.almacenId
        def almacen = Almacen.findById(almacenId);
        [almacen:almacen]
    }

    def savecoordinate(){
       // def almacenId = params.almacenId;
        //def almacenLat = params.almacenLat;
        //def almacenLng = params.almacenLng;
        //def almacen = Almacen.findById(almacenId);

        def almacen = Almacen.findById(session.almacenId);
        almacen.lat = params.almacenLat
        almacen.lng = params.almacenLng
        if(!almacen.save(flush: true)){
            flash.message = "Error al guardar";
            almacen.errors.each {
                println it
            }
        }
        redirect(action: 'index')
        //chain(action: 'show', model: almacen);
    }
}
