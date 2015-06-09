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
                    <ul class="dropdown-menu dropdown-menu-custom" role="menu">
                        <div class="categories"><center> Categoria 1 | categoria 2 | Categoria 3 | categoria 4 | Categoria 5 | categoria 6 | categoria 7 | Categoria 8 | categoria 9 | Categoria 10 </center></div>
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
                            <li><g:link controller="user" action="profile">Ver perfil</g:link></li>
                            <li><a href="#">Carrito</a></li>
                            <li class="divider"></li>
                            <li><g:link controller="logout">Log out <span class="glyphicon glyphicon-log-out"></span></g:link></li>
                        </ul>
                    </li>
                </ul>
            </sec:ifLoggedIn>

        </div><!--/.navbar-collapse -->
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
                    </div>
                </div>
            </div>
        </div>
        <!-- carritos -->
        <div id="cars" class="tab-pane fade">
            <h3>Carritos recientes</h3>
            <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
            <hr/>
            <h3>Carritos frecuentes</h3>
            <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
        </div>
    </div>
</div>

</body>
</html>