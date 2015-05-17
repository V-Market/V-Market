package v.market

class Product {
    String name
    String id
    String trademark
    String description
    double prize
    String shops
    String urlImageProduct

    static constraints = {
        name(blank:false)
        id(blank: false, unique: true)
        description(null:true)
        trademark(blank:false)
        prize(blank: false)
        shops(null:true)
        urlImageProduct(blank:false)
    }

    public String toString(){
        return name;
    }

    public String getUrl(){
        return url;
    }
}

