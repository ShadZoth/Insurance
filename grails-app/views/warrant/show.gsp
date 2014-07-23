<%@ page import="insurance.Warrant" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(code: 'warrant.label', default: 'Warrant')}"/>
    <title><g:message code="warrant.show.label" default="Warrant"/></title>
</head>

<body>
<a href="#show-warrant" class="skip" tabindex="-1"><g:message
        code="default.link.skip.label"
        default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><g:link class="list" action="index"><g:message
                code="warrant.list.label"
                default="Warrants list"/></g:link></li>
        <li><g:link class="create" action="create"><g:message
                code="warrant.new.label"
                default="New warrant"/></g:link></li>
    </ul>
</div>

<div id="show-warrant" class="content scaffold-show" role="main">
    <h1><g:message code="warrant.show.label" default="Warrant"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list warrant">

        <g:if test="${warrantInstance?.number}">
            <li class="fieldcontain">
                <span id="number-label" class="property-label"><g:message
                        code="warrant.number.label"
                        default="Number"/></span>

                <span class="property-value"
                      aria-labelledby="number-label"><g:fieldValue
                        bean="${warrantInstance}"
                        field="number"/></span>

            </li>
        </g:if>

        <g:if test="${warrantInstance?.client}">
            <li class="fieldcontain">
                <span id="client-label" class="property-label"><g:message
                        code="warrant.client.label"
                        default="Client"/></span>

                <span class="property-value"
                      aria-labelledby="client-label"><g:link controller="client"
                                                             action="show"
                                                             id="${warrantInstance?.client?.id}">${warrantInstance?.client?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${warrantInstance?.product}">
            <li class="fieldcontain">
                <span id="product-label" class="property-label"><g:message
                        code="warrant.product.label"
                        default="Product"/></span>

                <span class="property-value"
                      aria-labelledby="product-label"><g:link
                        controller="product" action="show"
                        id="${warrantInstance?.product?.id}">${warrantInstance?.product?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>


        <g:if test="${warrantInstance?.vehicle}">
            <li class="fieldcontain">
                %{--TODO: разобраться в проблеме--}%
                <span id="vehicle-label" class="property-label"><g:message
                        code="warrant.vehicle.label"
                        default="Vehicle"/></span>

                <span class="property-value"
                      aria-labelledby="vehicle-label"><g:link
                        controller="vehicle" action="show"
                        id="${warrantInstance?.vehicle?.id}">${warrantInstance?.vehicle?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${warrantInstance?.issueDate}">
            <li class="fieldcontain">
                <span id="issueDate-label" class="property-label"><g:message
                        code="warrant.issueDate.label"
                        default="Issue Date"/></span>

                <span class="property-value"
                      aria-labelledby="issueDate-label"><g:formatDate
                        format="yyyy-MM-dd"
                        date="${warrantInstance.issueDate}"/></span>

            </li>
        </g:if>

        <g:if test="${warrantInstance?.expireDate}">
            <li class="fieldcontain">
                <span id="expireDate-label" class="property-label"><g:message
                        code="warrant.expireDate.label"
                        default="Expire Date"/></span>

                <span class="property-value"
                      aria-labelledby="expireDate-label"><g:formatDate
                        format="yyyy-MM-dd"
                        date="${warrantInstance.expireDate}"/></span>

            </li>
        </g:if>

        <g:if test="${warrantInstance?.price}">
            <li class="fieldcontain">
                <span id="price-label" class="property-label"><g:message
                        code="warrant.price.label"
                        default="Price"/></span>

                <span class="property-value"
                      aria-labelledby="price-label"><g:fieldValue
                        bean="${warrantInstance}"
                        field="price"/></span>

            </li>
        </g:if>

        <g:if test="${warrantInstance?.payments}">
            <li class="fieldcontain">
                <span id="payments-label" class="property-label"><g:message
                        code="warrant.payments.label"
                        default="Payments"/></span>

                <g:each in="${warrantInstance.payments}" var="p">
                    <span class="property-value"
                          aria-labelledby="payments-label"><g:link
                            controller="payment"
                            action="show"
                            id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>
        <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_SELLER">
            <li class="fieldcontain">
                <g:link class="create" controller="payment" action="create"
                        params="[warrant_id: warrantInstance.id]"><g:message
                        code="payment.add.label"
                        default="Add payment"/></g:link>
            </li>
        </sec:ifAnyGranted>

    </ol>
    <g:form url="[resource: warrantInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit"
                    resource="${warrantInstance}"><g:message
                    code="default.button.edit.label"
                    default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
