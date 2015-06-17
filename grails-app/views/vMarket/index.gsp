<%--
  Created by IntelliJ IDEA.
  User: Gabriel
  Date: 21/03/2015
  Time: 11:57
--%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>V-Market</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'custom.css')}" />
    <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Atomic+Age" />
    <link href='http://fonts.googleapis.com/css?family=Parisienne' rel='stylesheet' type='text/css'>

    <!-- ||||||||||||||| SCRIPTS ||||||||||||||| -->
    <g:javascript src="jquery-1.11.2.min.js" />
    <g:javascript src="bootstrap.min.js" />
</head>

<body>

<g:render template="/layouts/navbar"></g:render>

<!-- Header Carousel -->
<header id="myCarousel" class="carousel slide">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class=""></li>
        <li data-target="#myCarousel" data-slide-to="1" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="2" class=""></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
        <div class="item">
            <img src="${resource(dir: "images/slider", file: "frutas.jpg")}">
            <div class="carousel-caption">
                <div class="black-card">
                    <h2>Todo en un mismo lugar</h2>
                    <g:link controller="product" action="showCategories" class="btn btn-primary"> Ver categorias </g:link>
                </div>
            </div>
        </div>
        <div class="item active">
            <img src="${resource(dir: "images/slider", file: "shop.jpg")}">
            <div class="carousel-caption">
                <div class="black-card">
                    <h2>V-Market <span class="glyphicon glyphicon-asterisk"></span> </h2>
                    <p>Mercar nunca sera tan fácil</p>
                    <g:link controller="user" action="register" class="btn btn-primary"> Registrate </g:link>
                </div>
            </div>
        </div>
        <div class="item">
            <img src="${resource(dir: "images/slider", file: "mercar1.jpg")}">
            <div class="carousel-caption">
                <div class="black-card">
                    <h2>No compres en cualquier lugar</h2>
                    <p>¿Cual es el lugar mas cercano?</p>
                    <p>¿Cual es el lugar con los productos de mejor calidad y al menor precio?</p>
                    <g:link controller="carrito" action="show" class="btn btn-primary"> Conoce tu mejor opción </g:link>
                </div>
            </div>
        </div>
    </div>

    <!-- Controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
        <span class="icon-prev"></span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
        <span class="icon-next"></span>
    </a>
</header>

<!-- Page Content -->
<div class="container">

    <!-- Marketing Icons Section -->
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">
                Bienvenido a V-Market <span class="glyphicon glyphicon-asterisk"></span>
            </h1>
        </div>
        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4><i class="fa fa-fw fa-compass"></i> Haz la mejor compra</h4>
                </div>
                <div class="panel-body">
                    <p>Te brindamos la mas completa herramienta de selección de compra de tus productos en base a precio, calidad, y distancia</p>
                    <br/>
                    <g:link controller="carrito" action="show" class="btn btn-default"> Añade productos a tu carrito </g:link>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4><i class="fa fa-fw fa-check"></i> Todo en un mismo lugar</h4>
                </div>
                <div class="panel-body">
                    <p> Todos los productos, de todos los almacenes de Bogotá en un solo lugar. Te brindamos la informacion mas reciente de los precios y de la calidad de los productos. </p>
                    <g:link controller="product" action="showCategories" class="btn btn-default"> Ver categorias </g:link>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4><i class="fa fa-fw fa-gift"></i> Aporta a nuestra comunidad</h4>
                </div>
                <div class="panel-body">
                    <p>¿Tienes la mas reciente información sobre un producto? Aporta esta información a nuestra comunidad. Puedes actualizar o crear nuevos productos.</p>
                    <g:link controller="user" action="register" class="btn btn-default"> Registrate </g:link>
                </div>
            </div>
        </div>

    </div>
    <!-- /.row -->

    <!-- Features Section -->
    <div class="row">
        <div class="col-lg-12">
            <h2 class="page-header">¿Por qué debo tener una cuenta en V-Market?</h2>
        </div>
        <div class="col-md-6">
            <br/><br/>
            <p>Tienes los siguientes beneficios:</p>
            <ul>
                <li>Almacenar tus compras frecuentes</li>
                <li>Consultar la mejor opcion de compra</li>
                <li>Consultar las diversas calidades y precios que ofrecen los almacenes</li>
                <li>Consultar la opcion mas cercana de compra</li>
                <li>Actualizar información de los productos</li>
            </ul>
        </div>
        <div class="col-md-6">
            <img class="img-responsive" src="${resource(dir: "images",file: "maps.PNG")}" alt="">
        </div>
    </div>
    <!-- /.row -->

    <hr>

    <hr>

    <!-- Footer -->
    <footer>
        <div class="row">
            <div class="col-lg-12">
                <p>V-Market <span class="glyphicon glyphicon-asterisk"></span> 2015</p>
                <p><strong>E-Mail:</strong> helpdeskvmarket@gmail.com</p>
            </div>
        </div>
    </footer>

</div>
<!-- /.container -->

<!-- Script to Activate the Carousel -->
<script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    })
</script>
</body>
</html>