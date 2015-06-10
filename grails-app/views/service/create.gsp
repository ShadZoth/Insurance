<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'service.label', default: 'Service')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-service" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-service" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${serviceInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${serviceInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>


			<g:form url="[resource:serviceInstance, action:'save']" >
			<fieldset class="form">
                %{--<g:render template="form"/>--}%
				<div class="fieldcontain ${hasErrors(bean: serviceInstance, field: 'client', 'error')} required">
					<label for="client">
						<g:message code="service.client.label" default="Client" />
						<span class="required-indicator">*</span>
					</label>
					<g:select id="client" name="client.id" from="${insurance.Client.list()}" optionKey="id" required="" value="${serviceInstance?.client?.id}" class="many-to-one"/>

				</div>

				<div class="fieldcontain ${hasErrors(bean: serviceInstance, field: 'expectedStartTime', 'error')} required">
					<label for="expectedStartTime">
						<g:message code="service.expectedStartTime.label" default="Expected Start Time" />
						<span class="required-indicator">*</span>
					</label>
					<g:datePicker name="expectedStartTime" precision="minute"  value="${serviceInstance?.expectedStartTime}"  />

				</div>

				<div class="fieldcontain ${hasErrors(bean: serviceInstance, field: 'addressStart', 'error')} required">
					<label for="addressStart">
						<g:message code="service.addressStart.label" default="Address Start" />
						<span class="required-indicator">*</span>
					</label>
					<g:textField name="addressStart" required="" value="${serviceInstance?.addressStart}"/>

				</div>

				<div class="fieldcontain ${hasErrors(bean: serviceInstance, field: 'addressEnd', 'error')} required">
					<label for="addressEnd">
						<g:message code="service.addressEnd.label" default="Address End" />
						<span class="required-indicator">*</span>
					</label>
					<g:textField name="addressEnd" required="" value="${serviceInstance?.addressEnd}"/>

				</div>
            </fieldset>
            <fieldset class="buttons">
                <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
            </fieldset>
        </g:form>


		</div>
	</body>
</html>
