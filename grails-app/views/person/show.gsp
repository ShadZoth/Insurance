<%@ page import="insurance.Person" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(code: 'person.label', default: 'Person')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-person" class="skip" tabindex="-1"><g:message
        code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_SELLER">
    <div class="nav" role="navigation">
        <ul>
            %{--<li><a class="home" href="${createLink(uri: '/')}"><g:message--}%
            %{--code="default.home.label"/></a></li>--}%
            <li><g:link class="list" action="index"><g:message
                    code="default.list.label" args="[entityName]"/></g:link></li>
            <li><g:link class="create" action="create"><g:message
                    code="default.new.label" args="[entityName]"/></g:link></li>
        </ul>
    </div>
</sec:ifAnyGranted>

<div id="show-person" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list person">

        <g:if test="${personInstance?.registrationDate}">
            <li class="fieldcontain">
                <span id="registrationDate-label"
                      class="property-label"><g:message
                        code="person.registrationDate.label"
                        default="Registration Date"/></span>

                <span class="property-value"
                      aria-labelledby="registrationDate-label"><g:formatDate format="yyyy-MM-dd"
                                                                             date="${personInstance?.registrationDate}"/></span>

            </li>
        </g:if>

        <g:if test="${personInstance?.seller}">
            <li class="fieldcontain">
                <span id="seller-label" class="property-label"><g:message code="person.seller.label"
                                                                          default="Seller"/></span>

                <span class="property-value" aria-labelledby="seller-label"><g:fieldValue bean="${personInstance}"
                                                                                          field="seller"/></span>

            </li>
        </g:if>

        <g:if test="${personInstance?.archived}">
            <li class="fieldcontain">
                <span id="archived-label" class="property-label"><g:message
                        code="person.archived.label" default="Archived"/></span>

                <span class="property-value"
                      aria-labelledby="archived-label"><g:formatBoolean
                        boolean="${personInstance?.archived}"/></span>

            </li>
        </g:if>

        <g:if test="${personInstance?.contacts}">
            <li class="fieldcontain">
                <span id="contacts-label" class="property-label"><g:message
                        code="person.contacts.label" default="Contacts"/></span>

                <g:each in="${personInstance.contacts}" var="c">
                    <span class="property-value"
                          aria-labelledby="contacts-label"><g:link
                            controller="contact" action="show"
                            id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>
        <li class="fieldcontain">
            <g:link class="create" controller="contact" action="create"
                    params="[client_id: clientInstance.id]"><g:message
                    code="contact.add.label" default="Add contact"/></g:link>
        </li>

        <g:if test="${personInstance?.licenses}">
            <li class="fieldcontain">
                <span id="licenses-label" class="property-label"><g:message
                        code="person.licenses.label" default="Licenses"/></span>

                <g:each in="${personInstance.licenses}" var="l">
                    <span class="property-value"
                          aria-labelledby="licenses-label"><g:link
                            controller="license" action="show"
                            id="${l.id}">${l?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${personInstance?.passports}">
            <li class="fieldcontain">
                <span id="passports-label" class="property-label"><g:message
                        code="person.passports.label"
                        default="Passports"/></span>

                <g:each in="${personInstance.passports}" var="p">
                    <span class="property-value"
                          aria-labelledby="passports-label"><g:link
                            controller="passport" action="show"
                            id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${personInstance?.vehicles}">
            <li class="fieldcontain">
                <span id="vehicles-label" class="property-label"><g:message
                        code="person.vehicles.label" default="Vehicles"/></span>

                <g:each in="${personInstance.vehicles}" var="v">
                    <span class="property-value"
                          aria-labelledby="vehicles-label"><g:link
                            controller="vehicle" action="show"
                            id="${v.id}">${v?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>
        <li class = "fieldcontain">
            <g:link class="create" controller="vehicle" action="create" params="[client_id:personInstance.id]"><g:message
                    code="vehicle.add.label" default="Add vehicle"/></g:link>
        </li>
        <g:if test="${personInstance?.warrants}">
            <li class="fieldcontain">
                <span id="warrants-label" class="property-label"><g:message
                        code="person.warrants.label" default="Warrants"/></span>

                <g:each in="${personInstance.warrants}" var="w">
                    <span class="property-value"
                          aria-labelledby="warrants-label"><g:link
                            controller="warrant" action="show"
                            id="${w.id}">${w?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>
        <li class="fieldcontain">
            <g:link class="create" controller="warrant" action="create"
                    params="[client_id: personInstance.id]"><g:message
                    code="warrant.add.label" default="Add warrant"/></g:link>
        </li>
    </ol>

    <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_SELLER">
        <g:form url="[resource: personInstance, action: 'delete']" method="DELETE">
            <fieldset class="buttons">
                <g:link class="edit" action="edit"
                        resource="${personInstance}"><g:message
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
