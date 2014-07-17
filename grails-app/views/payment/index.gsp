<%@ page import="insurance.Payment" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(code: 'payment.label', default: 'Payment')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MANAGER, ROLE_SELLER, ROLE_CALL_SERVICE">
<a href="#list-payment" class="skip" tabindex="-1"><g:message
        code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><g:link class="create" action="create"><g:message
                code="default.new.label" args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-payment" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <th><g:message code="payment.warrant.label" default="Warrant"/></th>

            <th><g:message code="payment.accident.label"
                           default="Accident"/></th>

            <g:sortableColumn property="amount"
                              title="${message(code: 'payment.amount.label', default: 'Amount')}"/>

            <g:sortableColumn property="date"
                              title="${message(code: 'payment.date.label', default: 'Date')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${paymentInstanceList}" status="i" var="paymentInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${paymentInstance.id}">${fieldValue(bean: paymentInstance, field: "warrant")}</g:link></td>

                <td>${fieldValue(bean: paymentInstance, field: "accident")}</td>

                <td>${fieldValue(bean: paymentInstance, field: "amount")}</td>

                <td><g:formatDate date="${paymentInstance.date}"/></td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${paymentInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</sec:ifAnyGranted>
</html>
