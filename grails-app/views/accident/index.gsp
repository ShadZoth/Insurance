<%@ page import="insurance.Accident" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'accident.label', default: 'Accident')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_MANAGER,ROLE_SELLER, ROLE_CALL_CENTER">
    <a href="#list-accident" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                   default="Skip to content&hellip;"/></a>
    <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_CALL_CENTER">
        <div class="nav" role="navigation">
            <ul>
                <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                                      args="[entityName]"/></g:link></li>
            </ul>
        </div>
    </sec:ifAnyGranted>

    <div id="list-accident" class="content scaffold-list" role="main">
        <h1><g:message code="default.list.label" args="[entityName]"/></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <table>
            <thead>
            <tr>

                <th><g:message code="accident.vehicle.label" default="Vehicle"/></th>

                <g:sortableColumn property="dateTime"
                                  title="${message(code: 'accident.dateTime.label', default: 'Date Time')}"/>

                <g:sortableColumn property="damage"
                                  title="${message(code: 'accident.damage.label', default: 'Damage')}"/>

            </tr>
            </thead>
            <tbody>
            <g:each in="${accidentInstanceList}" status="i" var="accidentInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                    <td><g:link action="show"
                                id="${accidentInstance.id}">${fieldValue(bean: accidentInstance, field: "vehicle")}</g:link></td>

                    <td><g:formatDate format="yyyy-MM-dd"  date="${accidentInstance.dateTime}"/></td>

                    <td>${fieldValue(bean: accidentInstance, field: "damage")}</td>

                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="pagination">
            <g:paginate total="${accidentInstanceCount ?: 0}"/>
        </div>
    </div>
</sec:ifAnyGranted>
</body>
</html>
