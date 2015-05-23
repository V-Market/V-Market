<%@ page import="v.market.Almacen" %>



<div class="fieldcontain ${hasErrors(bean: almacenInstance, field: 'nit', 'error')} required">
	<label for="nit">
		<g:message code="almacen.nit.label" default="Nit" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nit" type="number" value="${almacenInstance.nit}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: almacenInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="almacen.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${almacenInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: almacenInstance, field: 'razonSocial', 'error')} required">
	<label for="razonSocial">
		<g:message code="almacen.razonSocial.label" default="Razon Social" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="razonSocial" required="" value="${almacenInstance?.razonSocial}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: almacenInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="almacen.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${almacenInstance?.address}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: almacenInstance, field: 'telefono', 'error')} required">
	<label for="telefono">
		<g:message code="almacen.telefono.label" default="Telefono" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="telefono" required="" value="${almacenInstance?.telefono}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: almacenInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="almacen.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${almacenInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: almacenInstance, field: 'ciudad', 'error')} required">
	<label for="ciudad">
		<g:message code="almacen.ciudad.label" default="Ciudad" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="ciudad" required="" value="${almacenInstance?.ciudad}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: almacenInstance, field: 'pais', 'error')} required">
	<label for="pais">
		<g:message code="almacen.pais.label" default="Pais" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="pais" required="" value="${almacenInstance?.pais}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: almacenInstance, field: 'tipoProducto', 'error')} required">
	<label for="tipoProducto">
		<g:message code="almacen.tipoProducto.label" default="Tipo Producto" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="tipoProducto" required="" value="${almacenInstance?.tipoProducto}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: almacenInstance, field: 'urlImageProfile', 'error')} required">
	<label for="urlImageProfile">
		<g:message code="almacen.urlImageProfile.label" default="Url Image Profile" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="urlImageProfile" required="" value="${almacenInstance?.urlImageProfile}"/>

</div>

