package v.market

class Product {
    String name
    //String id
    String trademark
    String size
    String present
    String description
    double prize
    String shops
    byte[] imageByte

    static constraints = {
        name(blank:false)
        //id(blank: false, unique: true)
        description(null:true)
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

