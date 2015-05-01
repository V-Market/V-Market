
<%@ page import="v.market.Usuario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-usuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-usuario" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'usuario.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="lastname" title="${message(code: 'usuario.lastname.label', default: 'Lastname')}" />
					
						<g:sortableColumn property="userName" title="${message(code: 'usuario.userName.label', default: 'User Name')}" />
					
						<g:sortableColumn property="password" title="${message(code: 'usuario.password.label', default: 'Password')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'usuario.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="gender" title="${message(code: 'usuario.gender.label', default: 'Gender')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${usuarioInstanceList}" status="i" var="usuarioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${usuarioInstance.id}">${fieldValue(bean: usuarioInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: usuarioInstance, field: "lastname")}</td>
					
						<td>${fieldValue(bean: usuarioInstance, field: "userName")}</td>
					
						<td>${fieldValue(bean: usuarioInstance, field: "password")}</td>
					
						<td>${fieldValue(bean: usuarioInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: usuarioInstance, field: "gender")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${usuarioInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
