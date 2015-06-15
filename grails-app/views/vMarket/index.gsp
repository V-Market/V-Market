<%--
  Created by IntelliJ IDEA.
  User: Gabriel
  Date: 21/03/2015
  Time: 11:57
--%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>V-Market</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'custom.css')}" />
    <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Atomic+Age" />
    <link href='http://fonts.googleapis.com/css?family=Parisienne' rel='stylesheet' type='text/css'>

    <!-- ||||||||||||||| SCRIPTS ||||||||||||||| -->
    <g:javascript src="jquery-1.11.2.min.js" />
    <g:javascript src="bootstrap.min.js" />

    <script>
        var init = true;
        var index = 0;
        var divs = ['.categorias','.background','.whoarewe','.contacto'];
        var categories = [${categories}];
        var indexC = 0;
        var events = [];
        var semaforo = false;
        var current = 0;
        $(document).ready(function() {
            if(init){
                init = false;
                index = 0;
                scrollToID(divs[0], 750);
            }
            $(".standard").click(function(){
                var index = $(this).attr('data-button');
                if(index == current) return;
                $(categories[current]).removeClass();
                $(categories[index]).removeClass();
                if(index>current) {
                    $(categories[current]).addClass('defaultSaleDerecha');
                    $(categories[index]).addClass('defaultEntraIzquierda');
                }else{
                    $(categories[current]).addClass('defaultSaleIzquierda');
                    $(categories[index]).addClass('defaultEntraDerecha');
                }
                view = categories[index];
                current = index;
                var intervalo = setInterval(function(){
                    if(view!=null){
                        for(var j=0;j<categories.length;j++){
                            if(categories[j]==view){
                                $(view).removeClass().addClass('default');
                                continue;
                            }
                            $(categories[j]).removeClass();
                            $(categories[j]).addClass('defaultHide');
                        }
                        view = null;
                    }
                    window.clearInterval(intervalo);
                }, 1000);
            });
            $('a[href^="#"]').click(function(){
                scrollToID(divs[0], 750, 0,0);
                index = 0;
            });
        });
        window.onkeydown = function h(e){
            var view;
            switch (e.keyCode) {
                case 38:
                    if(index !=0) {
                        index = index - 1 ;
                        scrollToID(divs[index], 750, divs[index+1], index+1);
                    }
                    if(index == 0) {
                        //$('.background-color').css('background-color', 'transparent');
                    }
                    if(index%2==0) {
                        var a = $('.Title3').removeClass();
                        a.addClass('Title');
                    }else{
                        var a = $('.Title').removeClass();
                        a.addClass('Title3');
                    }
                    break;
                case 40:
                    if(index != 4) {
                        index = index + 1;
                        scrollToID(divs[index], 750, divs[index-1], index-1);
                    }
                    if(index == 0) {
                        //$('.background-color').css('background-color', 'transparent');
                    }
                    if(index == 1) {
                        //$('.background-color').css('background-color', 'white');
                    }
                    if(index%2==0) {
                        var a = $('.Title3').removeClass();
                        a.addClass('Title');
                    }else{
                        var a = $('.Title').removeClass();
                        a.addClass('Title3');
                    }
                    break;
            }
        };
        function scrollToID(id, speed, before, index){
            var offSet = 50;
            var targetOffset = $(id).offset().top - offSet;
            $(id).css('opacity','1');
            $('html,body').animate({scrollTop:targetOffset}, speed);
        }
    </script>

</head>

<body class="wrapper">

<!-- CABEZA DE LA PAGINA -->
<nav class="navbar navbar-inverse navbar-fixed-top background-color">
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
            <g:link controller="VMarket" action="index" class="navbar-brand">
                V-Market <span class="glyphicon glyphicon-asterisk"></span>
            </g:link>

        </div>

        <!-- contenido del encabezado (navbar), el cual es colapsable -->
        <div id="navbar" class="navbar-collapse collapse">

            <ul class="nav navbar-nav">
                <!--<li class=""><a href="#">Contacto</a></li>
                <!--li><a href="#">Link</a></li>-->
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Categorias <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <g:each in="${cate}" var="cat" status="it">
                            <li role="presentation"><a role='menuitem' class="standard" data-button="${it}">${cat[2]}</a></li>
                        </g:each><!--
                        <li><g:link action="index">Salud y aseo</g:link></li>
                        <li><g:link action="index">Licores</g:link></li>
                        <li><g:link action="index">Refrigerados</g:link></li>
                        <li><g:link action="index">Salud y aseo</g:link></li>
                        <li><g:link action="index">Salud y aseo</g:link></li-->
                    </ul>
                </li>
            </ul>

        <!-- todo lo que esta alineado a la derecha (navbar-right) cambia dependiendo
             de si el usuario esta o no loggeado-->
            <sec:ifNotLoggedIn>
                <ul class="nav navbar-nav navbar-right">
                    <li><g:link controller="user" action="register"> <span class="glyphicon glyphicon-user"></span> Registrate</g:link></li>
                </ul>

                <p class="nav navbar-text navbar-right" > o </p>

                <ul class="nav navbar-nav navbar-right">
                    <li><g:link controller="login"><span class="glyphicon glyphicon-log-in"></span> Ingresa</g:link></li>
                </ul>
            </sec:ifNotLoggedIn>
            <sec:ifLoggedIn>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                            <sec:username /> <span class="glyphicon glyphicon-user"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><g:link controller="user" action="profile" id="${user.id}">Ver perfil</g:link></li>
                            <li><g:link controller="carrito" action="show" >Carrito</g:link></li>
                            <li class="divider"></li>
                            <li><g:link controller="logout">Log out <span class="glyphicon glyphicon-log-out"></span></g:link></li>
                        </ul>
                    </li>
                </ul>
            </sec:ifLoggedIn><!--
            <ul class="nav navbar-nav navbar-right">
                <li><a href="user/register"><span class="glyphicon glyphicon-user"></span> Registrate</a></li>
            </ul>
            <p class="nav navbar-text navbar-right" > o </p>
            <g:form class = "navbar-form navbar-right">
            <div class="form-group">
            <g:actionSubmit value="Ingresar" name="submitButton" action="doLogin" class="btn btn-success" />
            </div>
        </g:form>
        -->
        </div><!--/.navbar-collapse-->
    </div>
</nav>



<div class="categorias">
    <div class="wrapper">
        <g:each in="${cate}" var="cat" status="it">
            <g:if test="${it==0}">
                <div class="default" id="${cat[1]}" >

                    <div class="Title">${cat[2]}</div>
                </div>
            </g:if>
            <g:else>
                <div class="defaultHide" id="${cat[1]}">

                    <div class="Title">${cat[2]}</div>
                </div>
            </g:else>
        </g:each>
    </div>
</div>
<div class="background" onscroll="categorias(this)">
    <div class="Title">V-Market</div>
</div>
<div class="whoarewe">
    <div class="row top">
        <div class="col-xs-3"><img src="${resource(dir:'images', file:'vmarket-logo.jpg')}"  width="250" height="250">
            <div class="mask">
                <h2>¿Quienes Somos?</h2>
                <p>Estudiantes Activos Universidad Nacional de Colombia</p>
            </div>
        </div>
        <div class="col-xs-3"><img src="${resource(dir:'images', file:'Jenny.jpg')}"  width="250" height="250">
            <div class="mask">
                <h2>Jenny Sanchez</h2>
                <p>Estudiante de Ingeniería de Sistemas y Estadística</p>
                <a href="http://www.facebook.com">@JennySanchez</a>
            </div>
        </div>
        <div class="col-xs-3"><img src="${resource(dir:'images', file:'Gabriel.jpg')}"  width="250" height="250">
            <div class="mask">
                <h2>Gabriel Torres</h2>
                <p>Estudiante de Ingeniería de Sistemas y Computación</p>
                <a href="http://www.facebook.com">@GabrielTorres</a>
            </div>
        </div>
        <div class="col-xs-3"><img src="${resource(dir:'images', file:'Neill.jpg')}" width="250" height="250">
            <div class="mask">
                <h2>Neill Giraldo</h2>
                <p>Estudiante de Ingeniería de Sistemas y Computación</p>
                <a href="http://www.facebook.com">@NeillGiraldo</a>
            </div>
        </div>
        <div class="col-xs-3"><img src="${resource(dir:'images', file:'John.jpg')}" width="250" height="250" >
            <div class="mask">
                <h2>John Ubaldo</h2>
                <p>Estudiante de Ingeniería de Sistemas y Computación</p>
                <a href="http://www.facebook.com">@JohnUbaldo</a>
            </div>
        </div>
        <div class="col-xs-3"><img src="${resource(dir:'images', file:'Manuel.jpg')}" width="250" height="250">
            <div class="mask">
                <h2>Manuel Zambrano</h2>
                <p>Estudiante de Ingeniería de Sistemas y Computación</p>
                <a href="http://www.facebook.com">@ManuelZambrano</a>
            </div>
        </div>
        <div class="col-xs-3"><img src="${resource(dir:'images', file:'david.jpeg')}" width="250" height="250">
            <div class="mask">
                <h2>David Martinez</h2>
                <p>Estudiante de Ingeniería de Sistemas y Computación</p>
                <a href="http://www.facebook.com">@DavidMartinez</a>
            </div>
        </div>
        <div class="col-xs-3"><img src="${resource(dir:'images', file:'unal.gif')}"  width="250" height="250">
            <div class="mask">
                <h2>Ingenieria de Software II</h2>
                <p>Profesor: Jairo Aponte</p>
            </div>
        </div>

    </div>

</div>
<div class="contacto">
    <div style="font-family: 'lexia', bold; font-size: 45px; color:#ffffff; padding-left: 40px  ">
        <div class="row">
            <div class="col-md-4">V-Market</div>
            <div class="col-md-2" style="position: absolute; left:30%; top:25%; font-family: 'lexia', serif; line-height: 1.6em; font-weight: 100; font-size: 18px; letter-spacing: 3px">helpdeskvmarket@gmail.com</div>
            <div class="col-md-6" style="text-align: right; padding-right: 40px">
                <img src="${resource(dir: 'images',file:'facebook.png')}" width="25px" height="25px"/>
                <img src="${resource(dir: 'images',file:'twittericon.jpg')}" width="25px" height="25px"/>
                <img src="${resource(dir: 'images',file:'youtube.jpg')}" width="50px" height="25px"/>
            </div>
        </div>
    </div>
</div>
<footer class="ourFooter">
    <div style="vertical-align: middle; position: absolute; top: 35%; line-height: 1.6em; font-weight: 300; font-size: 12px; letter-spacing: 2px; padding-left: 20px"> © V-Market 2015, All rights reserved </div>
</footer>


<!-- AQUI debe ir el contenido de cada vista !!!!!!!!!-->

</body>
</html>