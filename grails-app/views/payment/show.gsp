<%@ page import="insurance.Payment" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(code: 'payment.label', default: 'Payment')}"/>
    <title><g:message code="payment.show.label" default="Payment"/></title>
</head>

<body>
<a href="#show-payment" class="skip" tabindex="-1"><g:message
        code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_SELLER">
    <div class="nav" role="navigation">
        <ul>
            code="default.home.label"/></a></li>
            <li><g:link class="list" action="index"><g:message
                    code="default.list.label"
                    args="[entityName]"/></g:link></li>
            <li><g:link class="create" action="create"><g:message
                    code="default.new.label" args="[entityName]"/></g:link></li>
        </ul>
    </div>
</sec:ifAnyGranted>

<div id="show-payment" class="content scaffold-show" role="main">
    <h1><g:message code="payment.show.label" default="Payment"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list payment">

        <g:if test="${paymentInstance?.warrant}">
            <li class="fieldcontain">
                <span id="warrant-label" class="property-label"><g:message
                        code="payment.warrant.label" default="Warrant"/></span>

                <span class="property-value"
                      aria-labelledby="warrant-label"><g:link
                        controller="warrant" action="show"
                        id="${paymentInstance?.warrant?.id}">${paymentInstance?.warrant?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${paymentInstance?.accident}">
            <li class="fieldcontain">
                <span id="accident-label" class="property-label"><g:message
                        code="payment.accident.label"
                        default="Accident"/></span>

                <span class="property-value"
                      aria-labelledby="accident-label"><g:link
                        controller="accident" action="show"
                        id="${paymentInstance?.accident?.id}">${paymentInstance?.accident?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${paymentInstance?.amount}">
            <li class="fieldcontain">
                <span id="amount-label" class="property-label"><g:message
                        code="payment.amount.label" default="Amount"/></span>

                <span class="property-value"
                      aria-labelledby="amount-label"><g:fieldValue
                        bean="${paymentInstance}" field="amount"/></span>

            </li>
        </g:if>

        <g:if test="${paymentInstance?.date}">
            <li class="fieldcontain">
                <span id="date-label" class="property-label"><g:message
                        code="payment.date.label" default="Date"/></span>

                <span class="property-value"
                      aria-labelledby="date-label"><g:formatDate
                        format="yyyy-MM-dd"
                        date="${paymentInstance?.date}"/></span>

            </li>
        </g:if>

    </ol>

    <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_SELLER">
        <g:form url="[resource: paymentInstance, action: 'delete']"
                method="DELETE">
            <fieldset class="buttons">
                <g:link class="edit" action="edit"
                        resource="${paymentInstance}"><g:message
                        code="default.button.edit.label"
                        default="Edit"/></g:link>
            </fieldset>
        </g:form>
    </sec:ifAnyGranted>

</div>
</body>
</html>
