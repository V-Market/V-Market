<%--
  Created by IntelliJ IDEA.
  User: Damperius
  Date: 04/06/2015
  Time: 06:23 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
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

    <title>Nuevo Producto</title>

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
            <g:link controller="VMarket" action="index" class="navbar-brand">
                V-Market <span class="glyphicon glyphicon-asterisk"></span>
            </g:link>
        </div>

        <!-- contenido del encabezado (navbar), el cual es colapsable -->
        <div id="navbar" class="navbar-collapse collapse">

            <ul class="nav navbar-nav">
            </ul>


            <sec:ifNotLoggedIn>
                <ul class="nav navbar-nav navbar-right">
                    <li><g:link controller="login"> <span class="glyphicon glyphicon-log-in"></span> Ingresa</g:link></li>
                </ul>
            </sec:ifNotLoggedIn>

        </div><!--/.navbar-collapse -->
    </div>
</nav>
</br>
</br>
<div class="row">
    <div class="col-xs-12 col-sm-8 col-md-8 col-sm-offset-2 col-md-offset-2">
        <g:form role="form" enctype="multipart/form-data">
            <h2>Crear Producto
                <br/><br/>
                <small style="color: #ffffff;">Aqui podrás aportar a nuestra comunidad nuevos productos.</small>
            </h2>
            <hr class="colorgraph">
            <div class="card card-container-register">
                <g:hasErrors bean="${product}">
                    <div class="errors">
                        <label style="color: red"> Revisa los campos</label>
                    </div>
                </g:hasErrors>
                <div class="row">
                    <div class="col-xs-12 col-sm-7 col-md-7">
                        <div class="form-group">
                            <label for="name">Nombre del Producto:</label>
                            <input type="text" name="name" id="name" class="form-control input-lg" placeholder="Ej: Leche Deslactosada" tabindex="1">
                            <g:hasErrors bean="${product}" field="name">
                                <label style="color: red" for="name"> * Este campo no puede ir vacio</label>

                            </g:hasErrors>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-5 col-md-5">
                        <div class="form-group">
                            <label for="trademark">Marca:</label>
                            <input type="text" name="trademark" id="trademark" class="form-control input-lg" placeholder="Ej: Alpina" tabindex="2">
                            <g:hasErrors bean="${product}" field="trademark">
                                <label style="color: red" for="trademark"> * Este campo no puede ir vacio</label>
                            </g:hasErrors>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-12 col-sm-7 col-md-7">
                        <div class="form-group">
                            <label for="size">Tamaño:</label>
                            <input type="text" name="size" id="size" class="form-control input-lg" placeholder="Ej: Grande / 1 litro / 500 gr" tabindex="4">
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-5 col-md-5">
                        <div class="form-group">
                            <label for="category">Categoria:</label>
                            <select type="text" name="category" id="category" formmethod="POST" class="form-control input-lg" tabindex="5">
                                <g:each in="${categories}" status="i" var="it">
                                    <option>${it}</option>
                                </g:each>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-12 col-sm-7 col-md-7">
                        <div class="form-group">
                            <label for="shops">Almacén:</label>
                            <select type="text" name="shops" id="shops" formmethod="POST" class="form-control input-lg" tabindex="8">
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
                        <div class="form-group">
                            <input type="file" class="filestyle" data-buttonText=" Sube una imagen " data-buttonName="btn-primary" id="image" name="image"/>
                        </div>
                    </div>
                </div>

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
                    <g:actionSubmit  value="Crear Nuevo Producto" name="submitButton" action="createProduct" class="btn btn-lg btn-primary btn-block btn-signin" tabindex="9"/>
                </div>

            </div>
        </g:form>
    </div>
</div>
</body>
</html>