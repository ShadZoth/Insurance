<%@ page import="insurance.Warrant" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'warrant.label', default: 'Warrant')}"/>
    <title><g:message code="warrant.list.label" default="Warrants list"/></title>
</head>

<body>

<sec:ifAnyGranted
        roles="ROLE_ADMIN, ROLE_MANAGER, ROLE_SELLER, ROLE_CALL_CENTER">
    <a href="#list-warrant" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                  default="Skip to content&hellip;"/></a>
    <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_SELLER">
        <div class="nav" role="navigation">
            <ul>
                <li><g:link class="create" action="create"><g:message code="warrant.new.label"
                                                                      default="New warrant"/></g:link></li>
            </ul>
        </div>
    </sec:ifAnyGranted>

    <div id="list-warrant" class="content scaffold-list" role="main">
        <h1><g:message code="warrant.list.label" default="Warrants list"/></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        <div id="scrolls">
            <table>
                <thead>
                <tr>

                    <g:sortableColumn property="number"
                                      title="${message(code: 'warrant.number.label', default: 'Number')}"/>

                    <th><g:message code="warrant.client.label" default="Client"/></th>

                    <th><g:message code="warrant.vehicle.label" default="Vehicle"/></th>

                    <th><g:message code="warrant.product.label" default="Product"/></th>

                    <g:sortableColumn property="issueDate"
                                      title="${message(code: 'warrant.issueDate.label', default: 'Issue Date')}"/>

                    <g:sortableColumn property="expireDate"
                                      title="${message(code: 'warrant.expireDate.label', default: 'Expire Date')}"/>

                </tr>
                </thead>
                <tbody>
                <g:each in="${warrantInstanceList}" status="i" var="warrantInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td><g:link action="show"
                                    id="${warrantInstance.id}">${fieldValue(bean: warrantInstance, field: "number")}</g:link></td>

                        <td>${fieldValue(bean: warrantInstance, field: "client")}</td>

                        <td>${fieldValue(bean: warrantInstance, field: "vehicle")}</td>

                        <td>${fieldValue(bean: warrantInstance, field: "product")}</td>

                        <td><g:formatDate date="${warrantInstance.issueDate}"/></td>

                        <td><g:formatDate date="${warrantInstance.expireDate}"/></td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="pagination">
            <g:paginate total="${warrantInstanceCount ?: 0}"/>
        </div>
    </div>


    <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MANAGER">
        <g:jasperReport jasper="contracts" format="PDF"/>
    </sec:ifAnyGranted>

</sec:ifAnyGranted>
</body>
</html>
