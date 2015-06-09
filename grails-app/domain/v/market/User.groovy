package v.market

class User extends SecUser{

    String passwordConfirm
    String name
    String lastname
    String email
    String gender
    Date birthday
    int age
    byte[] userImage

    static constraints = {
        passwordConfirm(blank: false)
        name(blank: false)
        lastname(blank: false)
        email(blank: false, email: true)
        gender(blank: false)
        birthday(blank: false)
        age()
        userImage(nullable:true, maxSize:1073741824)
    }

    public String toString(){
        return name;
    }
}
