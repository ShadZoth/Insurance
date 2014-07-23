<%@ page import="insurance.Person; insurance.Client" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(code: 'client.label', default: 'Client')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>
<sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_MANAGER,ROLE_SELLER, ROLE_CALL_CENTER">

    <body>
    <a href="#list-client" class="skip" tabindex="-1"><g:message
            code="default.link.skip.label" default="Skip to content&hellip;"/></a>

    <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_SELLER">
        <div class="nav" role="navigation">
            <ul>
                %{--<li><a class="home" href="${createLink(uri: '/')}"><g:message
                        code="default.home.label"/></a></li>--}%

                <g:set var="personName" value="${message(code: 'person.label', default: 'Person')}"/>
                <g:set var="companyName" value="${message(code: 'company.label', default: 'Company')}"/>

                <li><g:link class="create" action="create" params="[cl: 'person']">
                    <g:message code="default.new.label" args="[personName]"/></g:link>
                </li>
                <li><g:link class="create" action="create" params="[cl: 'company']">
                    <g:message code="default.new.label" args="[companyName]"/></g:link>
                </li>
            </ul>
        </div>
    </sec:ifAnyGranted>

    <div id="list-client" class="content scaffold-list" role="main">
        <h1><g:message code="default.list.label" args="[entityName]"/></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        <div id="scrolls">
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
                <g:each in="${clientList}" status="i" var="clientInstance">
                    <g:if test="${clientInstance.getClass() != Client.class}">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                            <td><g:link action="show"
                                        id="${clientInstance.id}">${clientInstance}</g:link></td>

                            <td><g:formatDate format="yyyy-MM-dd" date="${clientInstance.registrationDate}"/></td>


                            <td><g:formatBoolean
                                    boolean="${clientInstance.archived}"/></td>

                            <td>${clientInstance.getClass().getCanonicalName()}</td>

                        </tr>
                    </g:if>

                </g:each>
                </tbody>
            </table>
        </div>

        <div class="pagination">
            <g:paginate total="${clientInstanceCount ?: 0}"/>
        </div>
    </div>
    </body>
</sec:ifAnyGranted>
</html>
