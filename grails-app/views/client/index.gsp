<%@ page import="insurance.Person; insurance.Client" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(code: 'client.label', default: 'Client')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-client" class="skip" tabindex="-1"><g:message
        code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message
                code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"
                    params="[cl: 'person']"><g:message
                    code="default.new.label"
                    args="${message(code: 'person.label', default: "Person")}"/></g:link></li>
        <li><g:link class="create" action="create"
                    params="[cl: 'company']"><g:message
                    code="default.new.label"
                    args="${message(code: 'company.label', default: "Company")}"/></g:link></li>
    </ul>
</div>

<div id="list-client" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>
            <th><g:message code="clients.iden.label"
                           default="Identification"/></th>

            <g:sortableColumn property="registrationDate"
                              title="${message(code: 'client.registrationDate.label', default: 'Registration Date')}"/>

            <g:sortableColumn property="archived"
                              title="${message(code: 'client.archived.label', default: 'Archived')}"/>

            <th><g:message code="clients.type.label" default="Type"/></th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${clientInstanceList}" status="i" var="clientInstance">
            <g:if test="${clientInstance.getClass() != Client.class}">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                    <td><g:link action="show"
                                id="${clientInstance.id}">${clientInstance}</g:link></td>

                    <td>${fieldValue(bean: clientInstance, field: "registrationDate")}</td>

                    <td><g:formatBoolean
                            boolean="${clientInstance.archived}"/></td>

                    <td>${clientInstance.getClass().getCanonicalName()}</td>

                </tr>
            </g:if>

        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${clientInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>
