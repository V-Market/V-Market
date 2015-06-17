<%--
  Created by IntelliJ IDEA.
  User: Gabriel
  Date: 17/06/2015
  Time: 3:56
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Carrito</title>
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'custom.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'carrito.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'star-rating.css')}" />

    <!-- ||||||||||||||| SCRIPTS ||||||||||||||| -->
    <g:javascript src="jquery-1.11.2.min.js" />
    <g:javascript src="bootstrap.min.js" />
    <g:javascript src="context.js" />
</head>

<body>

<g:render template="/layouts/navbar"></g:render>

<div class="container">
    <br/><br/><br/>
    <div class="row" style="width:100%">
        <div class="h_line"></div>
        <g:each in="${carrito.products}" status="i" var="productInstance">
            <div class="col-md-3">
                <g:render template="/product/one_product" bean="${productInstance}" var="productInstance" style="width: 100%"/>
            </div>
        </g:each>
    </div>
</div>

</body>
</html>