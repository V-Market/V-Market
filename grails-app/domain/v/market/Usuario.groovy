package v.market

class Usuario {

    String name
    String userName
    String password
    String email
    int age


    static constraints = {
        email(email: true)
        password(password : true , blank: false)
        userName(blank: false, unique: true)
    }
}
