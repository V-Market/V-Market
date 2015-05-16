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
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'profileOwn.css')}" />
    <!-- ||||||||||||||| SCRIPTS ||||||||||||||| -->
    <g:javascript src="jquery-1.11.2.min.js" />
    <g:javascript src="bootstrap.min.js" />
    <g:javascript src="context.js" />


    <title>${user}</title>

</head>

<body class="body">
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
                <a class="navbar-brand" href="">V-Market <span class="glyphicon glyphicon-asterisk"></span>
                </a>
            </div>

            <!-- contenido del encabezado (navbar), el cual es colapsable -->
            <div id="navbar" class="navbar-collapse collapse">

                <!-- todo lo que esta alineado a la derecha (navbar-right) cambia dependiendo
                 de si el usuario esta o no loggeado-->


            <g:form class="navbar-form navbar-right">
                <div class="navbar-right">
                    <g:actionSubmit value="LogOut" name="submitButton" action="logout" class="btn btn-success"/>
                </div>
            </g:form>
            <div class="navbar-text navbar-right">Hola, ${session.user}</div>


            </div><!--/.navbar-collapse -->
        </div>
    </nav>

    <!-- Contenido de la vista -->

    <div class="profile">
        <div class="profileContent">
            <div class="container">
                <div class="row">Bienvenido a V-Market</div>
                <div class="row">
                    <div class="col-md-3 profilep">
                        <div class="panel panel-default defaultProfilePanel">
                            <div class="panel-body panelProfileBody">
                                <img src="${session.user.urlImageProfile}"  alt="${session.user.name}" class="img-rounded" width="200" height="200">
                            </div>
                            <div class="panel-body panelprofilebody2">
                                <div class="text1">${session.user.name}</div>
                                <div class="text2">${session.user.userName.toLowerCase()}</div>
                                <div class="h_line"></div>
                                <div class="text3"><span class="glyphicon glyphicon-home"></span>   ${session.user.ciudad},${session.user.pais}</div>
                                <div class="text3"><span class="glyphicon glyphicon-envelope"></span>   ${session.user.email}</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-9 statistics" >
                        <div class="panel panel-default statisticsdefaultpanel">
                            <div class="panel-body statisticsBodyPanel">
                                <img src="http://www.janzengroup.net/stats/images/example-freqcharts.JPG"  alt="${session.user.name}" class="img-rounded" width="800" height="400">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 panel panel-default statisticsDefaultPanel">
                        Historial de Compras
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>