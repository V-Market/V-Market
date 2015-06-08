package v.market

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured('permitAll')
class UserController {

    def springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model: [userInstanceCount: User.count()]
    }

    def show(User userInstance) {
        respond userInstance
    }

    def create() {

    }

    @Transactional
    def save(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view: 'register'
            return
        }

        userInstance.save flush: true
        //Linking role_user with user
        def role = SecRole.findByAuthority('ROLE_USER')
        SecUserSecRole.register userInstance, role, true

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
            respond userInstance.errors, view: 'edit'
            return
        }

        userInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    @Transactional
    def createUser(User user){
        //def user = new User(params)
        user.clearErrors()

        user.age = calculateAge(user.birthday)

        if(!user.password.equals(user.passwordConfirm)){
            flash.message = "Las contraseñas no coinciden"
            redirect(action: "register")
        }
        else if (user.validate()) {

            println("Creating user ${params.username}")
            user.save(flush: true)

            def role = SecRole.findByAuthority('ROLE_USER')
            SecUserSecRole.create user, role, true

            redirect controller: "VMarket"

        } else {
            println("Error in account bootstrap for ${params.username}")
            user.errors.each {
                err ->
                    println(err)
            }
            render view: 'register', model: [user: user]
        }
    }

    def register() {
        respond new User(params)
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    static Integer calculateAge(Date birthday, Date offset = new Date()) {
        def birthdayThisYear = offset.clone().clearTime()
        birthdayThisYear.month= birthday.month
        birthdayThisYear.date = birthday.date

        int num=offset[Calendar.YEAR] - birthday[Calendar.YEAR] - (birthdayThisYear > offset ? 1 : 0)
        return num
    }
}
