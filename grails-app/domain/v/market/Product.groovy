package v.market

class Product {

    String name
    String trademark
    String size
    double price
    Almacen shops
    String category
    double rating
    byte[] imageByte

    static constraints = {
        name(blank:false, unique: 'shops')
        rating(min: (double)1,max:(double)5)
        price(blank: false)
        trademark(blank:false)
        shops(nullable: false)
        category(blank: false, inList: ['Salud y Aseo','Licores','Refrigerados','Frutas y Verduras','Alimentos y bebidas'])
        imageByte(blank:false , maxSize:1073741824)
    }

    public String toString(){
        return name;
    }

    public byte[] getImage(){
        return imageByte;
    }
}

