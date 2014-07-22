<%@ page import="insurance.License" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'license.label', default: 'License')}"/>
    <title><g:message code="license.show.label"/></title>
</head>

<body>
<a href="#show-license" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                              default="Skip to content&hellip;"/></a>
<sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_SELLER">
    <div class="nav" role="navigation">
        <ul>
            <li><g:link class="list" action="index"><g:message code="license.list.label"/></g:link></li>
            <li><g:link class="create" action="create"><g:message code="license.create.label"/></g:link></li>
        </ul>
    </div>
</sec:ifAnyGranted>

<div id="show-license" class="content scaffold-show" role="main">
    <h1><g:message code="license.show.label"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list license">

        <g:if test="${licenseInstance?.number}">
            <li class="fieldcontain">
                <span id="number-label" class="property-label"><g:message code="license.number.label"
                                                                          default="Number"/></span>

                <span class="property-value" aria-labelledby="number-label"><g:fieldValue bean="${licenseInstance}"
                                                                                          field="number"/></span>

            </li>
        </g:if>

        <g:if test="${licenseInstance?.owner}">
            <li class="fieldcontain">
                <span id="owner-label" class="property-label"><g:message code="license.owner.label"
                                                                         default="Owner"/></span>

                <span class="property-value" aria-labelledby="owner-label"><g:link controller="person" action="show"
                                                                                   id="${licenseInstance?.owner?.id}">${licenseInstance?.owner?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${licenseInstance?.issueDate}">
            <li class="fieldcontain">
                <span id="issueDate-label" class="property-label"><g:message code="license.issueDate.label"
                                                                             default="Issue Date"/></span>

                <span class="property-value" aria-labelledby="issueDate-label"><g:formatDate format="yyyy-MM-dd"
                        date="${licenseInstance?.issueDate}"/></span>

            </li>
        </g:if>

        <g:if test="${licenseInstance?.expirationDate}">
            <li class="fieldcontain">
                <span id="expirationDate-label" class="property-label"><g:message code="license.expirationDate.label"
                                                                                  default="Expiration Date"/></span>

                <span class="property-value" aria-labelledby="expirationDate-label"><g:formatDate format="yyyy-MM-dd"
                        date="${licenseInstance?.expirationDate}"/></span>

            </li>
        </g:if>

        <g:if test="${licenseInstance?.a}">
            <li class="fieldcontain">
                <span id="a-label" class="property-label"><g:message code="license.a.label" default="A"/></span>

                <span class="property-value" aria-labelledby="a-label"><g:formatBoolean
                        boolean="${licenseInstance?.a}"/></span>

            </li>
        </g:if>

        <g:if test="${licenseInstance?.b}">
            <li class="fieldcontain">
                <span id="b-label" class="property-label"><g:message code="license.b.label" default="B"/></span>

                <span class="property-value" aria-labelledby="b-label"><g:formatBoolean
                        boolean="${licenseInstance?.b}"/></span>

            </li>
        </g:if>

        <g:if test="${licenseInstance?.c}">
            <li class="fieldcontain">
                <span id="c-label" class="property-label"><g:message code="license.c.label" default="C"/></span>

                <span class="property-value" aria-labelledby="c-label"><g:formatBoolean
                        boolean="${licenseInstance?.c}"/></span>

            </li>
        </g:if>

        <g:if test="${licenseInstance?.d}">
            <li class="fieldcontain">
                <span id="d-label" class="property-label"><g:message code="license.d.label" default="D"/></span>

                <span class="property-value" aria-labelledby="d-label"><g:formatBoolean
                        boolean="${licenseInstance?.d}"/></span>

            </li>
        </g:if>

        <g:if test="${licenseInstance?.e}">
            <li class="fieldcontain">
                <span id="e-label" class="property-label"><g:message code="license.e.label" default="E"/></span>

                <span class="property-value" aria-labelledby="e-label"><g:formatBoolean
                        boolean="${licenseInstance?.e}"/></span>

            </li>
        </g:if>

        <g:if test="${licenseInstance?.tb}">
            <li class="fieldcontain">
                <span id="tb-label" class="property-label"><g:message code="license.tb.label" default="Tb"/></span>

                <span class="property-value" aria-labelledby="tb-label"><g:formatBoolean
                        boolean="${licenseInstance?.tb}"/></span>

            </li>
        </g:if>

        <g:if test="${licenseInstance?.tm}">
            <li class="fieldcontain">
                <span id="tm-label" class="property-label"><g:message code="license.tm.label" default="Tm"/></span>

                <span class="property-value" aria-labelledby="tm-label"><g:formatBoolean
                        boolean="${licenseInstance?.tm}"/></span>

            </li>
        </g:if>

    </ol>

    <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_SELLER">
        <g:form url="[resource: licenseInstance, action: 'delete']" method="DELETE">
            <fieldset class="buttons">
                <g:link class="edit" action="edit" resource="${licenseInstance}"><g:message
                        code="default.button.edit.label"
                        default="Edit"/></g:link>
                <g:actionSubmit class="delete" action="delete"
                                value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
            </fieldset>
        </g:form>
    </sec:ifAnyGranted>

</div>
</body>
</html>
