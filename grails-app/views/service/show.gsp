
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
			
				<g:if test="${serviceInstance?.driver}">
				<li class="fieldcontain">
					<span id="driver-label" class="property-label"><g:message code="service.driver.label" default="Driver" /></span>
					
						<span class="property-value" aria-labelledby="driver-label"><g:link controller="driver" action="show" id="${serviceInstance?.driver?.id}">${serviceInstance?.driver?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceInstance?.otherCompany}">
				<li class="fieldcontain">
					<span id="otherCompany-label" class="property-label"><g:message code="service.otherCompany.label" default="Other Company" /></span>
					
						<span class="property-value" aria-labelledby="otherCompany-label"><g:link controller="company" action="show" id="${serviceInstance?.otherCompany?.id}">${serviceInstance?.otherCompany?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceInstance?.realStartTime}">
				<li class="fieldcontain">
					<span id="realStartTime-label" class="property-label"><g:message code="service.realStartTime.label" default="Real Start Time" /></span>
					
						<span class="property-value" aria-labelledby="realStartTime-label"><g:formatDate date="${serviceInstance?.realStartTime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceInstance?.endTime}">
				<li class="fieldcontain">
					<span id="endTime-label" class="property-label"><g:message code="service.endTime.label" default="End Time" /></span>
					
						<span class="property-value" aria-labelledby="endTime-label"><g:formatDate date="${serviceInstance?.endTime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceInstance?.addressEnd}">
				<li class="fieldcontain">
					<span id="addressEnd-label" class="property-label"><g:message code="service.addressEnd.label" default="Address End" /></span>
					
						<span class="property-value" aria-labelledby="addressEnd-label"><g:fieldValue bean="${serviceInstance}" field="addressEnd"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceInstance?.children}">
				<li class="fieldcontain">
					<span id="children-label" class="property-label"><g:message code="service.children.label" default="Children" /></span>
					
						<span class="property-value" aria-labelledby="children-label"><g:formatBoolean boolean="${serviceInstance?.children}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceInstance?.conditioner}">
				<li class="fieldcontain">
					<span id="conditioner-label" class="property-label"><g:message code="service.conditioner.label" default="Conditioner" /></span>
					
						<span class="property-value" aria-labelledby="conditioner-label"><g:formatBoolean boolean="${serviceInstance?.conditioner}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceInstance?.disabled}">
				<li class="fieldcontain">
					<span id="disabled-label" class="property-label"><g:message code="service.disabled.label" default="Disabled" /></span>
					
						<span class="property-value" aria-labelledby="disabled-label"><g:formatBoolean boolean="${serviceInstance?.disabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceInstance?.hugeBack}">
				<li class="fieldcontain">
					<span id="hugeBack-label" class="property-label"><g:message code="service.hugeBack.label" default="Huge Back" /></span>
					
						<span class="property-value" aria-labelledby="hugeBack-label"><g:formatBoolean boolean="${serviceInstance?.hugeBack}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceInstance?.premium}">
				<li class="fieldcontain">
					<span id="premium-label" class="property-label"><g:message code="service.premium.label" default="Premium" /></span>
					
						<span class="property-value" aria-labelledby="premium-label"><g:formatBoolean boolean="${serviceInstance?.premium}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceInstance?.smoking}">
				<li class="fieldcontain">
					<span id="smoking-label" class="property-label"><g:message code="service.smoking.label" default="Smoking" /></span>
					
						<span class="property-value" aria-labelledby="smoking-label"><g:formatBoolean boolean="${serviceInstance?.smoking}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceInstance?.van}">
				<li class="fieldcontain">
					<span id="van-label" class="property-label"><g:message code="service.van.label" default="Van" /></span>
					
						<span class="property-value" aria-labelledby="van-label"><g:formatBoolean boolean="${serviceInstance?.van}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceInstance?.vip}">
				<li class="fieldcontain">
					<span id="vip-label" class="property-label"><g:message code="service.vip.label" default="Vip" /></span>
					
						<span class="property-value" aria-labelledby="vip-label"><g:formatBoolean boolean="${serviceInstance?.vip}" /></span>
					
				</li>
				</g:if>

				<g:if test="${serviceInstance?.price}">
					<li class="fieldcontain">
						<span id="price-label" class="property-label"><g:message code="service.price.label" default="Price" /></span>

						<span class="property-value" aria-labelledby="addressEnd-label"><g:fieldValue bean="${serviceInstance}" field="price"/></span>

					</li>
				</g:if>

				<g:if test="${serviceInstance?.duration}">
					<li class="fieldcontain">
						<span id="duration-label" class="property-label"><g:message code="service.duration.label" default="Duration (min)" /></span>

						<span class="property-value" aria-labelledby="addressEnd-label"><g:fieldValue bean="${serviceInstance}" field="duration"/></span>

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
