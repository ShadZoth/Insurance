<%@ page import="insurance.Product; insurance.Price" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(code: 'product.label', default: 'Product')}"/>
    <title><g:message code="product.show.label" default="Product"/></title>
</head>

<body>
<a href="#show-product" class="skip" tabindex="-1"><g:message
        code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_MANAGER">
    <div class="nav" role="navigation">
        <ul>
            <li><g:link class="list" action="index"><g:message
                    code="product.list.label" default="Products list"/></g:link></li>
            <li><g:link class="create" action="create"><g:message
                    code="product.new.label" default="New product"/></g:link></li>
        </ul>
    </div>
</sec:ifAnyGranted>

<div id="show-product" class="content scaffold-show" role="main">
    <h1><g:message code="product.show.label" default="Product"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list product">

    %{--Название продукта--}%
        <g:if test="${productInstance?.name}">
            <li class="fieldcontain">
                <span id="name-label" class="property-label"><g:message
                        code="product.name.label" default="Name"/></span>

                <span class="property-value"
                      aria-labelledby="name-label"><g:fieldValue
                        bean="${productInstance}" field="name"/></span>
            </li>
        </g:if>

    %{--TODO: исправить верстку.--}%
    %{--Corporate/Individual--}%

            <g:if test="${productInstance?.individual}">
                <li class="fieldcontain">
                <span id="individual-label" class="property-label">
                    <g:message
                            code="product.individual.label"
                            default="Individual"/></span>
                </li>
            </g:if>
            <g:if test="${productInstance?.corporate}">
                <li class="fieldcontain">
                        <span id="corporate-label" class="property-label">
                    <g:message
                            code="product.corporate.label"
                            default="Corporate"/></span>
                </li>
            </g:if>


    %{--Список цен--}%
        <g:if test="${productInstance?.sortedPricelist}">
            <li class="fieldcontain">
                <span id="pricelist-label" class="property-label"><g:message
                        code="product.pricelist.label"
                        default="Pricelist"/></span>

                <g:each in="${productInstance.sortedPricelist}" var="p">
                    <span class="property-value"
                          aria-labelledby="pricelist-label"><g:link
                            controller="price" action="show"
                            id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>
        <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MANAGER">
            <li class="fieldcontain">
                <g:link class="create" controller="price" action="create"
                        params="[product_id: productInstance.id]"><g:message
                        code="price.add.label" default="Add price"/></g:link>
            </li>
        </sec:ifAnyGranted>

    </ol>

    <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MANAGER">
        <g:form url="[resource: productInstance, action: 'delete']" method="DELETE">
            <fieldset class="buttons">
                <g:link class="edit" action="edit"
                        resource="${productInstance}"><g:message
                        code="default.button.edit.label" default="Edit"/></g:link>
            </fieldset>
        </g:form>
    </sec:ifAnyGranted>

</div>
</body>
</html>
