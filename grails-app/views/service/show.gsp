
<%@ page import="insurance.Service" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'service.label', default: 'Service')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-service" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-service" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list service">
			
				<g:if test="${serviceInstance?.client}">
				<li class="fieldcontain">
					<span id="client-label" class="property-label"><g:message code="service.client.label" default="Client" /></span>
					
						<span class="property-value" aria-labelledby="client-label"><g:link controller="client" action="show" id="${serviceInstance?.client?.id}">${serviceInstance?.client?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceInstance?.expectedStartTime}">
				<li class="fieldcontain">
					<span id="expectedStartTime-label" class="property-label"><g:message code="service.expectedStartTime.label" default="Expected Start Time" /></span>
					
						<span class="property-value" aria-labelledby="expectedStartTime-label"><g:formatDate date="${serviceInstance?.expectedStartTime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceInstance?.addressStart}">
				<li class="fieldcontain">
					<span id="addressStart-label" class="property-label"><g:message code="service.addressStart.label" default="Address Start" /></span>
					
						<span class="property-value" aria-labelledby="addressStart-label"><g:fieldValue bean="${serviceInstance}" field="addressStart"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceInstance?.addressEnd}">
				<li class="fieldcontain">
					<span id="addressEnd-label" class="property-label"><g:message code="service.addressEnd.label" default="Address End" /></span>
					
						<span class="property-value" aria-labelledby="addressEnd-label"><g:fieldValue bean="${serviceInstance}" field="addressEnd"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceInstance?.driver}">
				<li class="fieldcontain">
					<span id="driver-label" class="property-label"><g:message code="service.driver.label" default="Driver" /></span>
					
						<span class="property-value" aria-labelledby="driver-label"><g:link controller="driver" action="show" id="${serviceInstance?.driver?.id}">${serviceInstance?.driver?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceInstance?.endTime}">
				<li class="fieldcontain">
					<span id="endTime-label" class="property-label"><g:message code="service.endTime.label" default="End Time" /></span>
					
						<span class="property-value" aria-labelledby="endTime-label"><g:formatDate date="${serviceInstance?.endTime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceInstance?.realStartTime}">
				<li class="fieldcontain">
					<span id="realStartTime-label" class="property-label"><g:message code="service.realStartTime.label" default="Real Start Time" /></span>
					
						<span class="property-value" aria-labelledby="realStartTime-label"><g:formatDate date="${serviceInstance?.realStartTime}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:serviceInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${serviceInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
