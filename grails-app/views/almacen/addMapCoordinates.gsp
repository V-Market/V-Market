<%--
  Created by IntelliJ IDEA.
  User: Neill
  Date: 6/10/2015
  Time: 8:09 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'googlemaps.css')}" />
    <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Atomic+Age" />
    <link href='http://fonts.googleapis.com/css?family=Parisienne' rel='stylesheet' type='text/css'>

    <!-- ||||||||||||||| SCRIPTS ||||||||||||||| -->
    <g:javascript src="jquery-1.11.2.min.js" />
    <g:javascript src="bootstrap.min.js" />

    <style type="text/css">
    html, body, #map-canvas { height: 100%; margin: 0; padding: 0;}
    </style>
    <script type="text/javascript"
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAHnIu6wKpmVEuMWFKM6fO98apSBsG-tHk&libraries=places&sensor=false">
    </script>
    <script type="text/javascript">
        var map;
        var markerCurrent;
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
        function callback(results,status){
            if (status == google.maps.places.PlacesServiceStatus.OK) {
                for (var i = 5; i < results.length; i++) {
                    var place = results[i];
                    createMarker(results[i]);
                    var Almacen = new google.maps.LatLng(results[i].geometry.location.lat(), results[i].geometry.location.lng());
                    map.setCenter(Almacen);
                    map.setZoom(18);
                }
            }
        }
        google.maps.event.addDomListener(window, 'load', initialize);

        $(document).ready(function(){

            $('.boton').click(function() {
                var Bogota = new google.maps.LatLng( 4.668487, -74.092701);
                var request = {
                    location: Bogota,
                    radius: '200',
                    query: $('#dir').val()

                };
                var service = new google.maps.places.PlacesService(map);
                service.textSearch(request, callback);
            });
        });
    </script>
</head>
<body>
<div class="container">
    <div id="map-canvas"></div>

    <div class="almacenInfo">
        <g:form>
            <div class="name">${almacen.getName()} </div><div class=" glyphicon glyphicon-question-sign glyphiconCustom" ><div class="texthide">Selecciona un punto en el mapa haciendo click derecho</div></div>
            <div class="ima"><img src='${createLink(controller:"almacen", action:"showAlmacenImage", id:"${almacen.id}")}' width="100px" height="100px"/> </div>
            <div class="direccion">${almacen.getStreetAddress()}</div>
            <div class="Coord">
                <div class="inputLat"><g:textField name="almacenLat" field="hola" readonly="true" placeholder="Latitud" value="${almacen.lat}" id="lat">hola</g:textField></div>
                <div class="inputLng"><g:textField name="almacenLng" field="hola" readonly="true" placeholder="Longitud" value="${almacen.lng}" id="lng">hola</g:textField></div>
            </div>
            <br>
            <g:actionSubmit name="Guardar" class="btn btn-primary"  value="Guardar" action="savecoordinate"/>
        </g:form>
    </div>
</div>

</body>
</html>