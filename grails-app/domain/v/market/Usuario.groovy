package v.market

class Usuario {

    String name
    String lastname
    String userName
    String password
    String email
    String ciudad
    String pais
    Date birthday
    String gender;
    int age
    String telefono
    String urlImageProfile;


    static constraints = {
        name()
        lastname()
        userName(blank: false, unique: true)
        password(password : true , blank: false)
        email(email: true)
        gender()
        age()
        birthday()
        telefono()
        ciudad()
        pais()




    }

    public String toString(){
        return name;
    }

    public String getUrl(){
        return url;
    }
}
