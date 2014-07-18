<%@ page import="insurance.Product" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(code: 'product.label', default: 'Product')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>
<sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MANAGER, ROLE_SELLER, ROLE_CALL_CENTER">
    <body>
    <a href="#list-product" class="skip" tabindex="-1"><g:message
            code="default.link.skip.label" default="Skip to content&hellip;"/></a>

    <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_MANAGER">
        <div class="nav" role="navigation">
            <ul>
                <li><g:link class="create" action="create"><g:message
                        code="default.new.label" args="[entityName]"/></g:link></li>
            </ul>
        </div>
    </sec:ifAnyGranted>

    <div id="list-product" class="content scaffold-list" role="main">
        <h1><g:message code="default.list.label" args="[entityName]"/></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <table>
            <thead>
            <tr>

                <g:sortableColumn property="name"
                                  title="${message(code: 'product.name.label', default: 'Name')}"/>

                <g:sortableColumn property="corporate"
                                  title="${message(code: 'product.corporate.label', default: 'Corporate')}"/>

                <g:sortableColumn property="individual"
                                  title="${message(code: 'product.individual.label', default: 'Individual')}"/>

            </tr>
            </thead>
            <tbody>
            <g:each in="${productInstanceList}" status="i" var="productInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                    <td><g:link action="show"
                                id="${productInstance.id}">${fieldValue(bean: productInstance, field: "name")}</g:link></td>

                    <td><g:formatBoolean
                            boolean="${productInstance.corporate}"/></td>

                    <td><g:formatBoolean
                            boolean="${productInstance.individual}"/></td>

                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="pagination">
            <g:paginate total="${productInstanceCount ?: 0}"/>
        </div>
    </div>
    </body>
</sec:ifAnyGranted>
</html>
