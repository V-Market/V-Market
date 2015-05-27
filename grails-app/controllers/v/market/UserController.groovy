package v.market

import java.text.SimpleDateFormat

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model:[userInstanceCount: User.count()]
    }

    def show(User userInstance) {
        respond userInstance
    }

    def create() {
        respond new User(params)
    }

    @Transactional
    def save(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'create'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: CREATED] }
        }
    }

    def edit(User userInstance) {
        respond userInstance
    }

    @Transactional
    def update(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'edit'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*'{ respond userInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }

    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def profile(){
    }

    def logout(){
        session.user = null
        redirect(controller: "auth",action: "index")
    }

    def register(){
        if(!params.display_name.equals(null)) {
            def usuario = User.findByUserName(params.display_name)
            if (usuario) {
                flash.message = "El username ${params.display_name}, no está disponible."
                session.user = null
                params.flashMessage = flash.message
            } else {
                usuario = User.findByEmail(params.email)
                if (usuario) {
                    flash.message = "ya existe un usuario registrado con el email: ${params.email}."
                    session.user = null
                    params.flashMessage = flash.message
                }
                else{
                    if(!params.password.equals(params.password_confirmation)){
                        flash.message = "Password y Confirm Password deben coincidir"
                        session.user = null
                        params.flashMessage = flash.message
                    }
                    else {
                        usuario = new User(params)
                        usuario.name = params.first_name
                        usuario.lastname = params.last_name
                        usuario.userName = params.display_name
                        usuario.email = params.email
                        usuario.password = params.password
                        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                        usuario.birthday = formatter.parse(params.birthday)
                        usuario.gender = params.gender
                        save(usuario)
                    }
                }
            }
        }
    }
}
