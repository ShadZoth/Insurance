<%@ page import="insurance.Contact" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'contact.label', default: 'Contact')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-contact" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                              default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-contact" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="value" title="${message(code: 'contact.value.label', default: 'Value')}"/>

            <th><g:message code="contact.client.label" default="Client"/></th>

            <g:sortableColumn property="type" title="${message(code: 'contact.type.label', default: 'Type')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${contactInstanceList}" status="i" var="contactInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${contactInstance.id}">${fieldValue(bean: contactInstance, field: "value")}</g:link></td>

                <td>${fieldValue(bean: contactInstance, field: "client")}</td>

                <td>${fieldValue(bean: contactInstance, field: "type")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${contactInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>
