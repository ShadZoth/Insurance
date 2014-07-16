<%@ page import="insurance.Person" %>



<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'registrationDate', 'error')} required">
	<label for="registrationDate">
		<g:message code="person.registrationDate.label" default="Registration Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="registrationDate" precision="day"  value="${personInstance?.registrationDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'archived', 'error')} ">
	<label for="archived">
		<g:message code="person.archived.label" default="Archived" />
		
	</label>
	<g:checkBox name="archived" value="${personInstance?.archived}" />

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'seller', 'error')} required">
	<label for="seller">
		<g:message code="person.seller.label" default="Seller" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="seller" name="seller.id" from="${insurance.User.list()}" optionKey="id" required="" value="${personInstance?.seller?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'contacts', 'error')} ">
	<label for="contacts">
		<g:message code="person.contacts.label" default="Contacts" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${personInstance?.contacts?}" var="c">
    <li><g:link controller="contact" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="contact" action="create" params="['person.id': personInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'contact.label', default: 'Contact')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'licenses', 'error')} ">
	<label for="licenses">
		<g:message code="person.licenses.label" default="Licenses" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${personInstance?.licenses?}" var="l">
    <li><g:link controller="license" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="license" action="create" params="['person.id': personInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'license.label', default: 'License')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'passports', 'error')} ">
	<label for="passports">
		<g:message code="person.passports.label" default="Passports" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${personInstance?.passports?}" var="p">
    <li><g:link controller="passport" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="passport" action="create" params="['person.id': personInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'passport.label', default: 'Passport')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'vehicles', 'error')} ">
	<label for="vehicles">
		<g:message code="person.vehicles.label" default="Vehicles" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${personInstance?.vehicles?}" var="v">
    <li><g:link controller="vehicle" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="vehicle" action="create" params="['person.id': personInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'vehicle.label', default: 'Vehicle')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'warrants', 'error')} ">
	<label for="warrants">
		<g:message code="person.warrants.label" default="Warrants" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${personInstance?.warrants?}" var="w">
    <li><g:link controller="warrant" action="show" id="${w.id}">${w?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="warrant" action="create" params="['person.id': personInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'warrant.label', default: 'Warrant')])}</g:link>
</li>
</ul>


</div>

