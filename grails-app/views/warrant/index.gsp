
<%@ page import="insurance.Warrant" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'warrant.label', default: 'Warrant')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-warrant" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-warrant" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="number" title="${message(code: 'warrant.number.label', default: 'Number')}" />
					
						<th><g:message code="warrant.client.label" default="Client" /></th>
					
						<th><g:message code="warrant.product.label" default="Product" /></th>
					
						<g:sortableColumn property="issueDate" title="${message(code: 'warrant.issueDate.label', default: 'Issue Date')}" />
					
						<g:sortableColumn property="expireDate" title="${message(code: 'warrant.expireDate.label', default: 'Expire Date')}" />
					
						<g:sortableColumn property="price" title="${message(code: 'warrant.price.label', default: 'Price')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${warrantInstanceList}" status="i" var="warrantInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${warrantInstance.id}">${fieldValue(bean: warrantInstance, field: "number")}</g:link></td>
					
						<td>${fieldValue(bean: warrantInstance, field: "client")}</td>
					
						<td>${fieldValue(bean: warrantInstance, field: "product")}</td>
					
						<td><g:formatDate date="${warrantInstance.issueDate}" /></td>
					
						<td><g:formatDate date="${warrantInstance.expireDate}" /></td>
					
						<td>${fieldValue(bean: warrantInstance, field: "price")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${warrantInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
