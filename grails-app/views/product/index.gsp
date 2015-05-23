
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

    <title>V-Market</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

</head>

<body class="body">
<!-- CABEZA DE LA PAGINA -->
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
                <li class="divider-vertical"></li>
                <li class="active"><a href="#">Link</a></li>
                <li><a href="#">Link</a></li>
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
                </li>
            </ul>

            <!-- todo lo que esta alineado a la derecha (navbar-right) cambia dependiendo
                 de si el usuario esta o no loggeado-->

            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><span class="glyphicon glyphicon-user"></span> Registrate</a></li>
            </ul>

            <p class="nav navbar-text navbar-right" > o </p>

            <form class="navbar-form navbar-right">
                <div class="form-group">
                    <input type="text" placeholder="Email" class="form-control">
                </div>
                <div class="form-group">
                    <input type="password" placeholder="Password" class="form-control">
                </div>
                <button type="submit" class="btn btn-success">
                    <span class="glyphicon glyphicon-log-in"></span> Ingresa
                </button>
            </form>

        </div><!--/.navbar-collapse -->
    </div>
</nav>


<div id="list-product" class="profile" role="main" >
    <div class="profileContent" >
        <div class="container">

            <div class="panel-body myproductpanel">
                <div class="text1">Lista de productos<span class="glyphicons glyphicons-asterisk"></span> </div>
            </div>


            <%--<g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>--%>
            <%--<ul class="list-group ">--%>
            <div id="list" style="max-height: 300px;" class="overflow-y-scroll">
                <g:each in="${productInstanceList}" status="i" var="productInstance">
                <%--<li class="list-group-item list-group-item-transparent">--%>


                    <div class="row thumbnail">
                        <div class="col-md-1 profilep">
                        </div>

                        <div class="col-md-3 profilep">
                            <div class="panel-body panelProductBody">
                                <img src="${productInstance.urlImageProduct}" class="img-responsive img-rounded" alt="Product image" width="200" height="150">
                            </div>
                        </div>

                        <div class="col-md-8 profilep">
                            <table class="table table-hover">
                                <tbody>
                                <tr>
                                    <td>Nombre</td>
                                    <td><g:link action="show" id="${productInstance.id}">${fieldValue(bean: productInstance, field: "name")}</g:link></td>
                                </tr>
                                <tr>
                                    <td>Descripción</td>
                                    <td><span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${productInstance}" field="description"/></span></td>
                                </tr>
                                <tr>
                                    <td>Marca</td>
                                    <td><span class="property-value" aria-labelledby="trademark-label"><g:fieldValue bean="${productInstance}" field="trademark"/></span></td>
                                </tr>
                                <tr>
                                    <td>Identificación</td>
                                    <td><span class="property-value" aria-labelledby="id-label"><g:fieldValue bean="${productInstance}" field="id"/></span></td>
                                </tr>
                                <tr>
                                    <td>Precio</td>
                                    <td><span class="property-value" aria-labelledby="prize-label"><g:fieldValue bean="${productInstance}" field="prize"/></span></td>
                                </tr>
                                <tr>
                                    <td>Disponible en</td>
                                    <td><span class="property-value" aria-labelledby="shops-label"><g:fieldValue bean="${productInstance}" field="shops"/></span></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>



                <%--</li>--%>
                </g:each>

                <footer>
                    <p>© V-Market 2015</p>
                </footer>
            </div>
            <%--</ul>--%>
            <div class="pagination">
                <g:paginate total="${productInstanceCount ?: 0}" />
            </div>
        </div>
    </div>
</div>
</body>
</html>
