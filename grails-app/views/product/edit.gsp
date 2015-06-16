<%--
  Created by IntelliJ IDEA.
  User: Damperius
  Date: 04/06/2015
  Time: 06:23 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="v.market.Product" %>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'star-rating.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'custom.css')}" />
    <!-- ||||||||||||||| SCRIPTS ||||||||||||||| -->
    <g:javascript src="jquery-1.11.2.min.js" />
    <g:javascript src="bootstrap.min.js" />
    <g:javascript src="bootstrap-filestyle.js"/>
    <g:javascript src="star-rating.js"/>

    <title>Editar Producto</title>

    <script type="text/javascript">
        $(document).ready(function(){
            // with plugin options
            $("#input-id").rating({
                'size':'sm',
                //'value' : '3',
                showClear: false,
                starCaptions: {1: "Muy malo", 2: "Malo", 3: "Regular", 4: "Bueno", 5: "Excelente"},
                clearCaption: "Sin calificación"
            });
        });
    </script>

</head>

<body>
<br class="container">
<nav class="navbar navbar-inverse navbar-fixed-top background-color">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        <!--El header contiene el boton "inicio"-->
            <g:link controller="VMarket" action="index" class="navbar-brand">
                V-Market <span class="glyphicon glyphicon-asterisk"></span>
            </g:link>

        </div>

        <div id="navbar" class="navbar-collapse collapse">

            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Categorias <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><g:link controller="product" action="Salud_y_Aseo">Salud y Aseo</g:link> </li>
                        <li><g:link controller="product" action="Licores">Licores</g:link></li>
                        <li><g:link controller="product" action="Refrigerados">Refrigerados</g:link></li>
                        <li><g:link controller="product" action="Frutas_Y_Verduras">Frutas y Verduras</g:link></li>
                        <li><g:link controller="product" action="Alimentos_Y_Bebidas">Alimentos y bebidas</g:link>></li>
                    </ul>
                </li>
            </ul>

            <sec:ifNotLoggedIn>
                <ul class="nav navbar-nav navbar-right">
                    <li><g:link controller="user" action="register"> <span class="glyphicon glyphicon-user"></span> Registrate</g:link></li>
                </ul>

                <p class="nav navbar-text navbar-right" > o </p>

                <ul class="nav navbar-nav navbar-right">
                    <li><g:link controller="login"><span class="glyphicon glyphicon-log-in"></span> Ingresa</g:link></li>
                </ul>
            </sec:ifNotLoggedIn>
            <sec:ifLoggedIn>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                            <sec:username /> <span class="glyphicon glyphicon-user"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><g:link controller="user" action="profile" id="${user.id}">Ver perfil</g:link></li>
                            <li><g:link controller="carrito" action="show" >Carrito</g:link></li>
                            <li class="divider"></li>
                            <li><g:link controller="logout">Log out <span class="glyphicon glyphicon-log-out"></span></g:link></li>
                        </ul>
                    </li>
                </ul>
            </sec:ifLoggedIn>
        </div><!--/.navbar-collapse-->
    </div>
</nav>
</br>
</br>
<div class="row">
    <div class="col-xs-12 col-sm-8 col-md-8 col-sm-offset-2 col-md-offset-2">
        <g:form role="form" enctype="multipart/form-data" url="[resource:product, action:'update']">
            <h2>Edita un producto
                <br/><br/>
                <small style="color: #ffffff;">Aqui podrás actualizar la informacion de nuestra comunidad.</small>
            </h2>
            <hr class="colorgraph">
            <div class="card card-container-register">
                <g:hasErrors bean="${product}">
                    <div class="errors">
                        <label style="color: red"> Revisa los campos</label>
                    </div>
                </g:hasErrors>
                <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-6">
                        <img class="img-thumbnail center-block" src="${createLink(controller:'product', action:'showImage', id:"${product.id}")}" style="width: auto; height: 150px" />
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6">
                        <strong>Nombre del producto: </strong><p><g:fieldValue bean="${product}" field="name"/></p>
                        <strong>Marca: </strong><p><g:fieldValue bean="${product}" field="trademark"/></p>
                        <strong>Tamaño / cantidad: </strong><p ><g:fieldValue bean="${product}" field="size"/></p>
                        <strong>Categoria: </strong><p><g:fieldValue bean="${product}" field="category"/></p>
                    </div>
                </div>
                <hr/>
                <br/>
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                            <input type="file" class="filestyle" data-buttonText="  Cambia la imagen (opcional)" data-buttonName="btn-primary" id="image" name="image"/>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-12 col-sm-7 col-md-7">
                        <div class="form-group">
                            <label for="store">Almacén:</label>
                            <select type="text" name="store" id="store" formmethod="POST" class="form-control input-lg" tabindex="8">
                                <g:each in="${stores}" status="i" var="it">
                                    <option value="${it.id}">${it}</option>
                                </g:each>
                            </select>
                        </div>
                    </div>

                    <div class="col-xs-6 col-sm-5 col-md-5">
                        <label for="prize">Precio:</label>
                        <div class="form-group input-group">
                            <span class="input-group-addon">$</span>
                            <input type="number" min="0" name="price" id="prize" formmethod="POST" class="form-control input-lg" placeholder="Ej: 1000" tabindex="7">
                        </div>
                        <g:hasErrors bean="${product}" field="price">
                            <label style="color: red"> * Este campo no puede ir vacio</label>
                        </g:hasErrors>
                    </div>
                </div>
                <br/>

                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group text-center">
                            <input id="input-id" name="rating" type="number" min=0 max=5 step=1 value="3">
                        </div>
                    </div>
                </div>
                <g:if test="${flash.message}">
                    <label style="color: red"> * ${flash.message}</label>
                </g:if>
                <hr class="colorgraph">
                <div class="form-group">
                    <g:actionSubmit  value="Terminar edición" action="update" class="btn btn-lg btn-primary btn-block btn-signin" tabindex="9"/>
                </div>

            </div>
        </g:form>
    </div>
</div>
</body>
</html>