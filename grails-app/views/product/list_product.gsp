<%--
  Created by IntelliJ IDEA.
  User: Jenny
  Date: 8/06/15
  Time: 14:05
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'custom.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'profileOwn.css')}" />

    <link href="dist/css/bootstrap.css" rel="stylesheet">
    <script type="text/javascript" src="dist/js/jquery-1.10.2.js"></script>
    <!-- ||||||||||||||| SCRIPTS ||||||||||||||| -->
    <g:javascript src="jquery-1.11.2.min.js" />
    <g:javascript src="bootstrap.min.js" />
    <g:javascript src="context.js" />


</head>

<body class="background-color scroll">
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