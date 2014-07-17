<%@ page import="insurance.Price" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(code: 'price.label', default: 'Price')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<sec:ifAnyGranted
        roles="ROLE_ADMIN, ROLE_MANAGER, ROLE_SELLER, ROLE_CALL_CENTER">
    <a href="#list-price" class="skip" tabindex="-1"><g:message
        code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><g:link class="create" action="create"><g:message
                code="default.new.label" args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-price" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <th><g:message code="price.product.label" default="Product"/></th>

            <g:sortableColumn property="since"
                              title="${message(code: 'price.since.label', default: 'Since')}"/>

            <g:sortableColumn property="value"
                              title="${message(code: 'price.value.label', default: 'Value')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${priceInstanceList}" status="i" var="priceInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${priceInstance.id}">${fieldValue(bean: priceInstance, field: "product")}</g:link></td>

                <td><g:formatDate date="${priceInstance.since}"/></td>

                <td>${fieldValue(bean: priceInstance, field: "value")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${priceInstanceCount ?: 0}"/>
    </div>
</div>
</sec:ifAnyGranted>
</body>

</html>
