<%--
  Created by IntelliJ IDEA.
  User: Damperius
  Date: 04/06/2015
  Time: 06:23 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html xmlns="http://www.w3.org/1999/html">
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

</head>

<body class="body">
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

</br></br>
<div class="container"><g:form>
<div class="row" >
    <div class="col-xs-2 col-sm-2 col-md-2">
        <h3>
            Selecciona de las opciones que deseas buscar:
        </h3>
    </div>
    <div class="col-lg-offset-1 col-sm-6">
        </br>
        <div class="input-group input-group-lg">
            <input type="text" class="form-control" name="lookup" id="lookup" placeholder="Busca tu producto !!!">
            <span class="input-group-btn" id="basic-addon2">
                <g:actionSubmitImage value="Loop" type="button" class="btn btn-default" action="clicksearch" src="${resource(dir: 'images', file: 'lupa.png')}"/>
                    <!--<span class="glyphicon glyphicon-search"></span>-->
            </span>
        </div>

    </div>
</div>
</br>

<div class="row">
    <div class="col-xs-2 col-sm-2 col-md-2">

        <div class="form-group">
            <input type="checkbox" name="vcategory" id="vcategory"/>

            <label for="category">Categoria:</label>
            <select type="text" name="category" id="category" formmethod="POST" class="form-control input-lg" tabindex="1">
                <g:each in="${categories}" status="i" var="it">
                    <option>${it}</option>
                </g:each>
            </select>
        </div>
        </br>
        <div class="form-group">
            <input type="checkbox" name="vstore" id="vstore">
            <label for="shops">Almacén:</label>
            <select type="text" name="shops" id="shops" formmethod="POST" class="form-control input-lg" tabindex="2">
                <g:each in="${stores}" status="i" var="it">
                    <option>${it}</option>
                </g:each>
            </select>
        </div>
        </br>
            <div class="form-group">
                <input type="checkbox" name="vprize" id="vprize">
                <label for="prize">Máximo Precio:</label>
                <input type="number" min="0" name="prize" id="prize" formmethod="POST" class="form-control input-lg" placeholder="00" tabindex="3">
            </div>
    </div>

    <div class="col-xs-10 col-sm-10 col-md-10">
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
                <g:each in="${lista}" status="i" var="productInstance">
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

</div></g:form>
</div>
</body>
</html>