<%--
  Created by IntelliJ IDEA.
  User: johnd_000
  Date: 15/06/2015
  Time: 12:05 PM
--%>


<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'star-rating.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'custom.css')}" />

    <link href="dist/css/bootstrap.css" rel="stylesheet">
    <script type="text/javascript" src="dist/js/jquery-1.10.2.js"></script>
    <!-- ||||||||||||||| SCRIPTS ||||||||||||||| -->
    <g:javascript src="jquery-1.11.2.min.js" />
    <g:javascript src="bootstrap.min.js" />
    <g:javascript src="context.js" />
    <g:javascript src="star-rating.js"/>

    <script type="text/javascript">
        $(document).ready(function(){
            $(".product-rate").rating({
                'size':'sm',
                showClear: false,
                starCaptions: {1: "Muy malo", 2: "Malo", 3: "Regular", 4: "Bueno", 5: "Excelente"},
                clearCaption: "Sin calificación"
            });
        });
    </script>

</head>
<body class="background-color scroll body-salud">
<!-- CABEZA DE LA PAGINA -->
<g:render template="/layouts/navbar"></g:render>
<div class="container-fluid">
    <div class="row header-style">
        <div class="col-sm-5 col-md-5 col-xs-5">
            <br/><br/><br/><br/>
            <h1 class="text-center">Salud y aseo</h1>
            <br/><br/>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="h_line"></div>
        <g:each in="${productInstanceList}" status="i" var="productInstance">
            <div class="col-md-3">
                <g:render template="one_product" bean="${productInstance}" var="productInstance"></g:render>
            </div>
        </g:each>
    </div>
</body>
</html>