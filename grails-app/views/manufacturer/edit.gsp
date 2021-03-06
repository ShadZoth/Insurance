<%@ page import="insurance.Manufacturer" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'manufacturer.label', default: 'Manufacturer')}"/>
    <title><g:message code="manufacturer.edit.label"/></title>
</head>

<body>
<sec:ifAnyGranted roles="ROLE_ADMIN">
<a href="#edit-manufacturer" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                   default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        %{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
        <li><g:link class="list" action="index"><g:message code="manufacturer.create.label"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="manufacturer.create.label"/></g:link></li>
    </ul>
</div>

<div id="edit-manufacturer" class="content scaffold-edit" role="main">
    <h1><g:message code="manufacturer.edit.label"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${manufacturerInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${manufacturerInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form url="[resource: manufacturerInstance, action: 'update']" method="PUT">
        <g:hiddenField name="version" value="${manufacturerInstance?.version}"/>
        <fieldset class="form">
            <g:render template="form"/>
        </fieldset>
        <fieldset class="buttons">
            <g:actionSubmit class="save" action="update"
                            value="${message(code: 'default.button.update.label', default: 'Update')}"/>
        </fieldset>
    </g:form>
</div>
</sec:ifAnyGranted>
</body>
</html>
