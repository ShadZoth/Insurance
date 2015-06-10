
<%@ page import="insurance.Passport" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'passport.label', default: 'Passport')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-passport" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-passport" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="number" title="${message(code: 'passport.number.label', default: 'Number')}" />
					
						<th><g:message code="passport.person.label" default="Person" /></th>
					
						<g:sortableColumn property="lastName" title="${message(code: 'passport.lastName.label', default: 'Last Name')}" />
					
						<g:sortableColumn property="firstName" title="${message(code: 'passport.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="fathName" title="${message(code: 'passport.fathName.label', default: 'Fath Name')}" />
					
						<g:sortableColumn property="birthDate" title="${message(code: 'passport.birthDate.label', default: 'Birth Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${passportInstanceList}" status="i" var="passportInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${passportInstance.id}">${fieldValue(bean: passportInstance, field: "number")}</g:link></td>
					
						<td>${fieldValue(bean: passportInstance, field: "driver")}</td>
					
						<td>${fieldValue(bean: passportInstance, field: "lastName")}</td>
					
						<td>${fieldValue(bean: passportInstance, field: "firstName")}</td>
					
						<td>${fieldValue(bean: passportInstance, field: "fathName")}</td>
					
						<td><g:formatDate date="${passportInstance.birthDate}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${passportInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
