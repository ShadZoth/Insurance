<%@ page import="insurance.Product" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(code: 'product.label', default: 'Product')}"/>
    <title><g:message code="product.edit.label" default="Edit product"/></title>
</head>

<body>
<sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MANAGER">
<a href="#edit-product" class="skip" tabindex="-1"><g:message
        code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><g:link class="list" action="index"><g:message
                code="product.list.label" default="Products list"/></g:link></li>

    <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MANAGER">
    <li><g:link class="create" action="create"><g:message
                code="product.new.label" default="New product"/></g:link></li>
    </sec:ifAnyGranted>

</ul>
</div>

<div id="edit-product" class="content scaffold-edit" role="main">
    <h1><g:message code="product.edit.label" default="Edit product"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${productInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${productInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form url="[resource: productInstance, action: 'update']" method="PUT">
        <g:hiddenField name="version" value="${productInstance?.version}"/>
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
