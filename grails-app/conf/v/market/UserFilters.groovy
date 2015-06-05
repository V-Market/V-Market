package v.market

class UserFilters {

    def springSecurityService

    def filters = {
        all(uri:'/**') {
            before = {

            }
            after = { model ->
                if(model && springSecurityService.isLoggedIn()){
                    model['user'] = User.get(springSecurityService.principal.id)
                }
            }
            afterView = { Exception e ->

            }
        }
    }
}
