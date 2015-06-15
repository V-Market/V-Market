package v.market

class Carrito {

    static hasMany = [products: Product]
    boolean current
    double price
    double distance

    static constraints = {
        products(nullable: true);
        distance(nullable: true);
        price(nullable:true);
        current(nullable: false, blank:false)
    }

    static mapping = {
        products lazy: false
    }
}
