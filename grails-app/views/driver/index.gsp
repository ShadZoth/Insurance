
<%@ page import="insurance.Driver" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'driver.label', default: 'Driver')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-driver" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-driver" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
						<th><g:message code="number" default="Number" /></th>
						<th><g:message code="passport.label" default="Current passport" /></th>
						<th><g:message code="driver.vehicle.label" default="Vehicle" /></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${driverInstanceList}" status="i" var="driverInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${driverInstance.id}">${fieldValue(bean: driverInstance, field: "id")}</g:link></td>
						<td><g:link action="show" id="${driverInstance.id}">${

							((Driver)driverInstance).getSortedPassports()[0]
						}</g:link></td>
						<td><g:link action="show" id="${driverInstance.id}">${fieldValue(bean: driverInstance, field: "vehicle")}</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${driverInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
