<%--
  Created by IntelliJ IDEA.
  User: johnd_000
  Date: 04/06/2015
  Time: 6:19 PM
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


    <title>${user}</title>

</head>

<body class="body">
<g:form role="form">
    <div>
        <a href="">
            <img src="https://megaricoss.files.wordpress.com/2013/10/gafas-ray-ban-aviator-en-oro-macizo-de-18-quilates-0.jpg" class="img-thumbnail" style="width: auto; height: 150px;" />
        </a>
    </div>
    <br>
    <div>
        <a href="">
            <p class="text-center" style="color: #006dba">
                Gafas Ray ban Aviator en oro macizo
            </p>
        </a>
    </div>
    <div class="ec-stars-wrapper">
        <a href="#" data-value="1" title="Votar con 1 estrellas">&#9733;</a>
        <a href="#" data-value="2" title="Votar con 2 estrellas">&#9733;</a>
        <a href="#" data-value="3" title="Votar con 3 estrellas">&#9733;</a>
        <a href="#" data-value="4" title="Votar con 4 estrellas">&#9733;</a>
        <a href="#" data-value="5" title="Votar con 5 estrellas">&#9733;</a>
    </div>
    <div>
        <p class="text-center" style="color: #3e8f3e">
            $580.000 COP
        </p>
    </div>
    <div class="checkbox" style="color: #006dba">
        <label><input type="checkbox"> Lo quiero</label>
    </div>
</g:form>

</body>
</html>