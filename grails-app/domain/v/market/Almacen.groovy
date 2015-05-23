package v.market

class Almacen {

    int nit
    String name
    String razonSocial
    String address
    String telefono
    String email
    String ciudad
    String pais
    String tipoProducto
    String urlImageProfile

    static constraints = {
        nit(blank: false, unique: true)
        name(blank: false)
        razonSocial(blank: false, unique: true)
        address(blank: false)
        telefono()
        email(email: true)
        ciudad(blank: false)
        pais()
        tipoProducto()
        urlImageProfile()
    }

    public String toString(){
        return name;
    }

    public String getUrl(){
        return url;
    }
}
