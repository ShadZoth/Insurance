
<%@ page import="insurance.Driver" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'driver.label', default: 'Driver')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-driver" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-driver" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list driver">
				<li class="fieldcontain">
					<span id="id-label" class="property-label"><g:message code="number" default="Number" /></span>
					<span class="property-value" aria-labelledby="vehicle-label">${driverInstance.id}</span>
				</li>

				<g:if test="${driverInstance?.vehicle}">
				<li class="fieldcontain">
					<span id="vehicle-label" class="property-label"><g:message code="driver.vehicle.label" default="Vehicle" /></span>
					
						<span class="property-value" aria-labelledby="vehicle-label"><g:link controller="vehicle" action="show" id="${driverInstance?.vehicle?.id}">${driverInstance?.vehicle?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${driverInstance?.passports}">
				<li class="fieldcontain">
					<span id="passports-label" class="property-label"><g:message code="driver.passports.label" default="Passports" /></span>
					
						<g:each in="${driverInstance.passports}" var="p">
						<span class="property-value" aria-labelledby="passports-label"><g:link controller="passport" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:driverInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${driverInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
