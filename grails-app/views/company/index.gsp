i<%@ page import="insurance.Company" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'company.label', default: 'Company')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_MANAGER,ROLE_SELLER, ROLE_CALL_CENTER">
    <a href="#list-company" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                  default="Skip to content&hellip;"/></a>
    <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_SELLER">
        <div class="nav" role="navigation">
            <ul>
                <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                                      args="[entityName]"/></g:link></li>
            </ul>
        </div>
    </sec:ifAnyGranted>
    <div id="list-company" class="content scaffold-list" role="main">
        <h1><g:message code="default.list.label" args="[entityName]"/></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <table>
            <thead>
            <tr>

                <g:sortableColumn property="name"
                                  title="${message(code: 'company.name.label', default: 'Name')}"/>

                <g:sortableColumn property="inn"
                                  title="${message(code: 'company.inn.label', default: 'Inn')}"/>

                <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MANAGER">
                    <g:sortableColumn property="seller" title="${message(code: "company.seller.label", default: "Seller")}"/>
                </sec:ifAnyGranted>

                <g:sortableColumn property="registrationDate"
                                  title="${message(code: 'company.registrationDate.label', default: 'Registration Date')}"/>

                <g:sortableColumn property="archived"
                                  title="${message(code: 'company.archived.label', default: 'Archived')}"/>

            </tr>
            </thead>
            <tbody>
            <g:each in="${companyInstanceList}" status="i" var="companyInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                    <td><g:link action="show"
                                id="${companyInstance.id}">${fieldValue(bean: companyInstance, field: "name")}</g:link></td>

                    <td>${fieldValue(bean: companyInstance, field: "inn")}</td>

                <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MANAGER">
                    <td>${fieldValue(bean: companyInstance, field: "seller")}</td>
                </sec:ifAnyGranted>

                    <td><g:formatDate format="yyyy-MM-dd" date="${companyInstance.registrationDate}"/></td>


                    <td><g:formatBoolean boolean="${companyInstance.archived}"/></td>

                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="pagination">
            <g:paginate total="${companyInstanceCount ?: 0}"/>
        </div>
    </div>
</sec:ifAnyGranted>
</body>

</html>
