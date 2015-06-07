<%@ page import="insurance.Warrant" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'warrant.label', default: 'Warrant')}" />
		<title><g:message code="warrant.edit.label" default="Edit warrant" /></title>
	</head>
	<body>
    <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_DISPATCHER">
		<a href="#edit-warrant" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="index"><g:message code="warrant.list.label" default="Warrants list" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="warrant.new.label" default="New warrant" /></g:link></li>
			</ul>
		</div>
		<div id="edit-warrant" class="content scaffold-edit" role="main">
			<h1><g:message code="warrant.edit.label" default="Edit warrant" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${warrantInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${warrantInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:warrantInstance, myClientList: myClientList,  action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${warrantInstance?.version}" />
				<fieldset class="form">
					<g:render template="form" />
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
    </sec:ifAnyGranted>
	</body>
</html>
