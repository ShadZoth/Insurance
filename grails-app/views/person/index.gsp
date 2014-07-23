<%@ page import="insurance.User; org.springframework.security.core.context.SecurityContextHolder; org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils; insurance.Person" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(code: 'person.label', default: 'Person')}"/>
    <title><g:message code="person.list.label" default="Persons list"/></title>
</head>

<body>
<sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MANAGER, ROLE_SELLER, ROLE_CALL_CENTER">
    <a href="#list-person" class="skip" tabindex="-1"><g:message
            code="default.link.skip.label" default="Skip to content&hellip;"/></a>

    <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_SELLER">
        <div class="nav" role="navigation">
            <ul>
                <li><g:link class="create" action="create"><g:message
                        code="person.new.label" default="New person"/></g:link></li>
            </ul>
        </div>
    </sec:ifAnyGranted>

    <div id="list-person" class="content scaffold-list" role="main">
        <h1><g:message code="person.list.label" default="Persons list"/></h1>
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

                <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MANAGER">
                    <g:sortableColumn property="seller" title="${message(code: "person.seller.label", default: "Seller")}"/>
                </sec:ifAnyGranted>

                <g:sortableColumn property="archived"
                                  title="${message(code: 'person.archived.label', default: 'Archived')}"/>

            </tr>
            </thead>
            <tbody>
            <g:each in="${personInstanceList}" status="i" var="personInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                    <td><g:link action="show"
                                id="${personInstance.id}">${personInstance}</g:link></td>

                    <td><g:formatDate format="yyyy-MM-dd" date="${personInstance.registrationDate}"/></td>

                <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MANAGER">
                    <td>${fieldValue(bean: personInstance, field: "seller")}</td>
                </sec:ifAnyGranted>

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
