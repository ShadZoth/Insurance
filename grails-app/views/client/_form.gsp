<%@ page import="insurance.Client" %>



<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'passports', 'error')} ">
	<label for="passports">
		<g:message code="client.passports.label" default="Passports" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${clientInstance?.passports?}" var="p">
    <li><g:link controller="passport" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="passport" action="create" params="['client.id': clientInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'passport.label', default: 'Passport')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'registrationDate', 'error')} required">
	<label for="registrationDate">
		<g:message code="client.registrationDate.label" default="Registration Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="registrationDate" precision="day"  value="${clientInstance?.registrationDate}"  />

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
	<g:select id="dispatcher" name="dispatcher.id" from="${insurance.User.list()}" optionKey="id" required="" value="${clientInstance?.dispatcher?.id}" class="many-to-one"/>

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

