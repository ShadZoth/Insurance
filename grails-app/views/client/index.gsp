
<%@ page import="insurance.Client" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-client" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-client" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="firstName" title="${message(code: 'client.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="lastName" title="${message(code: 'client.lastName.label', default: 'Last Name')}" />
					
						<g:sortableColumn property="registrationDate" title="${message(code: 'client.registrationDate.label', default: 'Registration Date')}" />
					
						<g:sortableColumn property="archived" title="${message(code: 'client.archived.label', default: 'Archived')}" />
					
						<th><g:message code="client.dispatcher.label" default="Dispatcher" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${clientInstanceList}" status="i" var="clientInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${clientInstance.id}">${fieldValue(bean: clientInstance, field: "firstName")}</g:link></td>
					
						<td>${fieldValue(bean: clientInstance, field: "lastName")}</td>
					
						<td><g:formatDate date="${clientInstance.registrationDate}" /></td>
					
						<td><g:formatBoolean boolean="${clientInstance.archived}" /></td>
					
						<td>${fieldValue(bean: clientInstance, field: "dispatcher")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${clientInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
