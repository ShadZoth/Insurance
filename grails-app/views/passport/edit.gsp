<%@ page import="insurance.Passport" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(code: 'passport.label', default: 'Passport')}"/>
    <title><g:message code="passport.edit.label" default="Edit passport"/></title>
</head>

<body>
<sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_DISPATCHER">
    <a href="#edit-passport" class="skip" tabindex="-1"><g:message
        code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><g:link class="list" action="index"><g:message
                code="passport.list.label" default="Passports list"/></g:link></li>
        <li><g:link class="create" action="create"><g:message
                code="passport.new.label" default="New passport"/></g:link></li>
    </ul>
</div>

<div id="edit-passport" class="content scaffold-edit" role="main">
    <h1><g:message code="passport.edit.label" default="Edit passport"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${passportInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${passportInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form url="[resource: passportInstance, action: 'update']" method="PUT">
        <g:hiddenField name="version" value="${passportInstance?.version}"/>
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
