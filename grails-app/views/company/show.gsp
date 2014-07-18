<%@ page import="insurance.Company" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'company.label', default: 'Company')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-company" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                              default="Skip to content&hellip;"/></a>
<sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_SELLER">
    <div class="nav" role="navigation">
        <ul>
            %{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
            <li><g:link class="list" action="index"><g:message code="default.list.label"
                                                               args="[entityName]"/></g:link></li>
            <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                                  args="[entityName]"/></g:link></li>
        </ul>
    </div>
</sec:ifAnyGranted>

<div id="show-company" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list company">

        <g:if test="${companyInstance?.registrationDate}">
            <li class="fieldcontain">
                <span id="registrationDate-label" class="property-label"><g:message
                        code="company.registrationDate.label" default="Registration Date"/></span>

                <span class="property-value" aria-labelledby="registrationDate-label"><g:formatDate
                        date="${companyInstance?.registrationDate}"/></span>

            </li>
        </g:if>

        <g:if test="${companyInstance?.archived}">
            <li class="fieldcontain">
                <span id="archived-label" class="property-label"><g:message code="company.archived.label"
                                                                            default="Archived"/></span>

                <span class="property-value" aria-labelledby="archived-label"><g:formatBoolean
                        boolean="${companyInstance?.archived}"/></span>

            </li>
        </g:if>

        <g:if test="${companyInstance?.name}">
            <li class="fieldcontain">
                <span id="name-label" class="property-label"><g:message code="company.name.label"
                                                                        default="Name"/></span>

                <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${companyInstance}"
                                                                                        field="name"/></span>

            </li>
        </g:if>

        <g:if test="${companyInstance?.inn}">
            <li class="fieldcontain">
                <span id="inn-label" class="property-label"><g:message code="company.inn.label" default="Inn"/></span>

                <span class="property-value" aria-labelledby="inn-label"><g:fieldValue bean="${companyInstance}"
                                                                                       field="inn"/></span>

            </li>
        </g:if>

        <g:if test="${companyInstance?.contacts}">
            <li class="fieldcontain">
                <span id="contacts-label" class="property-label"><g:message code="company.contacts.label"
                                                                            default="Contacts"/></span>

                <g:each in="${companyInstance.contacts}" var="c">
                    <span class="property-value" aria-labelledby="contacts-label"><g:link controller="contact"
                                                                                          action="show"
                                                                                          id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${companyInstance?.vehicles}">
            <li class="fieldcontain">
                <span id="vehicles-label" class="property-label"><g:message code="company.vehicles.label"
                                                                            default="Vehicles"/></span>

                <g:each in="${companyInstance.vehicles}" var="v">
                    <span class="property-value" aria-labelledby="vehicles-label"><g:link controller="vehicle"
                                                                                          action="show"
                                                                                          id="${v.id}">${v?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${companyInstance?.warrants}">
            <li class="fieldcontain">
                <span id="warrants-label" class="property-label"><g:message code="company.warrants.label"
                                                                            default="Warrants"/></span>

                <g:each in="${companyInstance.warrants}" var="w">
                    <span class="property-value" aria-labelledby="warrants-label"><g:link controller="warrant"
                                                                                          action="show"
                                                                                          id="${w.id}">${w?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

    </ol>

    <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_SELLER">
        <g:form url="[resource: companyInstance, action: 'delete']" method="DELETE">
            <fieldset class="buttons">
                <g:link class="edit" action="edit" resource="${companyInstance}"><g:message
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
