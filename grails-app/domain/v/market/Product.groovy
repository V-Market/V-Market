package v.market

class Product {

    String name
    String trademark
    String size
    String category
    byte[] imageByte

    static hasMany = [stores:AlmacenInfo]

    static constraints = {
        name(blank:false)
        trademark(blank:false)
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

