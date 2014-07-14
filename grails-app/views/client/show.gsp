<%@ page import="insurance.Client" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-client" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                             default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-client" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list client">

        <g:if test="${clientInstance?.registrationDate}">
            <li class="fieldcontain">
                <span id="registrationDate-label" class="property-label"><g:message code="client.registrationDate.label"
                                                                                    default="Registration Date"/></span>

                <span class="property-value" aria-labelledby="registrationDate-label"><g:formatDate
                        date="${clientInstance?.registrationDate}"/></span>

            </li>
        </g:if>

        <g:if test="${clientInstance?.archived}">
            <li class="fieldcontain">
                <span id="archived-label" class="property-label"><g:message code="client.archived.label"
                                                                            default="Archived"/></span>

                <span class="property-value" aria-labelledby="archived-label"><g:formatBoolean
                        boolean="${clientInstance?.archived}"/></span>

            </li>
        </g:if>

        <g:if test="${clientInstance?.contacts}">
            <li class="fieldcontain">
                <span id="contacts-label" class="property-label"><g:message code="client.contacts.label"
                                                                            default="Contacts"/></span>

                <g:each in="${clientInstance.contacts}" var="c">
                    <span class="property-value" aria-labelledby="contacts-label"><g:link controller="contact"
                                                                                          action="show"
                                                                                          id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${clientInstance?.vehicles}">
            <li class="fieldcontain">
                <span id="vehicles-label" class="property-label"><g:message code="client.vehicles.label"
                                                                            default="Vehicles"/></span>

                <g:each in="${clientInstance.vehicles}" var="v">
                    <span class="property-value" aria-labelledby="vehicles-label"><g:link controller="vehicle"
                                                                                          action="show"
                                                                                          id="${v.id}">${v?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${clientInstance?.warrants}">
            <li class="fieldcontain">
                <span id="warrants-label" class="property-label"><g:message code="client.warrants.label"
                                                                            default="Warrants"/></span>

                <g:each in="${clientInstance.warrants}" var="w">
                    <span class="property-value" aria-labelledby="warrants-label"><g:link controller="warrant"
                                                                                          action="show"
                                                                                          id="${w.id}">${w?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

    </ol>
    <g:form url="[resource: clientInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${clientInstance}"><g:message code="default.button.edit.label"
                                                                                       default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
