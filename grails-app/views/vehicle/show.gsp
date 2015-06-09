
<%@ page import="insurance.Vehicle" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vehicle.label', default: 'Vehicle')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-vehicle" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-vehicle" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list vehicle">
			
				<g:if test="${vehicleInstance?.model}">
				<li class="fieldcontain">
					<span id="model-label" class="property-label"><g:message code="vehicle.model.label" default="Model" /></span>
					
						<span class="property-value" aria-labelledby="model-label"><g:fieldValue bean="${vehicleInstance}" field="model"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vehicleInstance?.year}">
				<li class="fieldcontain">
					<span id="year-label" class="property-label"><g:message code="vehicle.year.label" default="Year" /></span>
					
						<span class="property-value" aria-labelledby="year-label"><g:fieldValue bean="${vehicleInstance}" field="year"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vehicleInstance?.manufacturer}">
				<li class="fieldcontain">
					<span id="manufacturer-label" class="property-label"><g:message code="vehicle.manufacturer.label" default="Manufacturer" /></span>
					
						<span class="property-value" aria-labelledby="manufacturer-label"><g:link controller="manufacturer" action="show" id="${vehicleInstance?.manufacturer?.id}">${vehicleInstance?.manufacturer?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>

				<g:if test="${vehicleInstance?.owner}">
					<li class="fieldcontain">
						<span id="owner-label" class="property-label"><g:message code="vehicle.owner.label" default="Owner" /></span>

						<span class="property-value" aria-labelledby="owner-label"><g:link controller="driver" action="show" id="${vehicleInstance?.owner?.id}">${vehicleInstance?.owner?.encodeAsHTML()}</g:link></span>

					</li>
				</g:if>

				<g:if test="${vehicleInstance?.certificates}">
				<li class="fieldcontain">
					<span id="certificates-label" class="property-label"><g:message code="vehicle.certificates.label" default="Certificates" /></span>
					
						<g:each in="${vehicleInstance.certificates}" var="c">
						<span class="property-value" aria-labelledby="certificates-label"><g:link controller="certificate" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${vehicleInstance?.children}">
				<li class="fieldcontain">
					<span id="children-label" class="property-label"><g:message code="vehicle.children.label" default="Children" /></span>
					
						<span class="property-value" aria-labelledby="children-label"><g:formatBoolean boolean="${vehicleInstance?.children}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${vehicleInstance?.conditioner}">
				<li class="fieldcontain">
					<span id="conditioner-label" class="property-label"><g:message code="vehicle.conditioner.label" default="Conditioner" /></span>
					
						<span class="property-value" aria-labelledby="conditioner-label"><g:formatBoolean boolean="${vehicleInstance?.conditioner}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${vehicleInstance?.disabled}">
				<li class="fieldcontain">
					<span id="disabled-label" class="property-label"><g:message code="vehicle.disabled.label" default="Disabled" /></span>
					
						<span class="property-value" aria-labelledby="disabled-label"><g:formatBoolean boolean="${vehicleInstance?.disabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${vehicleInstance?.hugeBack}">
				<li class="fieldcontain">
					<span id="hugeBack-label" class="property-label"><g:message code="vehicle.hugeBack.label" default="Huge Back" /></span>
					
						<span class="property-value" aria-labelledby="hugeBack-label"><g:formatBoolean boolean="${vehicleInstance?.hugeBack}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${vehicleInstance?.premium}">
				<li class="fieldcontain">
					<span id="premium-label" class="property-label"><g:message code="vehicle.premium.label" default="Premium" /></span>
					
						<span class="property-value" aria-labelledby="premium-label"><g:formatBoolean boolean="${vehicleInstance?.premium}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${vehicleInstance?.smoking}">
				<li class="fieldcontain">
					<span id="smoking-label" class="property-label"><g:message code="vehicle.smoking.label" default="Smoking" /></span>
					
						<span class="property-value" aria-labelledby="smoking-label"><g:formatBoolean boolean="${vehicleInstance?.smoking}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${vehicleInstance?.van}">
				<li class="fieldcontain">
					<span id="van-label" class="property-label"><g:message code="vehicle.van.label" default="Van" /></span>
					
						<span class="property-value" aria-labelledby="van-label"><g:formatBoolean boolean="${vehicleInstance?.van}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${vehicleInstance?.vip}">
				<li class="fieldcontain">
					<span id="vip-label" class="property-label"><g:message code="vehicle.vip.label" default="Vip" /></span>
					
						<span class="property-value" aria-labelledby="vip-label"><g:formatBoolean boolean="${vehicleInstance?.vip}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:vehicleInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${vehicleInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
