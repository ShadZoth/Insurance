<%@ page import="insurance.Product" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}"/>
    <title><g:message code="product.list.label" default="Products list"/></title>
</head>

<body>
<a href="#list-product" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                              default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><g:link class="create" action="create"><g:message code="product.new.label"
                                                              default="New product"/></g:link></li>
    </ul>
</div>

<div id="list-product" class="content scaffold-list" role="main">
    <h1><g:message code="product.list.label" default="Products list"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <div id="scrolls">
        <table>
            <thead>
            <tr>

                <g:sortableColumn property="name" title="${message(code: 'product.name.label', default: 'Name')}"/>

                <g:sortableColumn property="corporate"
                                  title="${message(code: 'product.corporate.label', default: 'Corporate')}"/>

                <g:sortableColumn property="individual"
                                  title="${message(code: 'product.individual.label', default: 'Individual')}"/>

                <g:sortableColumn property="value"
                                  title="${message(code: 'price.value.label', default: 'Value')}"/>

            </tr>
            </thead>
            <tbody>
            <g:each in="${productInstanceList}" status="i" var="productInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                    <td><g:link action="show"
                                id="${productInstance.id}">${fieldValue(bean: productInstance, field: "name")}</g:link></td>

                    <td><g:formatBoolean boolean="${productInstance.corporate}"/></td>

                    <td><g:formatBoolean boolean="${productInstance.individual}"/></td>

                    <td>${productInstance.currentPrice?.value}</td>

                </tr>
            </g:each>
            </tbody>
        </table>
    </div>

    <div class="pagination">
        <g:paginate total="${productInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>
