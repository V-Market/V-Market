package v.market

import grails.converters.JSON
import org.codehaus.groovy.grails.web.binding.bindingsource.JsonDataBindingSourceCreator

class CarritoController {

    static allowedMethods = [getDistance: "GET"]
    def index() {}

    def save(){
        def almacen = Almacen.findById(params.almacenSeleccionadoid)
        def carrito = Carrito.findById(params.carrito)
        carrito.almacen = almacen;
        carrito.price = Double.parseDouble(params.price)
        carrito.distance = Double.parseDouble((params.distancia).replace(",","."))
        carrito.current = false
        if(!carrito.save(flush:true)){
            carrito.errors.each{err->
                println(err)
            }
        }
        redirect(action:"index", controller: "VMarket")


    }

    def show(){
        def distances = [:]
        for(Almacen almacen:Almacen.findAll()){
            distances.put(almacen, 0);

        }
        def almacenes = Almacen.findAll();
        def carrito = session.carrito
        [almacenes: almacenes, distances: distances, classes: almacenes.size(), carrito: carrito]
    }

    def renderDistances(){
        def distances = [:]
        def almacenes = Almacen.findAll();
        for(int i=0;i<almacenes.size();i++){
            def field = 'field'+i;
            distances.put(almacenes.get(i), Double.parseDouble((params.getAt(field)).replace(',','.')));
        }
        return distances;
    }
    def getDistance(){
        List<Almacen> almacenes = Almacen.findAll();
        render almacenes as JSON
    }

    def addProductToCarrito(){
        def productInstance = Product.findById(params.id)
        session.carrito.addToProducts(productInstance).save(flush: true)
        redirect(controller: 'carrito', action: 'show')
    }

    def removeProductFromCarrito(){
        def productInstance = Product.findById(params.id)
        def carrito = Carrito.findById(session.carrito.id)
        carrito.removeFromProducts(productInstance)
        if(!carrito.save(flush: true)){
            carrito.errors.each {
                err ->
                    println(err)
            }
        }
        session.carrito = carrito;
        redirect(controller: 'carrito', action: 'show')
    }
    static def media(double[] values){
        double a=0.0
        values.each {a+=it}
        return 1.0*a/values.size()
    }
    static def desviacion(double[] values, double media){
        if(values.size()==1) return 0
        double a=0.0
        values.each {a+=(it-media)*(it-media)}
        return 1.0*a/(values.size()-1)
    }
    static def puntaje(double value,double media,double desviacion){
        if(media==value) return 0
        return 1.0*(value-media)/desviacion
    }
    def sortStores(Product[] products, distancias, double cPrecio,double cCalidad, double cDistancia){
        def puntajeA = [:]             //por almacen
        def estadisticasPrecio = [:]  //por producto
        def estadisticasCalidad = [:] //por producto
        def almacens = [] as Set //set de almacenes
        def dist = []
        distancias.values.each{
            distan->
                dist.add(1.0/distan)
        }

        def mediaD = media(dist)
        def desviacionD = desviacion(dist,mediaD)

        products.each { product->
            def precios= []
            def calidad= []
            product.stores.each{
                precios.add(1.0/(product.stores.find(it).price))
                calidad.add(product.stores.find(it).rating)
            }
            def mediaP = media(precios)
            def desviacionP = desviacion(precios,mediaP)
            estadisticasPrecio.put(product,[mediaP,desviacionP])
            mediaP = media(calidad)
            desviacionP= desviacion(calidad,mediaP)
            estadisticasCalidad.put(product,[mediaP,desviacionP])
        }
        products.each {
            product->
                almacens.add(product.stores.almacenId)
        }
        almacens.each{  //agregar distancia
        almacen->
            def puntajePrecioporP =0.0
            def puntajeCalidadporP = 0.0
            def myProd = products.findAll{almacen in it.stores.almacenId}
            def puntajeDistanciaP = puntaje(distancias.get(almacen),mediaD,desviacionD)
            myProd.each {
                puntajePrecioporP+= puntaje(1.0/it.stores.find(almacen).price,estadisticasPrecio.get(it))
                puntajeCalidadporP+= puntaje(it.stores.find(almacen).rating,estadisticasCalidad.get(it))
            }
            puntajePrecioporP=1.0*puntajePrecioporP/myProd.size()
            puntajeCalidadporP=1.0*puntajeCalidadporP/myProd.size()
            puntajeA.put(almacen,puntajePrecioporP*cPrecio+puntajeCalidadporP*cCalidad+puntajeDistanciaP*cDistancia)

        }
        return almacens.sort {puntajeA.get(it)}

    }
}
