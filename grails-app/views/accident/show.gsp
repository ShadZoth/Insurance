<%@ page import="insurance.Accident" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'accident.label', default: 'Accident')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-accident" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                               default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-accident" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list accident">

        <g:if test="${accidentInstance?.vehicle}">
            <li class="fieldcontain">
                <span id="vehicle-label" class="property-label"><g:message code="accident.vehicle.label"
                                                                           default="Vehicle"/></span>

                <span class="property-value" aria-labelledby="vehicle-label"><g:link controller="vehicle" action="show"
                                                                                     id="${accidentInstance?.vehicle?.id}">${accidentInstance?.vehicle?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${accidentInstance?.dateTime}">
            <li class="fieldcontain">
                <span id="dateTime-label" class="property-label"><g:message code="accident.dateTime.label"
                                                                            default="Date Time"/></span>

                <span class="property-value" aria-labelledby="dateTime-label"><g:formatDate
                        date="${accidentInstance?.dateTime}"/></span>

            </li>
        </g:if>

        <g:if test="${accidentInstance?.damage}">
            <li class="fieldcontain">
                <span id="damage-label" class="property-label"><g:message code="accident.damage.label"
                                                                          default="Damage"/></span>

                <span class="property-value" aria-labelledby="damage-label"><g:fieldValue bean="${accidentInstance}"
                                                                                          field="damage"/></span>

            </li>
        </g:if>

        <g:if test="${accidentInstance?.payments}">
            <li class="fieldcontain">
                <span id="payments-label" class="property-label"><g:message code="accident.payments.label"
                                                                            default="Payments"/></span>

                <g:each in="${accidentInstance.payments}" var="p">
                    <span class="property-value" aria-labelledby="payments-label"><g:link controller="payment"
                                                                                          action="show"
                                                                                          id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

    </ol>
    <g:form url="[resource: accidentInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${accidentInstance}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
