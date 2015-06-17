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
<g:render template="/layouts/navbar"></g:render>


<div id="show-almacen" class="profile scaffold-show" role="main">
    <div class="profileContent">
        <div class="container">
            <div class="row">
                <h1> Almacén<span class="glyphicons glyphicons-shopping-bag"></span></h1>
            </div>
            <div class="row">
                <div class="col-md-1 profilep">

                </div>
                <div class="col-md-3 profilep">
                    <div  class="panel-body panelAlmacenBody">
                        <img src='${createLink(controller:"almacen", action:"showAlmacenImage", id:"${almacen.id}")}' class="img-responsive img-rounded" alt="Almacen image" width="200" height="150">
                    </div>
                </div>
                <div class="col-md-8 profilep">
                    <table class="table table-hover">

                        <tbody>
                        <tr>
                            <td>Nombre Comercial</td>
                            <td><span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${almacenInstance}" field="name"/></span></td>
                        </tr>
                        <tr>
                            <td>Dirección</td>
                            <td><span class="property-value" aria-labelledby="nit-label"><g:fieldValue bean="${almacenInstance}" field="streetAddress"/></span></td>
                        </tr>
                        <img src="https://maps.googleapis.com/maps/api/staticmap?center=40.714728,-73.998672&zoom=12&size=400x400" width="250" height="250"/>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
        <g:form url="[resource:almacenInstance, action:'delete']" method="DELETE">
            <fieldset class="buttons">
                <g:link class="edit" action="edit" resource="${almacenInstance}"><g:message code="default.button.edit.label" default="Editar" /></g:link>
                <g:actionSubmit class="list" action="index" value="${message(code: 'See almacen list', default: 'Lista de almacenes')}" onclick="return confirm('${message(code: 'See list', default: '¿Salir de descripción del almacén?')}');" />
                <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Eliminar')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: '¿Está seguro?')}');" />
            </fieldset>
        </g:form>

        <footer>
            <p>© V-Market 2015</p>
        </footer>

    </div>
</div>
</body>
</html>