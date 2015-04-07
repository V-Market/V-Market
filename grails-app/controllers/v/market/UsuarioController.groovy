package v.market


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UsuarioController {

    def index =  {
    }

    def show(Usuario usuarioInstance) {
    }

    def create() {
    }

    @Transactional
    def save(Usuario usuarioInstance) {
    }

    def edit(Usuario usuarioInstance) {
    }

    @Transactional
    def update(Usuario usuarioInstance) {
    }

    @Transactional
    def delete(Usuario usuarioInstance) {
    }

    protected void notFound() {
    }
}
