<%@ page import="v.market.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="user.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${userInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'lastname', 'error')} required">
	<label for="lastname">
		<g:message code="user.lastname.label" default="Lastname" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastname" required="" value="${userInstance?.lastname}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'userName', 'error')} required">
	<label for="userName">
		<g:message code="user.userName.label" default="User Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="userName" required="" value="${userInstance?.userName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="password" name="password" required="" value="${userInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="user.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${userInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'gender', 'error')} required">
	<label for="gender">
		<g:message code="user.gender.label" default="Gender" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="gender" required="" value="${userInstance?.gender}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'age', 'error')} required">
	<label for="age">
		<g:message code="user.age.label" default="Age" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="age" type="number" value="${userInstance.age}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'birthday', 'error')} required">
	<label for="birthday">
		<g:message code="user.birthday.label" default="Birthday" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="birthday" precision="day"  value="${userInstance?.birthday}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'telefono', 'error')} required">
	<label for="telefono">
		<g:message code="user.telefono.label" default="Telefono" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="telefono" required="" value="${userInstance?.telefono}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'ciudad', 'error')} required">
	<label for="ciudad">
		<g:message code="user.ciudad.label" default="Ciudad" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="ciudad" required="" value="${userInstance?.ciudad}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'pais', 'error')} required">
	<label for="pais">
		<g:message code="user.pais.label" default="Pais" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="pais" required="" value="${userInstance?.pais}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'urlImageProfile', 'error')} required">
	<label for="urlImageProfile">
		<g:message code="user.urlImageProfile.label" default="Url Image Profile" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="urlImageProfile" required="" value="${userInstance?.urlImageProfile}"/>

</div>

