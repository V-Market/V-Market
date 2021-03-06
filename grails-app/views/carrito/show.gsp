<%--
  Created by IntelliJ IDEA.
  User: Neill
  Date: 6/14/2015
  Time: 10:44 AM
--%>

<%@ page import="groovy.json.JsonSlurper; grails.converters.JSON" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Carrito</title>
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'custom.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'carrito.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'star-rating.css')}" />

    <!-- ||||||||||||||| SCRIPTS ||||||||||||||| -->
    <g:javascript src="jquery-1.11.2.min.js" />
    <g:javascript src="bootstrap.min.js" />
    <g:javascript src="context.js" />

    <script type="text/javascript"
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAHnIu6wKpmVEuMWFKM6fO98apSBsG-tHk&libraries=places&sensor=false">
    </script>

    <g:javascript src="star-rating.js"/>

    <script type="text/javascript">
        $(document).ready(function(){
            $(".product-rate").rating({
                'size':'sm',
                showClear: false,
                starCaptions: {1: "Muy malo", 2: "Malo", 3: "Regular", 4: "Bueno", 5: "Excelente"},
                clearCaption: "Sin calificación"
            });
        });
    </script>

    <script type="text/javascript">

        var progressbar1 = 33;
        var progressbar2 = 33;
        var progressbar3 = 34;
        var map;
        var markerCurrent;

        function getDistance(lat,lng){
            var latlng = new google.maps.LatLng(lat,lng);
            var dos = markerCurrent.getPosition();
            alert(latlng);
            alert(dos)
        }
        function scrollToID(id, speed, before, index){
            var offSet = 50;
            var targetOffset = $(id).offset().top - offSet;
            $('html,body').animate({scrollTop:targetOffset}, speed);
        }


        function initialize() {
            var mapOptions = {
                center: { lat: 4.668487, lng: -74.092701},
                zoom: 12
            };
            map = new google.maps.Map(document.getElementById('map-canvas'),
                    mapOptions);

            google.maps.event.addListener(map, 'rightclick', function(e) {
                createMarker(e.latLng);
            });
        }


        function createMarker(place){
            if(markerCurrent) markerCurrent.setMap(null);
            markerCurrent = new google.maps.Marker({
                map: map,
                position: place
            });
            $('#lat').val(markerCurrent.getPosition().lat());
            $('#lng').val(markerCurrent.getPosition().lng());
        }

        google.maps.event.addDomListener(window, 'load', initialize);

        $(document).ready(function(){

            $(".arribaButton").click(function(){
                scrollToID("#container",750,0,0);
            });
            $(".arribaButton2").click(function(){
                scrollToID("#containerMap",750,0,0);
            });

            $("#almacenId0").click(function(){
                $("#idAlmacen").val($("#almacenId0").val());
            });
            $("#almacenId1").click(function(){

                $("#idAlmacen").val($("#almacenId1").val());
            });
            $("#almacenId2").click(function(){

                $("#idAlmacen").val($("#almacenId2").val());
            });

            scrollToID("#container",750,0,0);
            $('.buttonMap').click(function () {
                scrollToID("#containerMap", 750 ,0,0)
            });

            $('.mybutton').click(function(){
                if(markerCurrent==null){
                    alert("Seleccione Posición")
                }else{
                    scrollToID("#opciones",750,0,0)
                }
            });

            $('#valueprogress1').click(function(){
                var value = parseInt($('#valueprogress1').val());
                var toSum = parseInt(progressbar1 - value);
                var prog2;
                var prog3;
                if(toSum==1 || toSum==-1){
                    prog2 = parseInt(progressbar2);
                    prog3 = parseInt(progressbar3);
                    if(Math.random()<0.5){
                        prog3 = prog3 + parseInt(toSum);
                    }else{
                        prog2 = prog2 + parseInt(toSum);
                    }
                }else{
                    if(toSum % 2 == 0){
                        prog2 = parseInt(progressbar2) + parseInt(toSum/2);
                        prog3 = parseInt(progressbar3) + parseInt(toSum/2);

                    }else{
                        prog2 = parseInt(progressbar2) + parseInt((toSum-1)/2) + parseInt(1);
                        prog3 = parseInt(progressbar3) + parseInt((toSum-1)/2);
                    }
                }
                progressbar2 = prog2;
                progressbar3 = prog3;
                progressbar1 = value;
                $('#progress2').css("width",prog2+"%");
                $("#valueprogress2").val(progressbar2);
                $('#progress3').css("width",prog3+"%");
                $("#valueprogress3").val(progressbar3);
                $('#progress1').css("width",value+"%");
                $("#valueprogress1").val(progressbar1);
            });

            $('#valueprogress2').click(function(){
                var value = parseInt($('#valueprogress2').val());
                var toSum = parseInt(progressbar2 - value);
                var prog1;
                var prog3;
                if(toSum==1 || toSum==-1){
                    prog1 = parseInt(progressbar1);
                    prog3 = parseInt(progressbar3);
                    if(Math.random()<0.5){
                        prog3 = prog3 + parseInt(toSum);
                    }else{
                        prog1 = prog1 + parseInt(toSum);
                    }
                }else{
                    if(toSum % 2 == 0){
                        prog1 = parseInt(progressbar1) + parseInt(toSum/2);
                        prog3 = parseInt(progressbar3) + parseInt(toSum/2)
                    }else{
                        prog1 = parseInt(progressbar1) + parseInt((toSum-1)/2) + parseInt(1);
                        prog3 = parseInt(progressbar3) + parseInt((toSum-1)/2);
                    }
                }
                progressbar2 = value;
                progressbar3 = prog3;
                progressbar1 = prog1;
                $('#progress1').css("width",prog1+"%");
                $("#valueprogress1").val(progressbar1);
                $('#progress3').css("width",prog3+"%");
                $("#valueprogress3").val(progressbar3);
                $('#progress2').css("width",value+"%");
                $("#valueprogress2").val(progressbar2);
            });

            $('#valueprogress3').click(function(){
                var value = parseInt($('#valueprogress3').val());
                var toSum = parseInt(progressbar3 - value);
                var prog1;
                var prog2;
                if(toSum==1 || toSum==-1){
                    prog2 = parseInt(progressbar2);
                    prog1 = parseInt(progressbar1);
                    if(Math.random()<0.5){
                        prog1 = prog1 + parseInt(toSum);
                    }else{
                        prog2 = prog2 + parseInt(toSum);
                    }
                }else{
                    if(toSum % 2 == 0){
                        prog2 = parseInt(progressbar2) + parseInt(toSum/2);
                        prog1 = parseInt(progressbar1) + parseInt(toSum/2)
                    }else{
                        prog2 = parseInt(progressbar2) + parseInt((toSum-1)/2) + parseInt(1);
                        prog1 = parseInt(progressbar1) + parseInt((toSum-1)/2);
                    }
                }
                progressbar2 = prog2;
                progressbar1 = prog1;
                progressbar3 = value;
                $('#progress2').css("width",prog2+"%");
                $("#valueprogress2").val(progressbar2);
                $('#progress1').css("width",prog1+"%");
                $("#valueprogress1").val(progressbar1);
                $('#progress3').css("width",value+"%");
                $("#valueprogress3").val(progressbar3);
            });

            $('.buttonsucess').click(function () {

                var or = [];
                var des = [];
                for(var h=0; h<${classes};h++) {
                    var string = '.field' + h;
                    var value = $(string).val();
                    var lat = value.split("/");
                    var lngUno = new google.maps.LatLng(parseFloat(lat[0]), parseFloat(lat[1]));
                    var lngDos = new google.maps.LatLng(parseFloat($('#lat').val()), parseFloat($('#lng').val()));
                    or.push(lngUno)
                    des.push(lngDos)
                }
                    var service = new google.maps.DistanceMatrixService();
                    service.getDistanceMatrix(
                            {
                                origins: or,
                                destinations: des,
                                travelMode: google.maps.TravelMode.DRIVING

                            }, function (response, status) {
                                var string = "";
                                if (status == google.maps.DistanceMatrixStatus.OK) {
                                    var origins = response.originAddresses;
                                    var destinations = response.destinationAddresses;
                                    for (var i = 0; i < origins.length; i++) {
                                        var results = response.rows[i].elements;
                                        for (var j = 0; j < results.length; j++) {
                                            if(i!=j) continue;
                                            var element = results[j];
                                            var distance = element.distance.text;
                                            var duration = element.duration.text;
                                            var distance = distance.split(" ");
                                            string = string + $('#fieldid'+j).val() + "/" + distance[0] + "-";
                                        }
                                    }
                                }
                                string = string.substr(0,string.length-1);
                                $('#statusAlmacenes').val(string);
                                $.ajax({
                                    method: "GET",
                                    url:"${createLink(controller: 'carrito', action: 'sortStores')}",
                                    data: { productos: JSON.stringify(${session.carrito.products.collect{it.id}}), distances: string, cPrecio: parseInt($("#valueprogress1").val()),cCalidad: parseInt($("#valueprogress2").val()), cDistancia: parseInt($("#valueprogress3").val())}
                                }).done(function(data){
                                    <g:set var="string" value="data"/>
                                    var h = ${string};
                                    h = h.replaceAll("[","");
                                    h = h.replaceAll("]","");
                                    h = h.replaceAll(" ","");
                                    arrays = h.split(",").map(Number);
                                    arrays = $.unique(arrays);
                                    val = 3;
                                    if(arrays.length<3) val = arrays.length;
                                    for(var i=0; i<val;i++) {
                                        $("#almacenId"+i).val(arrays[i]);
                                    }
                                    $("#actualizar").val()
                                })
                            });
                            $('.myrow').css('opacity','1');



                });
        });
    </script>
</head>

<body>

<g:render template="/layouts/navbar"></g:render>

<div id="container" style="position: relative; width:100%; height: 100%; padding: 0; margin:0">
    <div class="row" style="height: 80%; width:100%; overflow: auto; overflow-x: hidden; position: absolute; margin:0">
        <div class="col-md-12">
            <div class="row" style="height: 14%; width:100%"></div>
            <div class="container" style="overflow: auto">
                <div class="row" style="width:100%">
                    <div class="h_line"></div>
                    <g:each in="${session.carrito.products}" status="i" var="productInstance">
                        <div class="col-md-3">
                            <g:render template="/product/one_product" bean="${productInstance}" var="productInstance" style="width: 100%"/>
                        </div>
                    </g:each>
                </div>
            </div>
        </div>
    </div>
    <div class="row" style="height: 20%; position: absolute; bottom:0; text-align: center; width: 100%">
        <div class="col-lg-12" style="text-align: center;position: relative; top:35%">
            <div class="buttonMap btn btn-default">Verificar Opciones</div>
        </div>
    </div>

</div>
<div id="containerMap">

    <div class="titulo">Selecciona un punto de referencia    <button class="mybutton btn btn-default">Continuar</button> <div class="arribaButton btn btn-default">Volver</div></div>
    <div id="map-canvas"></div>
</div>
<div id="opciones">
    <div class="titulo">Criterios de Selección <div class="arribaButton2 btn btn-default">Volver</div> </div>
    <br>
    <br>
    <div class="row" style="padding-left: 30px; padding-right: 30px;">
        <div class="col-md-12" style="text-align: center;">
            <div class="progress" style="width: 100%">
                <div class="progress-bar progress-bar-success" role="progressbar" style="width:33%" id="progress1">
                    Distancia
                </div>
                <div class="progress-bar progress-bar-info" role="progressbar" style="width:33%" id="progress2">
                    Precio
                </div>
                <div class="progress-bar progress-bar-warning" role="progressbar" style="width:34%" id="progress3">
                    Calidad
                </div>
            </div>
        </div>
    </div>
    <div class="row" style="padding-left: 30px; padding-right: 30px;">
        <div class="col-md-4">
            <g:field type="number" min="0" max="100" name="valueprogress1" value="33" class="form-control"/>
        </div>
        <div class="col-md-4">
            <g:field type="number" min="0" max="100" name="valueprogress2" value="33" class="form-control"/>
        </div>
        <div class="col-md-4">
            <g:field type="number" min="0" max="100" name="valueprogress3" value="34" class="form-control"/>
        </div>
    </div>
    <br>
    <br>
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4" style="text-align: center">
            <button class="buttonsucess btn btn-default">Hallar mejor opción</button>
        </div>
        <div class="col-md-4"></div>
    </div>
    <div id="resultados" style="width: 100%">

        <g:hiddenField  id="lat" name="lat"/>
        <g:hiddenField  id="lng" name="lng"/>
        <br>
        <br>
        <div class="myrow row" style="opacity:0;">
            <g:hiddenField name="myalmacen" value=" " id="statusAlmacenes"/>
        <g:each in="${almacenes}" var="almacenInstance" status="it">
            <g:hiddenField name="field${it}" value="${almacenInstance.lat}/${almacenInstance.lng}" class="field${it}"/>
            <g:hiddenField name="fieldid${it}" value="${almacenInstance.id}" class="field${it}" id="fieldid${it}"/>
        </g:each>
            <div class="col-md-4">
                <td style="text-align: center" >
                    <g:include controller="carrito" action="getCenter" id="33"/>
                    <br>
                    <br>
                    <g:radio name="almacenId" value="" id="almacenId0"/>
                </td>
            </div>
            <div class="col-md-4">
                <td style="text-align: center" >
                    <g:include controller="carrito" action="getCenter" id="1"/>
                    <br>
                    <br>
                    <g:radio name="almacenId" value="" id="almacenId1"/>
                </td>
            </div>
            <div class="col-md-4">
                <td style="text-align: center" >
                    <g:include controller="carrito" action="getCenter" id="33"/>
                    <br>
                    <br>
                    <g:radio name="almacenId" value="" id="almacenId2"/>
                </td>
            </div>
        </div>
        <br>
        <br>
        <div class="row">
        <div class="col-md-4"></div>
            <div class="col-md-4">
                <g:form>
                    <g:hiddenField name="current" value="false"/>
                    <g:hiddenField name="price" value="120.000"/>
                    <g:hiddenField name="almacenSeleccionadoid" value="" id="idAlmacen"/>
                    <g:hiddenField name="distancia" value="3,6"/>
                    <g:hiddenField name="carrito" value="${carrito.id}"/>
                    <g:actionSubmit action="save" value="Guardar Carrito" class="btn btn-success"/>
                </g:form>
            </div>
            <div class="col-md-4"></div>
        </div>


    </div>
</div>
</body>
</html>