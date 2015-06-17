<!DOCTYPE html>
<html>
	<head>
        <title>Crear Almacen</title>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" />
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'custom.css')}" />
        <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Atomic+Age" />
        <link href='http://fonts.googleapis.com/css?family=Parisienne' rel='stylesheet' type='text/css'>

        <!-- ||||||||||||||| SCRIPTS ||||||||||||||| -->
        <g:javascript src="jquery-1.11.2.min.js" />
        <g:javascript src="bootstrap.min.js" />
	</head>
	<body>
		<!-- Cabeza de pagin-->
    <g:render template="/layouts/navbar"></g:render>
    </br>
    </br>
    <div class="row">
        <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
            <g:form role="form" enctype="multipart/form-data">
                <h2>Crear Almacen
                    <br/><br/>
                    <small style="color: #ffffff;">Aqui podrás crear un Almacen.</small>
                </h2>
                <hr class="colorgraph">
                <div class="card card-container-register">
                    <div class="row">
                        <div class="col-xs-12 col-sm-6 col-md-6">
                            <div class="form-group">
                                <input type="text" name="name" id="name" class="form-control input-lg" placeholder="Nombre" tabindex="1">
                                <g:hasErrors bean="${almacenInstance}" field="name">
                                    <label style="color: red"> * Este campo no puede ir vacio</label>
                                </g:hasErrors>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6">
                            <div class="form-group">
                                <input type="text" name="streetAddress" id="streetAddress" class="form-control input-lg" placeholder="Dirección" tabindex="2">
                                <g:hasErrors bean="${almacenInstance}" field="streetAddress">
                                    <label style="color: red"> * Este campo no puede ir vacio</label>
                                </g:hasErrors>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12">
                            <div class="form-group">
                                <label for="almacenImage">Imagen(Opcional)</label>
                                <input type="file" name="almacenImage" id="almacenImage" formmethod="POST" class="btn btn-link form-control" placeholder="Imagen de perfil" tabindex="3">
                            </div>
                        </div>
                    </div>
                    <hr class="colorgraph">
                    <div class="form-group">
                        <g:actionSubmit  value="Crear Almacen" name="submitButton" action="save" class="btn btn-lg btn-primary btn-block btn-signin" tabindex="9"/>
                    </div>
                </div>
            </g:form>
        </div>
    </div>
	</body>
</html>
