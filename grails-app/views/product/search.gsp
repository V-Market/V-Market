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

<g:render template="/layouts/navbar"></g:render>

<div class="container">
    <div class="row">
        <div class="col-xs-4 col-sm-4 col-md-4">
            <br/><br/><br/><br/>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4><i class="fa fa-fw fa-compass"></i> Busca tu producto</h4>
                </div>
                <div class="panel-body">
                    <p>Selecciona alguna de las opciones de filtrado</p>
                </div>
            </div>

            <g:form>
            <div class="input-group input-group-lg">
                <input type="text" class="form-control" name="lookup" id="lookup" placeholder="Nombre del producto">
                <span class="input-group-btn" id="basic-addon2">
                    <g:actionSubmitImage value="Loop" type="button" class="btn btn-default" action="clicksearch" src="${resource(dir: 'images', file: 'lupa.png')}"/>
                </span>
            </div>
            <br/>
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
                <label for="store">Almacén:</label>
                <select type="text" name="store" id="store" formmethod="POST" class="form-control input-lg" tabindex="2">
                    <g:each in="${stores}" status="i" var="it">
                        <option value="${it.id}">${it}</option>
                    </g:each>
                </select>
            </div>
            </br>
            <div class="form-group">
                <input type="checkbox" name="vprice" id="vprize">
                <label for="price">Precio Maximo :</label>
                <input type="number" min="0" name="price" id="price" formmethod="POST" class="form-control input-lg" placeholder="Ej: 3000" tabindex="3">
            </div>
            </g:form>
        </div>

        <div class="col-xs-8 col-sm-8 col-md-8">
            <br/><br/>
            <div class="row">
                <g:each in="${lista}" status="i" var="productInstance">
                    <div class="col-md-4">
                        <g:render template="one_product" bean="${productInstance}" var="productInstance"></g:render>
                    </div>
                </g:each>
            </div>
        </div>
    </div>

</div>
</body>
</html>