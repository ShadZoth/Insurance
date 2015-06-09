<%@ page import="insurance.Vehicle" %>



<div class="fieldcontain ${hasErrors(bean: vehicleInstance, field: 'model', 'error')} required">
	<label for="model">
		<g:message code="vehicle.model.label" default="Model" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="model" maxlength="30" required="" value="${vehicleInstance?.model}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vehicleInstance, field: 'year', 'error')} required">
	<label for="year">
		<g:message code="vehicle.year.label" default="Year" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="year" type="number" min="1900" max="2015" value="${vehicleInstance.year}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: vehicleInstance, field: 'manufacturer', 'error')} required">
	<label for="manufacturer">
		<g:message code="vehicle.manufacturer.label" default="Manufacturer" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="manufacturer" name="manufacturer.id" from="${insurance.Manufacturer.list()}" optionKey="id" required="" value="${vehicleInstance?.manufacturer?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vehicleInstance, field: 'owner', 'error')} required">
	<label for="owner">
		<g:message code="vehicle.owner.label" default="Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="owner" name="owner.id" from="${insurance.Driver.list()}" optionKey="id" required="" value="${vehicleInstance?.owner?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vehicleInstance, field: 'certificates', 'error')} ">
	<label for="certificates">
		<g:message code="vehicle.certificates.label" default="Certificates" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${vehicleInstance?.certificates?}" var="c">
    <li><g:link controller="certificate" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="certificate" action="create" params="['vehicle.id': vehicleInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'certificate.label', default: 'Certificate')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: vehicleInstance, field: 'children', 'error')} ">
	<label for="children">
		<g:message code="vehicle.children.label" default="Children" />
		
	</label>
	<g:checkBox name="children" value="${vehicleInstance?.children}" />

</div>

<div class="fieldcontain ${hasErrors(bean: vehicleInstance, field: 'conditioner', 'error')} ">
	<label for="conditioner">
		<g:message code="vehicle.conditioner.label" default="Conditioner" />
		
	</label>
	<g:checkBox name="conditioner" value="${vehicleInstance?.conditioner}" />

</div>

<div class="fieldcontain ${hasErrors(bean: vehicleInstance, field: 'disabled', 'error')} ">
	<label for="disabled">
		<g:message code="vehicle.disabled.label" default="Disabled" />
		
	</label>
	<g:checkBox name="disabled" value="${vehicleInstance?.disabled}" />

</div>

<div class="fieldcontain ${hasErrors(bean: vehicleInstance, field: 'hugeBack', 'error')} ">
	<label for="hugeBack">
		<g:message code="vehicle.hugeBack.label" default="Huge Back" />
		
	</label>
	<g:checkBox name="hugeBack" value="${vehicleInstance?.hugeBack}" />

</div>

<div class="fieldcontain ${hasErrors(bean: vehicleInstance, field: 'premium', 'error')} ">
	<label for="premium">
		<g:message code="vehicle.premium.label" default="Premium" />
		
	</label>
	<g:checkBox name="premium" value="${vehicleInstance?.premium}" />

</div>

<div class="fieldcontain ${hasErrors(bean: vehicleInstance, field: 'smoking', 'error')} ">
	<label for="smoking">
		<g:message code="vehicle.smoking.label" default="Smoking" />
		
	</label>
	<g:checkBox name="smoking" value="${vehicleInstance?.smoking}" />

</div>

<div class="fieldcontain ${hasErrors(bean: vehicleInstance, field: 'van', 'error')} ">
	<label for="van">
		<g:message code="vehicle.van.label" default="Van" />
		
	</label>
	<g:checkBox name="van" value="${vehicleInstance?.van}" />

</div>

<div class="fieldcontain ${hasErrors(bean: vehicleInstance, field: 'vip', 'error')} ">
	<label for="vip">
		<g:message code="vehicle.vip.label" default="Vip" />
		
	</label>
	<g:checkBox name="vip" value="${vehicleInstance?.vip}" />

</div>

