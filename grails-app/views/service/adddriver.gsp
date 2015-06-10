<%@ page import="org.springframework.validation.FieldError; insurance.Service" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'service.label', default: 'Service')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-service" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="edit-service" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${serviceInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${serviceInstance}" var="error">
				<li <g:if test="${error in FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:serviceInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${serviceInstance?.version}" />
				<fieldset class="form">
					<div class="fieldcontain ${hasErrors(bean: serviceInstance, field: 'driver', 'error')} required">
						<label for="driver">
							<g:message code="service.driver.label" default="Driver" />
							<span class="required-indicator">*</span>
						</label>
						<g:select id="driver" name="driver.id" from="${serviceInstance.getAvailableDrivers()}" optionKey="id" required="" value="${serviceInstance?.driver?.id}" class="many-to-one"/>

					</div>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>