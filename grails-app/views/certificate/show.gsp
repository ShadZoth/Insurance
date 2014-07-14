<%@ page import="insurance.Certificate" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'certificate.label', default: 'Certificate')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-certificate" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                  default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-certificate" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list certificate">

        <g:if test="${certificateInstance?.number}">
            <li class="fieldcontain">
                <span id="number-label" class="property-label"><g:message code="certificate.number.label"
                                                                          default="Number"/></span>

                <span class="property-value" aria-labelledby="number-label"><g:fieldValue bean="${certificateInstance}"
                                                                                          field="number"/></span>

            </li>
        </g:if>

        <g:if test="${certificateInstance?.vehicle}">
            <li class="fieldcontain">
                <span id="vehicle-label" class="property-label"><g:message code="certificate.vehicle.label"
                                                                           default="Vehicle"/></span>

                <span class="property-value" aria-labelledby="vehicle-label"><g:link controller="vehicle" action="show"
                                                                                     id="${certificateInstance?.vehicle?.id}">${certificateInstance?.vehicle?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${certificateInstance?.color}">
            <li class="fieldcontain">
                <span id="color-label" class="property-label"><g:message code="certificate.color.label"
                                                                         default="Color"/></span>

                <span class="property-value" aria-labelledby="color-label"><g:fieldValue bean="${certificateInstance}"
                                                                                         field="color"/></span>

            </li>
        </g:if>

        <g:if test="${certificateInstance?.issueDate}">
            <li class="fieldcontain">
                <span id="issueDate-label" class="property-label"><g:message code="certificate.issueDate.label"
                                                                             default="Issue Date"/></span>

                <span class="property-value" aria-labelledby="issueDate-label"><g:formatDate
                        date="${certificateInstance?.issueDate}"/></span>

            </li>
        </g:if>

        <g:if test="${certificateInstance?.ownerFirstName}">
            <li class="fieldcontain">
                <span id="ownerFirstName-label" class="property-label"><g:message
                        code="certificate.ownerFirstName.label" default="Owner First Name"/></span>

                <span class="property-value" aria-labelledby="ownerFirstName-label"><g:fieldValue
                        bean="${certificateInstance}" field="ownerFirstName"/></span>

            </li>
        </g:if>

        <g:if test="${certificateInstance?.ownerLastName}">
            <li class="fieldcontain">
                <span id="ownerLastName-label" class="property-label"><g:message code="certificate.ownerLastName.label"
                                                                                 default="Owner Last Name"/></span>

                <span class="property-value" aria-labelledby="ownerLastName-label"><g:fieldValue
                        bean="${certificateInstance}" field="ownerLastName"/></span>

            </li>
        </g:if>

        <g:if test="${certificateInstance?.vin}">
            <li class="fieldcontain">
                <span id="vin-label" class="property-label"><g:message code="certificate.vin.label"
                                                                       default="Vin"/></span>

                <span class="property-value" aria-labelledby="vin-label"><g:fieldValue bean="${certificateInstance}"
                                                                                       field="vin"/></span>

            </li>
        </g:if>

    </ol>
    <g:form url="[resource: certificateInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${certificateInstance}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
