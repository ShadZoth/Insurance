
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
					
						<g:sortableColumn property="addressStart" title="${message(code: 'service.addressStart.label', default: 'Address Start')}" />
					
						<g:sortableColumn property="addressEnd" title="${message(code: 'service.addressEnd.label', default: 'Address End')}" />
					
						<th><g:message code="service.driver.label" default="Driver" /></th>
					
						<g:sortableColumn property="endTime" title="${message(code: 'service.endTime.label', default: 'End Time')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${serviceInstanceList}" status="i" var="serviceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${serviceInstance.id}">${fieldValue(bean: serviceInstance, field: "client")}</g:link></td>
					
						<td><g:formatDate date="${serviceInstance.expectedStartTime}" /></td>
					
						<td>${fieldValue(bean: serviceInstance, field: "addressStart")}</td>
					
						<td>${fieldValue(bean: serviceInstance, field: "addressEnd")}</td>
					
						<td>${fieldValue(bean: serviceInstance, field: "driver")}</td>
					
						<td><g:formatDate date="${serviceInstance.endTime}" /></td>
					
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
