<%@ page import="insurance.Company" %>


%{--Выбор даты, дата регистрации--}%
<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'registrationDate', 'error')} required">
	<label for="registrationDate">
		<g:message code="company.registrationDate.label" default="Registration Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="registrationDate" precision="day"  value="${companyInstance?.registrationDate}"  />

</div>

%{--Чекбокс, архивирован--}%
<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'archived', 'error')} ">
	<label for="archived">
		<g:message code="company.archived.label" default="Archived" />
		
	</label>
	<g:checkBox name="archived" value="${companyInstance?.archived}" />

</div>

%{--Форма, название компании--}%
<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="company.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="30" required="" value="${companyInstance?.name}"/>

</div>

%{--Форма, ИНН--}%
<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'inn', 'error')} required">
	<label for="inn">
		<g:message code="company.inn.label" default="Inn" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="inn" maxlength="12" required="" value="${companyInstance?.inn}"/>

</div>

%{--Добавление контактов--}%
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

%{--Добавление ТС--}%
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

%{--Добавление страховки--}%
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

