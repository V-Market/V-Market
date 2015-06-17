package v.market

class Carrito {

    static hasMany = [products: Product]
    boolean current
    double price
    double distance
    Almacen almacen

    static constraints = {
        products(nullable: true);
        distance(nullable: true);
        price(nullable:true);
        current(nullable: false, blank:false);
        almacen(nullable:true);
    }

    static mapping = {
        products lazy: false
    }

    public String toString(){
        String ha = "ID : "+id+" / "
        for(Product product: products){
           ha = ha + product + " ";
        }
        return ha
    }
}
