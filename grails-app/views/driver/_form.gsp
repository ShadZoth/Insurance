<%@ page import="insurance.Driver" %>



<div class="fieldcontain ${hasErrors(bean: driverInstance, field: 'vehicle', 'error')} ">
	<label for="vehicle">
		<g:message code="driver.vehicle.label" default="Vehicle" />
		
	</label>
	<g:select id="vehicle" name="vehicle.id" from="${insurance.Vehicle.list()}" optionKey="id" value="${driverInstance?.vehicle?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: driverInstance, field: 'passports', 'error')} ">
	<label for="passports">
		<g:message code="driver.passports.label" default="Passports" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${driverInstance?.passports?}" var="p">
    <li><g:link controller="passport" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="passport" action="create" params="['driver.id': driverInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'passport.label', default: 'Passport')])}</g:link>
</li>
</ul>


</div>

