<%@ page import="org.springframework.security.core.context.SecurityContextHolder; insurance.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="user.list.label" default="Users list"/></title>
</head>

<body>
<sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_MANAGER">
    <a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                               default="Skip to content&hellip;"/></a>

    <div class="nav" role="navigation">
        <ul>
            <li><g:link class="create" action="create"><g:message code="user.new.label"
                                                                  default="New user"/></g:link></li>
        </ul>
    </div>

    <div id="list-user" class="content scaffold-list" role="main">
        <h1><g:message code="user.list.label" default="Users list"/></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <div id="scrolls">
            <table>
                <thead>
                <tr>

                    <g:sortableColumn property="username"
                                      title="${message(code: 'user.username.label', default: 'Username')}"/>

                    <g:sortableColumn property="authority"
                                      title="${message(code: 'user.authority.label', default: 'Authority')}"/>

                    <g:sortableColumn property="accountExpired"
                                      title="${message(code: 'user.accountExpired.label', default: 'Account Expired')}"/>

                    <g:sortableColumn property="accountLocked"
                                      title="${message(code: 'user.accountLocked.label', default: 'Account Locked')}"/>

                    <g:sortableColumn property="enabled"
                                      title="${message(code: 'user.enabled.label', default: 'Enabled')}"/>

                    <g:sortableColumn property="manager"
                                      title="${message(code: 'user.manager.label', default: 'Manager')}"/>

                </tr>
                </thead>
                <tbody>
                <g:each in="${userInstanceList}" status="i" var="userInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td><g:link action="show"
                                    id="${userInstance.id}">${fieldValue(bean: userInstance, field: "username")}</g:link></td>

                        <td>${fieldValue(bean: userInstance, field: "authority")}</td>

                        <td><g:formatBoolean boolean="${userInstance.accountExpired}"/></td>

                        <td><g:formatBoolean boolean="${userInstance.accountLocked}"/></td>

                        <td><g:formatBoolean boolean="${userInstance.enabled}"/></td>

                        <td>${fieldValue(bean: userInstance, field: "manager")}</td>

                    </tr>
                </g:each>

                </tbody>
            </table>
        </div>

        <div class="pagination">
            <g:paginate total="${userInstanceCount ?: 0}"/>
        </div>
    </div>
</sec:ifAnyGranted>
</body>
</html>
