<%@ page import="insurance.Contact" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(code: 'contact.label', default: 'Contact')}"/>
    <title><g:message code="contact.show.label"/></title>
</head>

<body>
<a href="#show-contact" class="skip" tabindex="-1"><g:message
        code="default.link.skip.label"
        default="Skip to content&hellip;"/></a>
<sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_SELLER">
    <div class="nav" role="navigation">
        <ul>
            %{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
            <li><g:link class="list" action="index"><g:message
                    code="contact.index.label"/></g:link></li>
            <li><g:link class="create" action="create"><g:message
                    code="contact.create.label"/></g:link></li>
        </ul>
    </div>
</sec:ifAnyGranted>

<div id="show-contact" class="content scaffold-show" role="main">
    <h1><g:message code="contact.show.label"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list contact">

        <g:if test="${contactInstance?.value}">
            <li class="fieldcontain">
                <span id="value-label" class="property-label"><g:message
                        code="contact.value.label"
                        default="Value"/></span>

                <span class="property-value"
                      aria-labelledby="value-label"><g:fieldValue
                        bean="${contactInstance}"
                        field="value"/></span>

            </li>
        </g:if>

        <g:if test="${contactInstance?.client}">
            <li class="fieldcontain">
                <span id="client-label" class="property-label"><g:message
                        code="contact.client.label"
                        default="Client"/></span>

                <span class="property-value"
                      aria-labelledby="client-label"><g:link controller="client"
                                                             action="show"
                                                             id="${contactInstance?.client?.id}">${contactInstance?.client?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${contactInstance?.type}">
            <li class="fieldcontain">
                <span id="type-label" class="property-label"><g:message
                        code="contact.type.label"
                        default="Type"/></span>

                <span class="property-value"
                      aria-labelledby="type-label"><g:fieldValue
                        bean="${contactInstance}"
                        field="type"/></span>

            </li>
        </g:if>

    </ol>

    <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_SELLER">
        <g:form url="[resource: contactInstance, action: 'delete']"
                method="DELETE">
            <fieldset class="buttons">
                <g:link class="edit" action="edit"
                        resource="${contactInstance}"><g:message
                        code="default.button.edit.label"
                        default="Edit"/></g:link>
            </fieldset>
        </g:form>
    </sec:ifAnyGranted>

</div>
</body>
</html>
