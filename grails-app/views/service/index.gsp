
<%@ page import="insurance.Service" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'service.label', default: 'Service')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-service" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-service" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="service.client.label" default="Client" /></th>
					
						<g:sortableColumn property="expectedStartTime" title="${message(code: 'service.expectedStartTime.label', default: 'Expected Start Time')}" />

						<th><g:message code="service.driver.label" default="Driver" /></th>

						<th><g:message code="service.price.label" default="Price" /></th>

						<th><g:message code="service.action.label" default="Action" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${serviceInstanceList}" status="i" var="serviceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${serviceInstance.id}">${fieldValue(bean: serviceInstance, field: "client")}</g:link></td>

						<td><g:formatDate date="${serviceInstance.expectedStartTime}" /></td>

						<td>${fieldValue(bean: serviceInstance, field: "driver")}</td>

						<td>${fieldValue(bean: serviceInstance, field: "price")}</td>

						<g:if test="${!serviceInstance.driver}">
							<td><g:link class="edit" action="adddriver" id="${serviceInstance.id}"><g:message code="service.accept.label" /></g:link></td>
						</g:if>
						<g:elseif test="${!serviceInstance.realStartTime}">
							<td><g:link class="edit" action="start_service" id="${serviceInstance.id}"><g:message code="service.start.label" /></g:link></td>
						</g:elseif>
						<g:elseif test="${!serviceInstance.endTime}">
							<td><g:link class="edit" action="end_service" id="${serviceInstance.id}"><g:message code="service.end.label" /></g:link></td>
						</g:elseif>
						<g:else>
							<td><g:link class="show" action="show" id="${serviceInstance.id}"><g:message code="service.show.label" /></g:link></td>
						</g:else>

					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${serviceInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
