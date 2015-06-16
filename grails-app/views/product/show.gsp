
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'custom.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'star-rating.css')}" />
    <!-- ||||||||||||||| SCRIPTS ||||||||||||||| -->
    <g:javascript src="jquery-1.11.2.min.js" />
    <g:javascript src="bootstrap.min.js" />
    <g:javascript src="context.js" />
    <g:javascript src="star-rating.js"/>

    <script type="text/javascript">
        $(document).ready(function(){
            // with plugin options
            $(".input-id").rating({
                'size':'sm',
                //'value' : '3',
                showClear: false,
                starCaptions: {1: "Muy malo", 2: "Malo", 3: "Regular", 4: "Bueno", 5: "Excelente"},
                clearCaption: "Sin calificación"
            });
        });
    </script>

    <title>Producto</title>

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

    <div class="container-fluid">
        <div class="row header-style">
            <div class="col-sm-5 col-md-5 col-xs-5">
                <br/><br/><br/><br/>
                <h2 class="text-center">${productInstance.name}</h2>
                <br/><br/>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="card card-container-register">
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-6 text-center">
                    <img class="img-thumbnail center-block" src="${createLink(controller:'product', action:'showImage', id:"${productInstance.id}")}" style="width: auto; height: 150px" />
                    <br/>
                    <g:link action="edit" id="${productInstance.id}" class="btn btn-primary"> Edita el producto <span class="glyphicon glyphicon-pencil"></span></g:link>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <br/>
                    <strong>Marca: </strong><p><g:fieldValue bean="${productInstance}" field="trademark"/></p>
                    <strong>Tamaño / cantidad: </strong><p ><g:fieldValue bean="${productInstance}" field="size"/></p>
                    <strong>Categoria: </strong><p><g:fieldValue bean="${productInstance}" field="category"/></p>
                </div>
            </div>
            <div class="h_line"></div>
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <table class="table" width="auto">
                        <thead>
                        <tr>
                            <th>Almacen</th>
                            <th>Precio </th>
                            <th>Calidad</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${productInstance.getStoreListInfo()}" var="store">
                            <tr>
                                <th>${store.name}</th>
                                <th>$ ${store.price}</th>
                                <th><input class="input-id" data-readonly="true" value="${store.rate}"></th>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>


    </div>

	</body>
</html>
