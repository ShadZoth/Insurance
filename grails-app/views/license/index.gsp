<%@ page import="insurance.License" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'license.label', default: 'License')}"/>
    <title><g:message code="license.list.label"/></title>
</head>

<body>
<sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MANAGER, ROLE_SELLER">
    <a href="#list-license" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                  default="Skip to content&hellip;"/></a>
    <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_SELLER">
        <div class="nav" role="navigation">
            <ul>
                <li><g:link class="create" action="create"><g:message code="license.create.label"/></g:link></li>
            </ul>
        </div>
    </sec:ifAnyGranted>

    <div id="list-license" class="content scaffold-list" role="main">
        <h1><g:message code="license.list.label"/></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        <div id="scrolls">
            <table>
                <thead>
                <tr>

                    <g:sortableColumn property="number"
                                      title="${message(code: 'license.number.label', default: 'Number')}"/>

                    <th><g:message code="license.owner.label" default="Owner"/></th>

                    <g:sortableColumn property="issueDate"
                                      title="${message(code: 'license.issueDate.label', default: 'Issue Date')}"/>

                    <th><g:message code="license.categories.label"
                                   default="Categories"/></th>

                </tr>
                </thead>
                <tbody>
                <g:each in="${licenseInstanceList}" status="i" var="licenseInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td><g:link action="show"
                                    id="${licenseInstance.id}">${fieldValue(bean: licenseInstance, field: "number")}</g:link></td>

                        <td>${fieldValue(bean: licenseInstance, field: "owner")}</td>

                        <td><g:formatDate format="yyyy-MM-dd" date="${licenseInstance.issueDate}"/></td>

                        <td><g:message message="${licenseInstance.cats()}"/></td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="pagination">
            <g:paginate total="${licenseInstanceCount ?: 0}"/>
        </div>
    </div>
</sec:ifAnyGranted>
</body>
</html>
