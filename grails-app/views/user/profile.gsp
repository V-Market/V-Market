<%--
  Created by IntelliJ IDEA.
  User: Neill
  Date: 4/15/2015
  Time: 8:57 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'custom.css')}" />
    <!-- ||||||||||||||| SCRIPTS ||||||||||||||| -->
    <g:javascript src="jquery-1.11.2.min.js" />
    <g:javascript src="bootstrap.min.js" />
    <g:javascript src="context.js" />


    <title>${user.username}</title>

</head>

<body>
<!-- CABEZA DE LA PAGINA -->
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

<!-- Contenido de la vista -->
<div class="container">
    <h2>Perfil de usuario</h2>
    <ul class="nav nav-tabs nav-justified tab-style">
        <li class="active"><a data-toggle="tab" href="#info">Mi información</a></li>
        <li><a data-toggle="tab" href="#cars">Mis carritos</a></li>
    </ul>

    <div class="tab-content">
        <!-- info -->
        <div id="info" class="tab-pane fade in active">
            <br/><br/>
            <div class="card card-container-register">
                <div class="row">
                    <div class="col-sm-6">
                        <g:if test="${user.userImage.length == 0}">
                            <img id="profile-img" class="profile-img-card" src="${resource(dir: 'images', file: 'avatar_user.png')}"  />
                        </g:if>
                        <g:else>
                            <img class="img-thumbnail" src="${createLink(controller:"user", action:"showUserImage", id:"${user.id}")}" width="300" />
                        </g:else>
                        <hr/>
                        <h2 class="text-center" style="text-decoration: underline">${user.username}</h2>
                    </div>
                    <div class="col-sm-6">
                        <p><strong>Nombre: </strong>${user.name} ${user.lastname}</p>
                        <p><strong>Email: </strong>${user.email} </p>
                        <p><strong>Genero: </strong>${user.gender} </p>
                        <p><strong>Edad: </strong>${user.age} </p>
                        <br>
                        <g:link action="edit" class="btn btn-success"> Edita tu información <span class="glyphicon glyphicon-pencil"></span></g:link>
                        <br/><br/>
                        <g:link controller="product" action="newProduct" class="btn btn-primary"> Añade un Nuevo Producto Aquí <span class="glyphicon glyphicon-pencil"></span></g:link>
                    </div>



                </div>
            </div>
        </div>
        <!-- carritos -->
        <div id="cars" class="tab-pane fade">
        <div class="row">
            <g:each in="${user.getCarritos()}" status="i" var="carrito">
                <g:if test="${carrito?.almacen}">
                <div class="col-md-4">
                    <div class="card card-container-register">
                        <g:link controller="carrito" action="showCarrito" id="${carrito.id}">
                            <div class="row">
                                <div class="col-sm-4">
                                    <img src="${resource(dir: "images",file: "carrito.png")}" alt=""width="60"/>
                                </div>
                                <div class="col-sm-8">
                                    <h3> Ver productos</h3>
                                </div>
                            </div>
                        </g:link>
                        <br/><br/>
                        <p><strong>Almacen : </strong>${carrito.almacen}</p>
                        <p><strong>Distancia(en metros) : </strong>${carrito.distance}</p>
                        <p><strong>Precio total : </strong>${carrito.price}</p>
                    </div>
                </div>
                </g:if>
            </g:each>
        </div>
        </div>

    </div>
</div>

</body>
</html>