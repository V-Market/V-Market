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
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'custom.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'profileOwn.css')}" />

    <link href="dist/css/bootstrap.css" rel="stylesheet">
    <script type="text/javascript" src="dist/js/jquery-1.10.2.js"></script>
    <!-- ||||||||||||||| SCRIPTS ||||||||||||||| -->
    <g:javascript src="jquery-1.11.2.min.js" />
    <g:javascript src="bootstrap.min.js" />
    <g:javascript src="context.js" />

    <title>Buscar Producto</title>

    <script>
        $('.selectpicker').selectpicker({
            style: 'btn-info',
            size: 4
        });
    </script>

</head>

<body class="body">
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

</br>
<div class="container">
<div class="row" >
    <div class="col-lg-offset-2 col-sm-6">
        <div class="input-group input-group-lg">
            <input type="text" class="form-control" placeholder="Busca tu producto !!!">
            <span class="input-group-btn" id="basic-addon2">
                <button type="button" class="btn btn-default">
                    <span class="glyphicon glyphicon-search"></span>
                </button>
            </span>
        </div>
    </div>
</div>
</br>



<div class="container" >
<div class="row">
    <div class="col-sm-2 sidebar-offcanvas">
        <select class="form-control">
            <option>Mustard</option>
            <option>Ketchup</option>
            <option>Relish</option>
        </select>
    </div>

    <div class="col-sm-10">
        <div class="thumbnail">

            <div class="container" >
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
                            <div href= class="panel-body panelProductBody">
                            <img  src="${createLink(controller:'product', action:'showImage', id:"${productInstance.id}")}" width='250' height="200" />
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
                                <td>Marca</td>
                                <td><span class="property-value" aria-labelledby="trademark-label"><g:fieldValue bean="${productInstance}" field="trademark"/></span></td>
                            </tr>
                            <tr>
                                <td>Precio</td>
                                <td><span class="property-value" aria-labelledby="prize-label"><g:fieldValue bean="${productInstance}" field="prize"/></span></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    </div>



                <%--</li>--%>
                </g:each>
            </div>
            <%--</ul>--%>
            <div class="pagination">
                <g:paginate total="${productInstanceCount ?: 0}" />
            </div>
            </div>
        </div>
    </div>

</div>
</div>
</body>
</html>