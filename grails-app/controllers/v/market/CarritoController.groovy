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
}
