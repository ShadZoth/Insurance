<%@ page import="insurance.Vehicle" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(code: 'vehicle.label', default: 'Vehicle')}"/>
    <title><g:message code="vehicle.list.title" default="Vehicles list"/></title>
</head>
<sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MANAGER, ROLE_SELLER, ROLE_CALL_CENTER">
    <body>
    <a href="#list-vehicle" class="skip" tabindex="-1"><g:message
            code="default.link.skip.label" default="Skip to content&hellip;"/></a>

    <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_SELLER">
        <div class="nav" role="navigation">
            <ul>
                <li><g:link class="create" action="create"><g:message
                        code="vehicle.new.label" default="New Vehicle"/></g:link></li>
            </ul>
        </div>
    </sec:ifAnyGranted>

    <div id="list-vehicle" class="content scaffold-list" role="main">
        <h1><g:message code="vehicle.list.label" default="Vehicles list"/></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        <div id="scrolls">
            <table>
                <thead>
                <tr>

                    <th><g:message code="vehicle.owner.label" default="Owner"/></th>

                    <g:sortableColumn property="model"
                                      title="${message(code: 'vehicle.model.label', default: 'Model')}"/>

                    <g:sortableColumn property="year"
                                      title="${message(code: 'vehicle.year.label', default: 'Year')}"/>

                    <g:sortableColumn property="price"
                                      title="${message(code: 'vehicle.price.label', default: 'Price')}"/>

                    <g:sortableColumn property="category"
                                      title="${message(code: 'vehicle.category.label', default: 'Category')}"/>

                    <th><g:message code="vehicle.manufacturer.label"
                                   default="Manufacturer"/></th>

                </tr>
                </thead>
                <tbody>
                <g:each in="${vehicleInstanceList}" status="i" var="vehicleInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td><g:link action="show"
                                    id="${vehicleInstance.id}">${fieldValue(bean: vehicleInstance, field: "owner")}</g:link></td>

                        <td>${fieldValue(bean: vehicleInstance, field: "model")}</td>

                        <td>${fieldValue(bean: vehicleInstance, field: "year")}</td>

                        <td>${fieldValue(bean: vehicleInstance, field: "price")}</td>

                        <td>${fieldValue(bean: vehicleInstance, field: "category")}</td>

                        <td>${fieldValue(bean: vehicleInstance, field: "manufacturer")}</td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="pagination">
            <g:paginate total="${vehicleInstanceCount ?: 0}"/>
        </div>
    </div>
    </body>
</sec:ifAnyGranted>
</html>
