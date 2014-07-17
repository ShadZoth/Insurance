<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(code: 'vehicle.label', default: 'Vehicle')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_SELLER">
<a href="#create-vehicle" class="skip" tabindex="-1"><g:message
        code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        %{--<li><a class="home" href="${createLink(uri: '/')}"><g:message
                code="default.home.label"/></a></li>--}%
        <li><g:link class="list" action="index"><g:message
                code="default.list.label" args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="create-vehicle" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${vehicleInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${vehicleInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form url="[resource: vehicleInstance, action: 'save']">
        <fieldset class="form">
            <g:render template="form"/>
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="save"
                            value="${message(code: 'default.button.create.label', default: 'Create')}"/>
        </fieldset>
    </g:form>
</div>
</sec:ifAnyGranted>
</body>
</html>
