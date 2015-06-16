<%--
  Created by IntelliJ IDEA.
  User: Damperius
  Date: 04/06/2015
  Time: 06:23 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'custom.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'profileOwn.css')}" />

    <link href="dist/css/bootstrap.css" rel="stylesheet">
    <script type="text/javascript" src="dist/js/jquery-1.10.2.js"></script>
    <!-- ||||||||||||||| SCRIPTS ||||||||||||||| -->
    <g:javascript src="jquery-1.11.2.min.js" />
    <g:javascript src="bootstrap.min.js" />
    <g:javascript src="context.js" />

    <title>Buscar Producto</title>

</head>

<body class="body">
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

</br></br>
<div class="container">
    <div class="row" >
        <div class="col-xs-2 col-sm-2 col-md-2">
            <h3>
                Selecciona de las opciones que deseas buscar:
            </h3>
        </div>
        <div class="col-lg-offset-2 col-sm-6">
        </br><br/>
            <div class="input-group input-group-lg">
                <input type="text" class="form-control" name="lookup" id="lookup" placeholder="Busca tu producto !!!">
                <span class="input-group-btn" id="basic-addon2">
                    <g:actionSubmitImage value="Loop" type="button" class="btn btn-default" action="clicksearch" src="${resource(dir: 'images', file: 'lupa.png')}"/>
                </span>
            </div>
        </div>
    </div>
</br>

    <div class="row">
        <div class="col-xs-3 col-sm-3 col-md-3">
            <br/><br/>
            <div class="form-group">
                <input type="checkbox" name="vcategory" id="vcategory"/>

                <label for="category">Categoria:</label>
                <select type="text" name="category" id="category" formmethod="POST" class="form-control input-lg" tabindex="1">
                    <g:each in="${categories}" status="i" var="it">
                        <option>${it}</option>
                    </g:each>
                </select>
            </div>
        </br>
            <div class="form-group">
                <input type="checkbox" name="vstore" id="vstore">
                <label for="store">Almacén:</label>
                <select type="text" name="store" id="store" formmethod="POST" class="form-control input-lg" tabindex="2">
                    <g:each in="${stores}" status="i" var="it">
                        <option value="${it.id}">${it}</option>
                    </g:each>
                </select>
            </div>
        </br>
            <div class="form-group">
                <input type="checkbox" name="vprice" id="vprize">
                <label for="price">Precio Maximo :</label>
                <input type="number" min="0" name="price" id="price" formmethod="POST" class="form-control input-lg" placeholder="00" tabindex="3">
            </div>
        </div>

        <div class="col-xs-9 col-sm-9 col-md-9">
            <div class="row">
                <g:each in="${productInstanceList}" status="i" var="productInstance">
                    <div class="col-md-4">
                        <g:render template="one_product" bean="${productInstance}" var="productInstance"></g:render>
                    </div>
                </g:each>
            </div>
        </div>
    </div>

</div>
</body>
</html>