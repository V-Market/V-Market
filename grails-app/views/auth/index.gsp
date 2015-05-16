<%--
  Created by IntelliJ IDEA.
  User: Gabriel
  Date: 21/03/2015
  Time: 11:57
--%>

<!DOCTYPE html>
<html>
<head>
    <title>V-Market</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" />

    <!-- ||||||||||||||| SCRIPTS ||||||||||||||| -->
    <g:javascript src="jquery-1.11.2.min.js" />
    <g:javascript src="bootstrap.min.js" />

</head>
<body>

<!-- CABEZA DE LA PAGINA -->
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
                <li class=""><a href="#">Contacto</a></li>
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

<!-- AQUI debe ir el contenido de cada vista !!!!!!!!!-->


<footer>
    <p>© V-Market 2015</p>
</footer>

</div>
</body>
</html>