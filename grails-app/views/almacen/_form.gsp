<%@ page import="v.market.Almacen" %>



<div class="fieldcontain ${hasErrors(bean: almacenInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="almacen.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${almacenInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: almacenInstance, field: 'urlImageProfile', 'error')} required">
	<label for="urlImageProfile">
		<g:message code="almacen.urlImageProfile.label" default="Url Image Profile" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="urlImageProfile" required="" value="${almacenInstance?.urlImageProfile}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: almacenInstance, field: 'streetAddress', 'error')} required">
	<label for="streetAddress">
		<g:message code="almacen.streetAddress.label" default="Street Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="streetAddress" required="" value="${almacenInstance?.streetAddress}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: almacenInstance, field: 'lng', 'error')} ">
	<label for="lng">
		<g:message code="almacen.lng.label" default="Lng" />
		
	</label>
	<g:textField name="lng" value="${almacenInstance?.lng}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: almacenInstance, field: 'lat', 'error')} ">
	<label for="lat">
		<g:message code="almacen.lat.label" default="Lat" />
		
	</label>
	<g:textField name="lat" value="${almacenInstance?.lat}"/>

</div>

