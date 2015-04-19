package v.market

class Usuario {

    String name
    String userName
    String password
    String email
    int age
    String urlImageProfile;


    static constraints = {
        email(email: true)
        password(password : true , blank: false)
        userName(blank: false, unique: true)
    }

    public String toString(){
        return name;
    }

    public String getUrl(){
        return url;
    }
}
