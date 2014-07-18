<%@ page import="insurance.Certificate" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'certificate.label', default: 'Certificate')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_MANAGER,ROLE_SELLER, ROLE_CALL_CENTER">

    <a href="#list-certificate" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                      default="Skip to content&hellip;"/></a>

    <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_SELLER">
        <div class="nav" role="navigation">
            <ul>
                <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                                      args="[entityName]"/></g:link></li>
            </ul>
        </div>                                                default="Skip to content&hellip;"/></a>
    </sec:ifAnyGranted>

    <div id="list-certificate" class="content scaffold-list" role="main">
        <h1><g:message code="default.list.label" args="[entityName]"/></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <table>
            <thead>
            <tr>

                <g:sortableColumn property="number"
                                  title="${message(code: 'certificate.number.label', default: 'Number')}"/>

                <th><g:message code="certificate.vehicle.label" default="Vehicle"/></th>

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

        <div class="pagination">
            <g:paginate total="${certificateInstanceCount ?: 0}"/>
        </div>
    </div>
</sec:ifAnyGranted>
</body>
</html>
