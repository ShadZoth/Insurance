<%@ page import="insurance.Vehicle" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(code: 'vehicle.label', default: 'Vehicle')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-vehicle" class="skip" tabindex="-1"><g:message
        code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_SELLER">
    <div class="nav" role="navigation">
        <ul>
            %{--<li><a class="home" href="${createLink(uri: '/')}"><g:message
                    code="default.home.label"/></a></li>--}%
            <li><g:link class="list" action="index"><g:message
                    code="default.list.label" args="[entityName]"/></g:link></li>
            <li><g:link class="create" action="create"><g:message
                    code="default.new.label" args="[entityName]"/></g:link></li>
        </ul>
    </div>
</sec:ifAnyGranted>

<div id="show-vehicle" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list vehicle">

        <g:if test="${vehicleInstance?.owner}">
            <li class="fieldcontain">
                <span id="owner-label" class="property-label"><g:message
                        code="vehicle.owner.label" default="Owner"/></span>

                <span class="property-value"
                      aria-labelledby="owner-label"><g:link controller="client"
                                                            action="show"
                                                            id="${vehicleInstance?.owner?.id}">${vehicleInstance?.owner?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${vehicleInstance?.model}">
            <li class="fieldcontain">
                <span id="model-label" class="property-label"><g:message
                        code="vehicle.model.label" default="Model"/></span>

                <span class="property-value"
                      aria-labelledby="model-label"><g:fieldValue
                        bean="${vehicleInstance}" field="model"/></span>

            </li>
        </g:if>

        <g:if test="${vehicleInstance?.year}">
            <li class="fieldcontain">
                <span id="year-label" class="property-label"><g:message
                        code="vehicle.year.label" default="Year"/></span>

                <span class="property-value"
                      aria-labelledby="year-label"><g:fieldValue
                        bean="${vehicleInstance}" field="year"/></span>

            </li>
        </g:if>

        <g:if test="${vehicleInstance?.price}">
            <li class="fieldcontain">
                <span id="price-label" class="property-label"><g:message
                        code="vehicle.price.label" default="Price"/></span>

                <span class="property-value"
                      aria-labelledby="price-label"><g:fieldValue
                        bean="${vehicleInstance}" field="price"/></span>

            </li>
        </g:if>

        <g:if test="${vehicleInstance?.category}">
            <li class="fieldcontain">
                <span id="category-label" class="property-label"><g:message
                        code="vehicle.category.label"
                        default="Category"/></span>

                <span class="property-value"
                      aria-labelledby="category-label"><g:fieldValue
                        bean="${vehicleInstance}" field="category"/></span>

            </li>
        </g:if>

        <g:if test="${vehicleInstance?.manufacturer}">
            <li class="fieldcontain">
                <span id="manufacturer-label" class="property-label"><g:message
                        code="vehicle.manufacturer.label"
                        default="Manufacturer"/></span>

                <span class="property-value"
                      aria-labelledby="manufacturer-label"><g:link
                        controller="manufacturer" action="show"
                        id="${vehicleInstance?.manufacturer?.id}">${vehicleInstance?.manufacturer?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${vehicleInstance?.accidents}">
            <li class="fieldcontain">
                <span id="accidents-label" class="property-label"><g:message
                        code="vehicle.accidents.label"
                        default="Accidents"/></span>

                <g:each in="${vehicleInstance.accidents}" var="a">
                    <span class="property-value"
                          aria-labelledby="accidents-label"><g:link
                            controller="accident" action="show"
                            id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>
        <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_CALL_CENTER">
        <li class="fieldcontain">
            <g:link class="create" controller="accident" action="create"
                    params="[vehicle_id: vehicleInstance.id]"><g:message
                    code="accident.add.label" default="Add accident"/></g:link>
        </li>
        </sec:ifAnyGranted>

        <g:if test="${vehicleInstance?.certificates}">
            <li class="fieldcontain">
                <span id="certificates-label" class="property-label"><g:message
                        code="vehicle.certificates.label"
                        default="Certificates"/></span>

                <g:each in="${vehicleInstance.certificates}" var="c">
                    <span class="property-value"
                          aria-labelledby="certificates-label"><g:link
                            controller="certificate" action="show"
                            id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>
        <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_SELLER">
            <li class="fieldcontain">
                <g:link class="create" controller="certificate" action="create"
                        params="[vehicle_id: vehicleInstance.id]">
                    <g:message code="certificate.add.label"
                               default="Add certificate"/>
                </g:link>
            </li>
        </sec:ifAnyGranted>

    </ol>

    <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_SELLER">
        <g:form url="[resource: vehicleInstance, action: 'delete']" method="DELETE">
            <fieldset class="buttons">
                <g:link class="edit" action="edit"
                        resource="${vehicleInstance}"><g:message
                        code="default.button.edit.label" default="Edit"/></g:link>
                <g:actionSubmit class="delete" action="delete"
                                value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
            </fieldset>
        </g:form>
    </sec:ifAnyGranted>

</div>
</body>
</html>
