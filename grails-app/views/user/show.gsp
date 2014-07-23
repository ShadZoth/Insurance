<%@ page import="insurance.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-user" class="skip" tabindex="-1"><g:message
        code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><g:link class="list" action="index"><g:message
                code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message
                code="default.new.label" args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-user" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list user">

        <g:if test="${userInstance?.username}">
            <li class="fieldcontain">
                <span id="username-label" class="property-label"><g:message
                        code="user.username.label" default="Username"/></span>

                <span class="property-value"
                      aria-labelledby="username-label"><g:fieldValue
                        bean="${userInstance}" field="username"/></span>

            </li>
        </g:if>

        <g:if test="${userInstance?.password}">
            <li class="fieldcontain">
                <span id="password-label" class="property-label"><g:message
                        code="user.password.label" default="Password"/></span>

                <span class="property-value"
                      aria-labelledby="password-label"><g:fieldValue
                        bean="${userInstance}" field="password"/></span>

            </li>
        </g:if>

        <g:if test="${userInstance?.authority}">
            <li class="fieldcontain">
                <span id="authority-label" class="property-label"><g:message
                        code="user.authority.label" default="Authority"/></span>

                <span class="property-value"
                      aria-labelledby="authority-label"><g:fieldValue
                        bean="${userInstance}" field="authority"/></span>

            </li>
        </g:if>

        <g:if test="${userInstance?.accountExpired}">
            <li class="fieldcontain">
                <span id="accountExpired-label"
                      class="property-label"><g:message
                        code="user.accountExpired.label"
                        default="Account Expired"/></span>

                <span class="property-value"
                      aria-labelledby="accountExpired-label"><g:formatBoolean
                        boolean="${userInstance?.accountExpired}"/></span>

            </li>
        </g:if>

        <g:if test="${userInstance?.accountLocked}">
            <li class="fieldcontain">
                <span id="accountLocked-label" class="property-label"><g:message
                        code="user.accountLocked.label"
                        default="Account Locked"/></span>

                <span class="property-value"
                      aria-labelledby="accountLocked-label"><g:formatBoolean
                        boolean="${userInstance?.accountLocked}"/></span>

            </li>
        </g:if>

        <g:if test="${userInstance?.clients}">
            <li class="fieldcontain">
                <span id="clients-label" class="property-label"><g:message
                        code="user.clients.label" default="Clients"/></span>

                <g:each in="${userInstance.clients}" var="c">
                    <span class="property-value"
                          aria-labelledby="clients-label"><g:link
                            controller="client" action="show"
                            id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${userInstance?.enabled}">
            <li class="fieldcontain">
                <span id="enabled-label" class="property-label"><g:message
                        code="user.enabled.label" default="Enabled"/></span>

                <span class="property-value"
                      aria-labelledby="enabled-label"><g:formatBoolean
                        boolean="${userInstance?.enabled}"/></span>

            </li>
        </g:if>

        <g:if test="${userInstance?.passwordExpired}">
            <li class="fieldcontain">
                <span id="passwordExpired-label"
                      class="property-label"><g:message
                        code="user.passwordExpired.label"
                        default="Password Expired"/></span>

                <span class="property-value"
                      aria-labelledby="passwordExpired-label"><g:formatBoolean
                        boolean="${userInstance?.passwordExpired}"/></span>

            </li>
        </g:if>

        <g:if test="${userInstance?.authority == "ROLE_SELLER"}">
            <g:if test="${userInstance?.manager}">
                <li class="fieldcontain">
                    <span id="manager-label" class="property-label"><g:message
                            code="user.manager.label" default="Manager"/></span>

                    <span class="property-value"
                          aria-labelledby="username-label"><g:fieldValue
                            bean="${userInstance}" field="manager"/></span>

                </li>
            </g:if>
        </g:if>

    </ol>

    <sec:ifAnyGranted roles="ROLE_MANAGER">
        <g:if test="${!userInstance?.manager}">
            <g:form url="[resource: userInstance, action: 'addManager']">
                <fieldset id="add_manager">
                    <g:submitButton name="addManager" class="addManager"
                                    value="${message(code: 'default.button.addManager.label', default: 'Add me as manager')}"/>
                </fieldset>
            </g:form>
        </g:if>
    </sec:ifAnyGranted>

    <g:form url="[resource: userInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit"
                    resource="${userInstance}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
        </fieldset>
    </g:form>
</div>
</body>
</html>
