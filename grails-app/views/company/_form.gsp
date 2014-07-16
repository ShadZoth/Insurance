<%@ page import="insurance.Company" %>



<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'registrationDate', 'error')} required">
	<label for="registrationDate">
		<g:message code="company.registrationDate.label" default="Registration Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="registrationDate" precision="day"  value="${companyInstance?.registrationDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'archived', 'error')} ">
	<label for="archived">
		<g:message code="company.archived.label" default="Archived" />
		
	</label>
	<g:checkBox name="archived" value="${companyInstance?.archived}" />

</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'seller', 'error')} required">
	<label for="seller">
		<g:message code="company.seller.label" default="Seller" />
		<span class="required-indicator">*</span>
	</label>
    <g:select id="seller" name="seller.id"
              from="${insurance.User.list().findAll {
                  it.hasRole('ROLE_SELLER')
              }}" optionKey="id" required=""
              value="${companyInstance?.seller?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="company.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="30" required="" value="${companyInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'inn', 'error')} required">
	<label for="inn">
		<g:message code="company.inn.label" default="Inn" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="inn" maxlength="12" required="" value="${companyInstance?.inn}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'contacts', 'error')} ">
	<label for="contacts">
		<g:message code="company.contacts.label" default="Contacts" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${companyInstance?.contacts?}" var="c">
    <li><g:link controller="contact" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="contact" action="create" params="['company.id': companyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'contact.label', default: 'Contact')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'vehicles', 'error')} ">
	<label for="vehicles">
		<g:message code="company.vehicles.label" default="Vehicles" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${companyInstance?.vehicles?}" var="v">
    <li><g:link controller="vehicle" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="vehicle" action="create" params="['company.id': companyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'vehicle.label', default: 'Vehicle')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'warrants', 'error')} ">
	<label for="warrants">
		<g:message code="company.warrants.label" default="Warrants" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${companyInstance?.warrants?}" var="w">
    <li><g:link controller="warrant" action="show" id="${w.id}">${w?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="warrant" action="create" params="['company.id': companyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'warrant.label', default: 'Warrant')])}</g:link>
</li>
</ul>


</div>

