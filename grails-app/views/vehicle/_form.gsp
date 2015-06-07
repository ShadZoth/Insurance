<%@ page import="insurance.Vehicle" %>

<div class="fieldcontain ${hasErrors(bean: vehicleInstance, field: 'owner', 'error')} required">
	<label for="owner">
		<g:message code="vehicle.owner.label" default="Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="owner" name="owner.id" from="${insurance.Driver.list()}" optionKey="id" required="" value="${vehicleInstance?.owner?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vehicleInstance, field: 'manufacturer', 'error')} required">
	<label for="manufacturer">
		<g:message code="vehicle.manufacturer.label" default="Manufacturer" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="manufacturer" name="manufacturer.id" from="${insurance.Manufacturer.list()}" optionKey="id" required="" value="${vehicleInstance?.manufacturer?.id}" class="many-to-one"/>

</div>


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

<div class="fieldcontain ${hasErrors(bean: vehicleInstance, field: 'category', 'error')} required">
	<label for="category">
		<g:message code="vehicle.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="category" from="${insurance.Category?.values()}" keys="${insurance.Category.values()*.name()}" required="" value="${vehicleInstance?.category?.name()}" />

</div>