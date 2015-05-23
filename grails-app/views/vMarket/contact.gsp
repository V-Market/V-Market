<%--
  Created by IntelliJ IDEA.
  User: Gabriel
  Date: 17/05/2015
  Time: 12:17
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <head>
        <title>V-Market</title>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" />
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'styles.css')}" />

        <!-- ||||||||||||||| SCRIPTS ||||||||||||||| -->
    <g:javascript src="jquery-1.11.2.min.js" />
    <g:javascript src="bootstrap.min.js" />

    </head>
</head>

<body class="full">
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <!--El header es el "fondo" del encabezado (navbar-header)-->
            <div class="navbar-header">
                <!-- Si la pagina se vuelve pequeña (sr-only) aparece un botton
              que al desplegarse mostrara el contenido del encabezado
              (data-target="#navbar"), esto se llama "colapsar".-->
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!--El header contiene el boton "inicio"-->
                <a class="navbar-brand" href="#">V-Market <span class="glyphicon glyphicon-asterisk"></span>
                </a>
            </div>

            <!-- contenido del encabezado (navbar), el cual es colapsable -->
            <div id="navbar" class="navbar-collapse collapse">

                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">Contacto</a></li>
                    <!--li><a href="#">Link</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#">Action</a></li>
                            <li><a href="#">Another action</a></li>
                            <li><a href="#">Something else here</a></li>
                            <li class="divider"></li>
                            <li><a href="#">Separated link</a></li>
                            <li class="divider"></li>
                            <li><a href="#">One more separated link</a></li>
                        </ul>
                    </li-->
                </ul>

                <!-- todo lo que esta alineado a la derecha (navbar-right) cambia dependiendo
                 de si el usuario esta o no loggeado-->

                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#"><span class="glyphicon glyphicon-user"></span> Registrate</a></li>
                </ul>

                <p class="nav navbar-text navbar-right" > o </p>

                <g:form class = "navbar-form navbar-right">
                    <div class="form-group">
                        <g:textField name="username" class="form-control" placeholder="User name"/>
                        <g:passwordField name="password" class="form-control" placeholder="Password" />
                        <g:actionSubmit value="Ingresa" name="submitButton" action="doLogin" class="btn btn-success" />
                    </div>
                </g:form>

            </div><!--/.navbar-collapse -->
        </div>
    </nav>

    <div class="container">
        <br/><br/><br/>
        <div class="row">
            <div class="col-sm-8">
                <div class="page-header">
                    <h1 style="color:#ffffff">Contactanos</h1>
                </div>
            </div>
        </div>

        <br/><br/>
        <div class="row well">
            <g:if test="${flash.message}">
                <h1 class="text-center" style="color: darkred"> ${flash.message} </h1>
                <hr/>
            </g:if>
            <div class="col-sm-4 col-sm-offset-2">
                <legend>Datos personales</legend>
                <g:form role="form" name="contact">

                    <div class="form-group">
                        <label>Name:</label>
                        <input class="form-control" name="name">
                    </div>
                    <div class="form-group">
                        <label for="email">Correo electronico:</label>
                        <input type="email" class="form-control" name="email">
                    </div>
                    <div class="form-group">
                        <label>Telefono:</label>
                        <input class="form-control" name="phone">
                    </div>

            </div>

            <div class="col-sm-4">

                <legend>Escribe tu mensaje</legend>

                    <div class="form-group">
                        <label>Asunto:</label>
                        <input class="form-control" name="subject">
                    </div>
                    <div class="form-group">
                        <label for="email">Mensaje:</label>
                        <textarea class="form-control" rows="5" name="body"></textarea>
                    </div>

            </div>
        </div>

        <div class="row">
            <div class="col-sm-8 col-sm-offset-2">
                <g:actionSubmit value="Enviar" action="emailUser" style="width: 100%" class="btn btn-default btn-lg"></g:actionSubmit>
                <!--button type="submit" style="width: 100%" class="btn btn-default btn-lg">Enviar</button-->
                </g:form>
            </div>
        </div>

        <!--div class="well center-block">

            <h1>Informacion de contacto</h1>
            <hr>
            <p><b>PBX:</b>              245 96 47</p>
            <p><b>Direccion:</b>        Cr 30 # 45 - 11</p>
            <p><b>E-MAIL:</b>           vmarket@gmail.com</p>

        </div-->

    </div>
</body>
</html>