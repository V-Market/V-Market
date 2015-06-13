package v.market

class Product {
    String name
    //String id
    String trademark
    String size
    double prize
    Almacen shops
    String category
    byte[] imageByte

    static constraints = {
        name(blank:false)
        //id(blank: false, unique: true)
        trademark(blank:false)
        prize(blank: false)
        shops(null:true)
        imageByte(blank:false , maxSize:1073741824)
    }

    public String toString(){
        return name;
    }

    public byte[] getImage(){
        return imageByte;
    }
}

