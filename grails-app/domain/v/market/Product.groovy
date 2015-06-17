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
        stores(nullable:true)
    }

    static mapping = {
        stores lazy: false
    }
    public String toString(){
        return name +"/ "+trademark;
    }

    public byte[] getImage(){
        return imageByte;
    }

    public double getMinPrice(){
        double min = Double.MAX_VALUE
        stores.each {
            if(it.price<min)
                min=it.price
        }
        return min
    }

    public def getStoreListInfo(){
        def storeList = []
        stores.each {
            def name = Almacen.findById(it.almacenId).toString()
            storeList << [name:name,price:it.price,rate:it.rating]
        }
        return storeList
    }

    public def getStoresId(){
        return stores.almacenId
    }
}

