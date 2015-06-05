<html>
<head>
    <title>V-Market</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'styles.css')}" />

    <!-- ||||||||||||||| SCRIPTS ||||||||||||||| -->
    <g:javascript src="jquery-1.11.2.min.js" />
    <g:javascript src="bootstrap.min.js" />
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top background-color">
    <div class="container">
        <!--El header es el "fondo" del encabezado (navbar-header)-->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <!--El header contiene el boton "inicio"-->
            <g:link controller="VMarket" action="index" class="navbar-brand">
                V-Market <span class="glyphicon glyphicon-asterisk"></span>
            </g:link>

        </div>
        <!-- contenido del encabezado (navbar), el cual es colapsable -->
        <div id="navbar" class="navbar-collapse collapse">

            <ul class="nav navbar-nav">
            </ul>

        <!-- todo lo que esta alineado a la derecha (navbar-right) cambia dependiendo
             de si el usuario esta o no loggeado-->

            <sec:ifNotLoggedIn>
                <ul class="nav navbar-nav navbar-right">
                    <li><g:link controller="user" action="register"><span class="glyphicon glyphicon-user"></span> Registrate</g:link></li>
                </ul>
            </sec:ifNotLoggedIn>

        </div><!--/.navbar-collapse -->
    </div>
</nav>

<div class="container vertical-center">
    <div class="card card-container">
        <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
        <img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" />
        <p id="profile-name" class="profile-name-card"></p>

        <form class="form-signin" action='${postUrl}' method='POST' id='loginForm'>
            <span id="reauth-email" class="reauth-email"></span>
            <input name='j_username' id='username' class="form-control" placeholder="Nombre de usuario" required autofocus>
            <input type="password" name='j_password' id='password' class="form-control" placeholder="Contraseña" required>
            <div id="remember" class="checkbox">
                <label>
                    <input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/> Recuerdame
                </label>
            </div>
            <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit" id="submit" value='${message(code: "springSecurity.login.button")}'>Ingresa</button>
        </form><!-- /form -->
        <a href="#" class="forgot-password">
            ¿Olvidaste tu contraseña?
        </a>
    </div><!-- /card-container -->
</div><!-- /container -->
</body>
</html>
