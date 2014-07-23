<%@ page import="insurance.Passport" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(code: 'passport.label', default: 'Passport')}"/>
    <title><g:message code="passport.show.label" default="Passport"/></title>
</head>

<body>
<a href="#show-passport" class="skip" tabindex="-1"><g:message
        code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_SELLER">
    <div class="nav" role="navigation">
        <ul>
            <li><g:link class="list" action="index"><g:message
                    code="default.list.label"
                    args="[entityName]"/></g:link></li>
            <li><g:link class="create" action="create"><g:message
                    code="default.new.label" args="[entityName]"/></g:link></li>
        </ul>
    </div>
</sec:ifAnyGranted>

<div id="show-passport" class="content scaffold-show" role="main">
    <h1><g:message code="passport.show.label" default="Passport"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list passport">

        <g:if test="${passportInstance?.person}">
            <li class="fieldcontain">
                <span id="person-label" class="property-label"><g:message
                        code="passport.person.label" default="Person"/></span>

                <span class="property-value"
                      aria-labelledby="person-label"><g:link controller="person"
                                                             action="show"
                                                             id="${passportInstance?.person?.id}">${passportInstance?.person?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${passportInstance?.number}">
            <li class="fieldcontain">
                <span id="number-label" class="property-label"><g:message
                        code="passport.number.label" default="Number"/></span>

                <span class="property-value"
                      aria-labelledby="number-label"><g:fieldValue
                        bean="${passportInstance}" field="number"/></span>

            </li>
        </g:if>

        <g:if test="${passportInstance?.issueDate}">
            <li class="fieldcontain">
                <span id="issueDate-label" class="property-label"><g:message
                        code="passport.issueDate.label"
                        default="Issue Date"/></span>

                <span class="property-value"
                      aria-labelledby="issueDate-label"><g:formatDate
                        format="yyyy-MM-dd"
                        date="${passportInstance?.issueDate}"/></span>

            </li>
        </g:if>

        <g:if test="${passportInstance?.firstName}">
            <li class="fieldcontain">
                <span id="firstName-label" class="property-label"><g:message
                        code="passport.firstName.label"
                        default="First Name"/></span>

                <span class="property-value"
                      aria-labelledby="firstName-label"><g:fieldValue
                        bean="${passportInstance}" field="firstName"/></span>

            </li>
        </g:if>

        <g:if test="${passportInstance?.lastName}">
            <li class="fieldcontain">
                <span id="lastName-label" class="property-label"><g:message
                        code="passport.lastName.label"
                        default="Last Name"/></span>

                <span class="property-value"
                      aria-labelledby="lastName-label"><g:fieldValue
                        bean="${passportInstance}" field="lastName"/></span>

            </li>
        </g:if>

        <g:if test="${passportInstance?.birthDate}">
            <li class="fieldcontain">
                <span id="birthDate-label" class="property-label"><g:message
                        code="passport.birthDate.label"
                        default="Birth Date"/></span>

                <span class="property-value"
                      aria-labelledby="birthDate-label"><g:formatDate
                        format="yyyy-MM-dd"
                        date="${passportInstance?.birthDate}"/></span>

            </li>
        </g:if>

        <g:if test="${passportInstance?.sex}">
            <li class="fieldcontain">
                <span id="sex-label" class="property-label"><g:message
                        code="passport.sex.label" default="Sex"/></span>

                <span class="property-value"
                      aria-labelledby="sex-label"><g:fieldValue
                        bean="${passportInstance}" field="sex"/></span>

            </li>
        </g:if>

    </ol>

    <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_SELLER">
        <g:form url="[resource: passportInstance, action: 'delete']"
                method="DELETE">
            <fieldset class="buttons">
                <g:link class="edit" action="edit"
                        resource="${passportInstance}"><g:message
                        code="default.button.edit.label"
                        default="Edit"/></g:link>
            </fieldset>
        </g:form>
    </sec:ifAnyGranted>

</div>
</body>
</html>
