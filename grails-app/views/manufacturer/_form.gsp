<%@ page import="insurance.Manufacturer" %>


%{--Форма, название производителя--}%
<div class="fieldcontain ${hasErrors(bean: manufacturerInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="manufacturer.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="30" required="" value="${manufacturerInstance?.name}"/>

</div>

%{--Создание ТС--}%
<div class="fieldcontain ${hasErrors(bean: manufacturerInstance, field: 'vehicles', 'error')} ">
	<label for="vehicles">
		<g:message code="manufacturer.vehicles.label" default="Vehicles" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${manufacturerInstance?.vehicles?}" var="v">
    <li><g:link controller="vehicle" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="vehicle" action="create" params="['manufacturer.id': manufacturerInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'vehicle.label', default: 'Vehicle')])}</g:link>
</li>
</ul>


</div>

