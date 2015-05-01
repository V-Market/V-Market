<%@ page import="v.market.Usuario" %>



<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="usuario.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${usuarioInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'lastname', 'error')} required">
	<label for="lastname">
		<g:message code="usuario.lastname.label" default="Lastname" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastname" required="" value="${usuarioInstance?.lastname}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'userName', 'error')} required">
	<label for="userName">
		<g:message code="usuario.userName.label" default="User Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="userName" required="" value="${usuarioInstance?.userName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="usuario.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="password" name="password" required="" value="${usuarioInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="usuario.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${usuarioInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'gender', 'error')} required">
	<label for="gender">
		<g:message code="usuario.gender.label" default="Gender" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="gender" required="" value="${usuarioInstance?.gender}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'age', 'error')} required">
	<label for="age">
		<g:message code="usuario.age.label" default="Age" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="age" type="number" value="${usuarioInstance.age}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'birthday', 'error')} required">
	<label for="birthday">
		<g:message code="usuario.birthday.label" default="Birthday" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="birthday" precision="day"  value="${usuarioInstance?.birthday}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'telefono', 'error')} required">
	<label for="telefono">
		<g:message code="usuario.telefono.label" default="Telefono" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="telefono" required="" value="${usuarioInstance?.telefono}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'ciudad', 'error')} required">
	<label for="ciudad">
		<g:message code="usuario.ciudad.label" default="Ciudad" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="ciudad" required="" value="${usuarioInstance?.ciudad}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'pais', 'error')} required">
	<label for="pais">
		<g:message code="usuario.pais.label" default="Pais" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="pais" required="" value="${usuarioInstance?.pais}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'urlImageProfile', 'error')} required">
	<label for="urlImageProfile">
		<g:message code="usuario.urlImageProfile.label" default="Url Image Profile" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="urlImageProfile" required="" value="${usuarioInstance?.urlImageProfile}"/>

</div>

