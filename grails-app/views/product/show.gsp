
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'custom.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'star-rating.css')}" />
    <!-- ||||||||||||||| SCRIPTS ||||||||||||||| -->
    <g:javascript src="jquery-1.11.2.min.js" />
    <g:javascript src="bootstrap.min.js" />
    <g:javascript src="context.js" />
    <g:javascript src="star-rating.js"/>

    <script type="text/javascript">
        $(document).ready(function(){
            // with plugin options
            $(".input-id").rating({
                'size':'sm',
                //'value' : '3',
                showClear: false,
                starCaptions: {1: "Muy malo", 2: "Malo", 3: "Regular", 4: "Bueno", 5: "Excelente"},
                clearCaption: "Sin calificación"
            });
        });
    </script>

    <title>Producto</title>

</head>

    <body class="body">
    <g:render template="/layouts/navbar"></g:render>

    <div class="container-fluid">
        <div class="row header-style">
            <div class="col-sm-5 col-md-5 col-xs-5">
                <br/><br/><br/><br/>
                <h2 class="text-center">${productInstance.name}</h2>
                <br/><br/>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="card card-container-register">
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-6 text-center">
                    <img class="img-thumbnail center-block" src="${createLink(controller:'product', action:'showImage', id:"${productInstance.id}")}" style="width: auto; height: 150px" />
                    <br/>
                    <g:link action="edit" id="${productInstance.id}" class="btn btn-primary"> Edita el producto <span class="glyphicon glyphicon-pencil"></span></g:link>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <br/>
                    <strong>Marca: </strong><p><g:fieldValue bean="${productInstance}" field="trademark"/></p>
                    <strong>Tamaño / cantidad: </strong><p ><g:fieldValue bean="${productInstance}" field="size"/></p>
                    <strong>Categoria: </strong><p><g:fieldValue bean="${productInstance}" field="category"/></p>
                </div>
            </div>
            <div class="h_line"></div>
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <table class="table" width="auto">
                        <thead>
                        <tr>
                            <th>Almacen</th>
                            <th>Precio </th>
                            <th>Calidad</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${productInstance.getStoreListInfo()}" var="store">
                            <tr>
                                <th>${store.name}</th>
                                <th>$ ${store.price}</th>
                                <th><input class="input-id" data-readonly="true" value="${store.rate}"></th>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>


    </div>

	</body>
</html>
