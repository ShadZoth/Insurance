<%@ page import="insurance.Person" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(code: 'person.label', default: 'Person')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>
<body>
<sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MANAGER, ROLE_SELLER, ROLE_CALL_SERVICE">
<a href="#list-person" class="skip" tabindex="-1"><g:message
        code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><g:link class="create" action="create"><g:message
                code="default.new.label" args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-person" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>
            <th><g:message code="person.name.label"
                           default="Name"/></th>

            <g:sortableColumn property="registrationDate"
                              title="${message(code: 'person.registrationDate.label', default: 'Registration Date')}"/>

            <g:sortableColumn property="archived"
                              title="${message(code: 'person.archived.label', default: 'Archived')}"/>

        </tr>
        </thead>
        <tbody>
        %{----}%
        <g:each in="${personInstanceList}" status="i" var="personInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${personInstance.id}">${personInstance}</g:link></td>

                <td>${fieldValue(bean: personInstance, field: "registrationDate")}</td>

                <td><g:formatBoolean boolean="${personInstance.archived}"/></td>

            </tr>
        </g:each>
        </tbody>
    </table>
%{--TODO: уточнить значение, предположительно -- ограничение--}%
    <div class="pagination">
        <g:paginate total="${personInstanceCount ?: 0}"/>
    </div>

</div>
</sec:ifAnyGranted>
</body>
</html>
