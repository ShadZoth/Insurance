<%@ page import="insurance.Payment" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(code: 'payment.label', default: 'Payment')}"/>
    <title><g:message code="payment.edit.label"/></title>
</head>

<body>
<sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_DISPATCHER">
<a href="#edit-payment" class="skip" tabindex="-1"><g:message
        code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><g:link class="list" action="index"><g:message
                code="payment.list.label" default="Payments list"/></g:link></li>
        <li><g:link class="create" action="create"><g:message
                code="payment.new.label" default="New payment"/></g:link></li>
    </ul>
</div>

<div id="edit-payment" class="content scaffold-edit" role="main">
    <h1><g:message code="payment.edit.label"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${paymentInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${paymentInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form url="[resource: paymentInstance, action: 'update']" method="PUT">
        <g:hiddenField name="version" value="${paymentInstance?.version}"/>
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
