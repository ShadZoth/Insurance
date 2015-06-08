<%@ page import="insurance.Client" %>



<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="client.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${clientInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="client.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required="" value="${clientInstance?.lastName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'archived', 'error')} ">
	<label for="archived">
		<g:message code="client.archived.label" default="Archived" />
		
	</label>
	<g:checkBox name="archived" value="${clientInstance?.archived}" />

</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'dispatcher', 'error')} required">
	<label for="dispatcher">
		<g:message code="client.dispatcher.label" default="Dispatcher" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="dispatcher" name="dispatcher.id" from="${insurance.User.list().findAll {it.hasRoleService.serviceMethod(it, 'ROLE_DISPATCHER')}}" optionKey="id" required="" value="${clientInstance?.dispatcher?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'contacts', 'error')} ">
	<label for="contacts">
		<g:message code="client.contacts.label" default="Contacts" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${clientInstance?.contacts?}" var="c">
    <li><g:link controller="contact" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="contact" action="create" params="['client.id': clientInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'contact.label', default: 'Contact')])}</g:link>
</li>
</ul>


</div>

