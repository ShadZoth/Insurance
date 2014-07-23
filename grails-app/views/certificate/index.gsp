<%@ page import="insurance.Certificate" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'certificate.label', default: 'Certificate')}"/>
    <title><g:message code="certificate.list.label"/></title>
</head>

<body>
<sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_MANAGER,ROLE_SELLER, ROLE_CALL_CENTER">

    <a href="#list-certificate" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                      default="Skip to content&hellip;"/></a>

    <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_SELLER">
        <div class="nav" role="navigation">
            <ul>
                <li><g:link class="create" action="create"><g:message code="certificate.new.label"/></g:link></li>
            </ul>
        </div>
    </sec:ifAnyGranted>

    <div id="list-certificate" class="content scaffold-list" role="main">
        <h1><g:message code="certificate.list.label"/></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        <div id="scrolls">
            <table>
                <thead>
                <tr>

                    <g:sortableColumn property="number"
                                      title="${message(code: 'certificate.number.label', default: 'Number')}"/>

                    <g:sortableColumn property="vehicle"
                                      title="${message(code: 'certificate.vehicle.label', default: 'Vehicle')}"/>

                    <g:sortableColumn property="color"
                                      title="${message(code: 'certificate.color.label', default: 'Color')}"/>

                    <g:sortableColumn property="issueDate"
                                      title="${message(code: 'certificate.issueDate.label', default: 'Issue Date')}"/>

                    <g:sortableColumn property="ownerFirstName"
                                      title="${message(code: 'certificate.ownerFirstName.label', default: 'Owner First Name')}"/>

                    <g:sortableColumn property="ownerLastName"
                                      title="${message(code: 'certificate.ownerLastName.label', default: 'Owner Last Name')}"/>

                </tr>
                </thead>
                <tbody>
                <g:each in="${certificateInstanceList}" status="i" var="certificateInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td><g:link action="show"
                                    id="${certificateInstance.id}">${fieldValue(bean: certificateInstance, field: "number")}</g:link></td>

                        <td>${fieldValue(bean: certificateInstance, field: "vehicle")}</td>

                        <td>${fieldValue(bean: certificateInstance, field: "color")}</td>

                        <td><g:formatDate format="yyyy-MM-dd" date="${certificateInstance.issueDate}"/></td>

                        <td>${fieldValue(bean: certificateInstance, field: "ownerFirstName")}</td>

                        <td>${fieldValue(bean: certificateInstance, field: "ownerLastName")}</td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="pagination">
            <g:paginate total="${certificateInstanceCount ?: 0}"/>
        </div>
    </div>
</sec:ifAnyGranted>
</body>
</html>
