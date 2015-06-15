package v.market

class AlmacenInfo {

    int almacenId
    double price
    double rating

    static belongsTo = Product

    static constraints = {
    }
}
