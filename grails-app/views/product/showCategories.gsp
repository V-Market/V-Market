<%--
  Created by IntelliJ IDEA.
  User: Gabriel
  Date: 17/06/2015
  Time: 2:13
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Categorias</title>

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

<div class="container">
    <br/><br/>
    <div class="row">
        <div class="col-lg-12">
            <h2 class="page-header">Categorias</h2>
        </div>
        <div class="col-md-4 col-sm-6">
            <div class="panel panel-default text-center">
                <div class="panel-heading">
                    <g:link action="Salud_y_Aseo"><img src="${resource(dir: "images/categories",file: "aseo.jpg")}" class="img-circle" width="200"/></g:link>
                </div>
                <div class="panel-body">
                    <h4>Salud y aseo</h4>
                    <br/>
                    <p>Productos de aseo, personales y de salud.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4 col-sm-6">
            <div class="panel panel-default text-center">
                <div class="panel-heading">
                    <g:link action="Licores"><img src="${resource(dir: "images/categories",file: "licores.jpg")}" class="img-circle" width="200"/></g:link>
                </div>
                <div class="panel-body">
                    <h4>Licores</h4>
                    <br/>
                    <p>Vinos, cervezas, vodka, etc.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4 col-sm-6">
            <div class="panel panel-default text-center">
                <div class="panel-heading">
                    <g:link action="Refrigerados"><img src="${resource(dir: "images/categories",file: "refrigerados.jpg")}" class="img-circle" width="200"/></g:link>
                </div>
                <div class="panel-body">
                    <h4>Refrigerados</h4>
                    <p>Todos los productos que deben ser conservados en nevera.</p>
                </div>
            </div>
        </div>
        <div class="col-md-offset-2 col-md-4 col-sm-6">
            <div class="panel panel-default text-center">
                <div class="panel-heading">
                    <g:link action="Frutas_Y_Verduras"><img src="${resource(dir: "images/categories",file: "frutas.jpg")}" class="img-circle" width="200"/></g:link>
                </div>
                <div class="panel-body">
                    <h4>Frutas y verduras</h4>
                    <p>Tomate, papa, y todo lo relacionado a productos frescos.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4 col-sm-6">
            <div class="panel panel-default text-center">
                <div class="panel-heading">
                    <g:link action="Alimentos_Y_Bebidas"><img src="${resource(dir: "images/categories",file: "varios.jpg")}" class="img-circle" width="270"/></g:link>
                </div>
                <div class="panel-body">
                    <h4>Alimentos y bebidas</h4>
                    <br/>
                    <p>Paquetes , gaseosas y demas.</p>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>