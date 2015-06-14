package v.market

class Almacen {

    String name
    byte[] almacenImage
    String streetAddress;
    String lat;
    String lng;

    static constraints = {
        name(blank: false)
        almacenImage(nullable:true, maxSize:1073741824)
        streetAddress();
        lng(nullable: true);
        lat(nullable: true);
    }

    public String toString(){
        return name+" ("+streetAddress+")";
    }
}
