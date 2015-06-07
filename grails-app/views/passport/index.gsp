<%@ page import="insurance.Passport" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(code: 'passport.label', default: 'Passport')}"/>
    <title><g:message code="passport.list.title" default="Passports list"/></title>
</head>

<body>
<sec:ifAnyGranted
        roles="ROLE_ADMIN, ROLE_MANAGER, ROLE_DISPATCHER, ROLE_CALL_CENTER">
    <a href="#list-passport" class="skip" tabindex="-1"><g:message
            code="default.link.skip.label" default="Skip to content&hellip;"/></a>
    <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_DISPATCHER">
        <div class="nav" role="navigation">
            <ul>
                <li><g:link class="create" action="create"><g:message
                        code="passport.new.label" default="New passport"/></g:link></li>
            </ul>
        </div>
    </sec:ifAnyGranted>

    <div id="list-passport" class="content scaffold-list" role="main">
        <h1><g:message code="passport.list.label" default="Passports list"/></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>


        <div id="scrolls">
            <table>
                <thead>
                <tr>

                    <th><g:message code="passport.person.label" default="Person"/></th>

                    <g:sortableColumn property="number"
                                      title="${message(code: 'passport.number.label', default: 'Number')}"/>

                    <g:sortableColumn property="issueDate"
                                      title="${message(code: 'passport.issueDate.label', default: 'Issue Date')}"/>

                    <g:sortableColumn property="firstName"
                                      title="${message(code: 'passport.firstName.label', default: 'First Name')}"/>

                    <g:sortableColumn property="lastName"
                                      title="${message(code: 'passport.lastName.label', default: 'Last Name')}"/>

                    <g:sortableColumn property="birthDate"
                                      title="${message(code: 'passport.birthDate.label', default: 'Birth Date')}"/>

                </tr>
                </thead>
                <tbody>
                <g:each in="${passportInstanceList}" status="i" var="passportInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td><g:link action="show"
                                    id="${passportInstance.id}">${fieldValue(bean: passportInstance, field: "person")}</g:link></td>

                        <td>${fieldValue(bean: passportInstance, field: "number")}</td>

                        <td><g:formatDate format="yyyy-MM-dd" date="${passportInstance.issueDate}"/></td>

                        <td>${fieldValue(bean: passportInstance, field: "firstName")}</td>

                        <td>${fieldValue(bean: passportInstance, field: "lastName")}</td>

                        <td><g:formatDate format="yyyy-MM-dd" date="${passportInstance.birthDate}"/></td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="pagination">
            <g:paginate total="${passportInstanceCount ?: 0}"/>
        </div>
    </div>
</sec:ifAnyGranted>
</body>

</html>
