<%@ page import="insurance.Manufacturer" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'manufacturer.label', default: 'Manufacturer')}"/>
    <title><g:message code="manufacturer.list.label"/></title>
</head>

<body>

<sec:ifAnyGranted roles="ROLE_ADMIN">
    <a href="#list-manufacturer" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                       default="Skip to content&hellip;"/></a>

    <div class="nav" role="navigation">
        <ul>
            <li><g:link class="create" action="create"><g:message code="manufacturer.create.label"/></g:link></li>
        </ul>
    </div>

    <div id="list-manufacturer" class="content scaffold-list" role="main">
        <h1><g:message code="manufacturer.list.label"/></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>


        <div id="scrolls">
            <table>
                <thead>
                <tr>

                    <g:sortableColumn property="name"
                                      title="${message(code: 'manufacturer.name.label', default: 'Name')}"/>

                </tr>
                </thead>
                <tbody>
                <g:each in="${manufacturerInstanceList}" status="i" var="manufacturerInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td><g:link action="show"
                                    id="${manufacturerInstance.id}">${fieldValue(bean: manufacturerInstance, field: "name")}</g:link></td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>


        <div class="pagination">
            <g:paginate total="${manufacturerInstanceCount ?: 0}"/>
        </div>
    </div>
</sec:ifAnyGranted>
</body>
</html>
