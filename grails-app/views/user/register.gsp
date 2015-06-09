<%--
  Created by IntelliJ IDEA.
  User: johnd_000
  Date: 16/05/2015
  Time: 8:35 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'custom.css')}" />
    <!-- ||||||||||||||| SCRIPTS ||||||||||||||| -->
    <g:javascript src="jquery-1.11.2.min.js" />
    <g:javascript src="bootstrap.min.js" />
    <g:javascript src="context.js" />

    <title>Registrate</title>

</head>

<body>
<br class="container">
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

            <ul class="nav navbar-nav">
            </ul>


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
<div class="row">
    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
        <g:form role="form" enctype="multipart/form-data">
            <h2>Bienvenido a V-Market
                <br/><br/>
                <small style="color: #ffffff;">Podrás acceder a la información de muchos productos, para que elegir donde comprar y qué comprar sea mucho más fácil.</small>
            </h2>
            <hr class="colorgraph">
            <div class="card card-container-register">
                <g:hasErrors bean="${user}">
                    <div class="errors">
                        <label style="color: red"> Revisa los campos !</label>
                    </div>
                </g:hasErrors>
                <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-6">
                        <div class="form-group">
                            <input type="text" name="name" id="name" class="form-control input-lg" placeholder="Nombre" tabindex="1">
                            <g:hasErrors bean="${user}" field="name">
                                <label style="color: red"> * Este campo no puede ir vacio</label>
                            </g:hasErrors>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6">
                        <div class="form-group">
                            <input type="text" name="lastname" id="lastname" class="form-control input-lg" placeholder="Apellido" tabindex="2">
                            <g:hasErrors bean="${user}" field="lastname">
                                <label style="color: red"> * Este campo no puede ir vacio</label>
                            </g:hasErrors>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <g:textField name="username" id="username" class="form-control input-lg" placeholder="Nombre de usuario" tabindex="3"/>
                    <g:hasErrors bean="${user}" field="username">
                        <label style="color: red"> * Este campo no puede ir vacio o el nombre de usuario ya existe</label>
                    </g:hasErrors>
                </div>

                <div class="form-group">
                    <input type="email" name="email" id="email" class="form-control input-lg" placeholder="Email" tabindex="4">
                    <g:hasErrors bean="${user}" field="lastname">
                        <label style="color: red"> * Ingresa un email valido</label>
                    </g:hasErrors>
                </div>

                <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-6">
                        <div class="form-group">
                            <input type="password" name="password" id="password" formmethod="POST" class="form-control input-lg" placeholder="Contraseña" tabindex="5">
                            <g:hasErrors bean="${user}" field="password">
                                <label style="color: red"> * Revisa la longitud de la contraseña (Entre 5 y 15 caracteres)</label>
                            </g:hasErrors>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6">
                        <div class="form-group">
                            <input type="password" name="passwordConfirm" id="passwordConfirm" formmethod="POST" class="form-control input-lg" placeholder="Confirmar contraseña" tabindex="6">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                            <label for="userImage">Imagen de pefil (Opcional)</label>
                            <input type="file" name="userImage" id="userImage" formmethod="POST" class="btn btn-link form-control" placeholder="Imagen de perfil" tabindex="6">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-6">
                        <label for="birthday">
                            Fecha de nacimiento
                        </label>
                        <div class="form-group">
                            <g:datePicker name="birthday" value="${new Date(90,0,1)}" precision="day" years="${1930..2005}"/>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6">
                        <label>
                            Género
                        </label>
                        <div class="form-inline">
                            <div class="form-group">
                                <div class="radio">
                                    <label><input type="radio"  name="gender" id="gender1" value="Masculino"  placeholder="birthday" tabindex="8" checked> M</label>
                                </div>
                                <div class="radio">
                                    <label><input type="radio"  name="gender" id="gender2" value="Femenino"  placeholder="birthday" tabindex="8"> F</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <g:if test="${flash.message}">
                    <label style="color: red"> * ${flash.message}</label>
                </g:if>
                <hr class="colorgraph">
                <div class="form-group">
                    <g:actionSubmit  value="Registrate" name="submitButton" action="createUser" class="btn btn-lg btn-primary btn-block btn-signin" tabindex="9"/>
                </div>
            </div>
        </g:form>
    </div>
</div>

</body>
</html>