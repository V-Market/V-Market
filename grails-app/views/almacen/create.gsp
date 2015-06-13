<!DOCTYPE html>
<html>
	<head>
        <title>Crear Almacen</title>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" />
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'custom.css')}" />
        <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Atomic+Age" />
        <link href='http://fonts.googleapis.com/css?family=Parisienne' rel='stylesheet' type='text/css'>

        <!-- ||||||||||||||| SCRIPTS ||||||||||||||| -->
        <g:javascript src="jquery-1.11.2.min.js" />
        <g:javascript src="bootstrap.min.js" />
	</head>
	<body>
		<!-- Cabeza de pagin-->
    <nav class="navbar navbar-inverse navbar-fixed-top background-color">
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
                <g:link controller="VMarket" action="index" class="navbar-brand">
                    V-Market <span class="glyphicon glyphicon-asterisk"></span>
                </g:link>

            </div>

            <!-- contenido del encabezado (navbar), el cual es colapsable -->
            <div id="navbar" class="navbar-collapse collapse">

                <ul class="nav navbar-nav">
                    <!--<li class=""><a href="#">Contacto</a></li>
                <!--li><a href="#">Link</a></li>-->
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Categorias <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <g:each in="${cate}" var="cat" status="it">
                                <li role="presentation"><a role='menuitem' class="standard" data-button="${it}">${cat[2]}</a></li>
                            </g:each>
                        </ul>
                    </li>
                </ul>

            <!-- todo lo que esta alineado a la derecha (navbar-right) cambia dependiendo
             de si el usuario esta o no loggeado-->
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
                                <li><a href="#">Carrito</a></li>
                                <li class="divider"></li>
                                <li><g:link controller="logout">Log out <span class="glyphicon glyphicon-log-out"></span></g:link></li>
                            </ul>
                        </li>
                    </ul>
                </sec:ifLoggedIn><!--
            <ul class="nav navbar-nav navbar-right">
                <li><a href="user/register"><span class="glyphicon glyphicon-user"></span> Registrate</a></li>
            </ul>
            <p class="nav navbar-text navbar-right" > o </p>
            <g:form class = "navbar-form navbar-right">
                <div class="form-group">
                <g:actionSubmit value="Ingresar" name="submitButton" action="doLogin" class="btn btn-success" />
                </div>
            </g:form>
            -->
            </div><!--/.navbar-collapse-->
        </div>
    </nav>
    </br>
    </br>
    <div class="row">
        <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
            <g:form role="form" enctype="multipart/form-data">
                <h2>Crear Almacen
                    <br/><br/>
                    <small style="color: #ffffff;">Aqui podrás crear un Almacen.</small>
                </h2>
                <hr class="colorgraph">
                <div class="card card-container-register">
                    <div class="row">
                        <div class="col-xs-12 col-sm-6 col-md-6">
                            <div class="form-group">
                                <input type="text" name="name" id="name" class="form-control input-lg" placeholder="Nombre" tabindex="1">
                                <g:hasErrors bean="${almacenInstance}" field="name">
                                    <label style="color: red"> * Este campo no puede ir vacio</label>
                                </g:hasErrors>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6">
                            <div class="form-group">
                                <input type="text" name="streetAddress" id="streetAddress" class="form-control input-lg" placeholder="Dirección" tabindex="2">
                                <g:hasErrors bean="${almacenInstance}" field="streetAddress">
                                    <label style="color: red"> * Este campo no puede ir vacio</label>
                                </g:hasErrors>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12">
                            <div class="form-group">
                                <label for="almacenImage">Imagen(Opcional)</label>
                                <input type="file" name="almacenImage" id="almacenImage" formmethod="POST" class="btn btn-link form-control" placeholder="Imagen de perfil" tabindex="3">
                            </div>
                        </div>
                    </div>
                    <hr class="colorgraph">
                    <div class="form-group">
                        <g:actionSubmit  value="Crear Almacen" name="submitButton" action="save" class="btn btn-lg btn-primary btn-block btn-signin" tabindex="9"/>
                    </div>
                </div>
            </g:form>
        </div>
    </div>
	</body>
</html>
