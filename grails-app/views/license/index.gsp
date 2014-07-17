<%@ page import="insurance.License" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'license.label', default: 'License')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MANAGER, ROLE_SELLER">
<a href="#list-license" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                              default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-license" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="number" title="${message(code: 'license.number.label', default: 'Number')}"/>

            <th><g:message code="license.owner.label" default="Owner"/></th>

            <g:sortableColumn property="issueDate"
                              title="${message(code: 'license.issueDate.label', default: 'Issue Date')}"/>

            <g:sortableColumn property="a" title="${message(code: 'license.a.label', default: 'A')}"/>

            <g:sortableColumn property="b" title="${message(code: 'license.b.label', default: 'B')}"/>

            <g:sortableColumn property="c" title="${message(code: 'license.c.label', default: 'C')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${licenseInstanceList}" status="i" var="licenseInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${licenseInstance.id}">${fieldValue(bean: licenseInstance, field: "number")}</g:link></td>

                <td>${fieldValue(bean: licenseInstance, field: "owner")}</td>

                <td><g:formatDate date="${licenseInstance.issueDate}"/></td>

                <td><g:formatBoolean boolean="${licenseInstance.a}"/></td>

                <td><g:formatBoolean boolean="${licenseInstance.b}"/></td>

                <td><g:formatBoolean boolean="${licenseInstance.c}"/></td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${licenseInstanceCount ?: 0}"/>
    </div>
</div>
</sec:ifAnyGranted>
</body>
</html>
