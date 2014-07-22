<%@ page import="insurance.Manufacturer" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'manufacturer.label', default: 'Manufacturer')}"/>
    <title><g:message code="manufacturer.show.label"/></title>
</head>

<body>
<a href="#show-manufacturer" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                   default="Skip to content&hellip;"/></a>
<sec:ifAnyGranted roles="ROLE_ADMIN">
    <div class="nav" role="navigation">
        <ul>
            %{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
            <li><g:link class="list" action="index"><g:message code="manufacturer.list.label"/></g:link></li>
            <li><g:link class="create" action="create"><g:message code="manufacturer.create.label"/></g:link></li>
        </ul>
    </div>
</sec:ifAnyGranted>

<div id="show-manufacturer" class="content scaffold-show" role="main">
    <h1><g:message code="manufacturer.show.label"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list manufacturer">

        <g:if test="${manufacturerInstance?.name}">
            <li class="fieldcontain">
                <span id="name-label" class="property-label"><g:message code="manufacturer.name.label"
                                                                        default="Name"/></span>

                <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${manufacturerInstance}"
                                                                                        field="name"/></span>

            </li>
        </g:if>

        <g:if test="${manufacturerInstance?.vehicles}">
            <li class="fieldcontain">
                <span id="vehicles-label" class="property-label"><g:message code="manufacturer.vehicles.label"
                                                                            default="Vehicles"/></span>

                <g:each in="${manufacturerInstance.vehicles}" var="v">
                    <span class="property-value" aria-labelledby="vehicles-label"><g:link controller="vehicle"
                                                                                          action="show"
                                                                                          id="${v.id}">${v?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

    </ol>
    <sec:ifAnyGranted roles="ROLE_ADMIN">
        <g:form url="[resource: manufacturerInstance, action: 'delete']" method="DELETE">
            <fieldset class="buttons">
                <g:link class="edit" action="edit" resource="${manufacturerInstance}"><g:message
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
