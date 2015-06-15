
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

    <title>${Product}</title>

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

        <div id="show-product" class="profile scaffold-show" role="main">
            <div class="profileContent">
                <div class="container">
                    <div class="row">
                        <h1> Producto<span class="glyphicons glyphicons-shopping-bag"></span></h1>
                    </div>
                    <div class="row">
                        <div class="col-md-1 profilep">

                        </div>
                        <div class="col-md-3 profilep">
                            <div  class="panel-body panelProductBody">
                                <img  src="${createLink(controller:'product', action:'showImage', id:"${productInstance.id}")}" width='300' />
                            </div>
                        </div>
                        <div class="col-md-8 profilep">
                            <table class="table table-hover">
                                <%--<thead>
                                <tr>
                                    <th>Firstname</th>
                                    <th>Lastname</th>
                                </tr>
                                </thead>--%>
                                <tbody>
                                <tr>
                                    <td>Nombre</td>
                                    <td><span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${productInstance}" field="name"/></span></td>
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

                </div>
                <g:form url="[resource:productInstance, action:'delete']" method="DELETE">
                    <fieldset class="buttons">
                        <g:link class="edit" action="edit" resource="${productInstance}"><g:message code="default.button.edit.label" default="Editar" /></g:link>
                        <g:actionSubmit class="list" action="index" value="${message(code: 'See product list', default: 'Lista de productos')}" onclick="return confirm('${message(code: 'See list', default: '¿Salir de descripción de producto?')}');" />
                        <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Eliminar')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: '¿Está seguro?')}');" />
                    </fieldset>
                </g:form>

            </div>
        </div>
	</body>
</html>
