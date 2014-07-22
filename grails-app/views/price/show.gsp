<%@ page import="insurance.Price" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(code: 'price.label', default: 'Price')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-price" class="skip" tabindex="-1"><g:message
        code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_MANAGER">
    <div class="nav" role="navigation">
        <ul>
            %{--<li><a class="home" href="${createLink(uri: '/')}"><g:message--}%
            %{--code="default.home.label"/></a></li>--}%
            <li><g:link class="list" action="index"><g:message
                    code="default.list.label" args="[entityName]"/></g:link></li>
            <li><g:link class="create" action="create"><g:message
                    code="default.new.label" args="[entityName]"/></g:link></li>
        </ul>
    </div>
</sec:ifAnyGranted>

<div id="show-price" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list price">

        <g:if test="${priceInstance?.product}">
            <li class="fieldcontain">
                <span id="product-label" class="property-label"><g:message
                        code="price.product.label" default="Product"/></span>

                <span class="property-value"
                      aria-labelledby="product-label"><g:link
                        controller="product" action="show"
                        id="${priceInstance?.product?.id}">${priceInstance?.product?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${priceInstance?.since}">
            <li class="fieldcontain">
                <span id="since-label" class="property-label"><g:message
                        code="price.since.label" default="Since"/></span>

                <span class="property-value"
                      aria-labelledby="since-label"><g:formatDate format="yyyy-MM-dd"
                        date="${priceInstance?.since}"/></span>

            </li>
        </g:if>

        <g:if test="${priceInstance?.value}">
            <li class="fieldcontain">
                <span id="value-label" class="property-label"><g:message
                        code="price.value.label" default="Value"/></span>

                <span class="property-value"
                      aria-labelledby="value-label">
                    <g:fieldValue
                        bean="${priceInstance}" field="value"/>
                </span>

            </li>
        </g:if>

    </ol>

    <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_MANAGER">
        <g:form url="[resource: priceInstance, action: 'delete']" method="DELETE">
            <fieldset class="buttons">
                <g:link class="edit" action="edit"
                        resource="${priceInstance}"><g:message
                        code="default.button.edit.label" default="Edit"/></g:link>
                <g:actionSubmit class="delete" action="delete"
                                value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
            </fieldset>
        </g:form>
    </sec:ifAnyGranted>

</div>
</body>
</html>
