<%@ page import="insurance.Vehicle" %>

%{--Выбор владельца транспорта (ТС).--}%
<div class="fieldcontain ${hasErrors(bean: vehicleInstance, field: 'owner', 'error')} required">
	<label for="owner">
        <g:message code="vehicle.owner.label" default="Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="owner" name="owner.id" from="${insurance.Client.list()}" optionKey="id" required="" value="${vehicleClientId?:(vehicleInstance?.owner?.id)}" class="many-to-one"/>
</div>

%{--Список, производитель (марка) ТС.--}%
<div class="fieldcontain ${hasErrors(bean: vehicleInstance, field: 'manufacturer', 'error')} required">
    <label for="manufacturer">
        <g:message code="vehicle.manufacturer.label" default="Manufacturer" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="manufacturer" name="manufacturer.id" from="${insurance.Manufacturer.list()}" optionKey="id" required="" value="${vehicleInstance?.manufacturer?.id}" class="many-to-one"/>

</div>

%{--Форма, модель ТС--}%
<div class="fieldcontain ${hasErrors(bean: vehicleInstance, field: 'model', 'error')} required">
	<label for="model">
		<g:message code="vehicle.model.label" default="Model" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="model" maxlength="30" required="" value="${vehicleInstance?.model}"/>

</div>

%{--Форма со счетчиком, год выпуска ТС--}%
<div class="fieldcontain ${hasErrors(bean: vehicleInstance, field: 'year', 'error')} required">
	<label for="year">
		<g:message code="vehicle.year.label" default="Year" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="year" type="number" min="1900" value="${vehicleInstance.year}" required=""/>

</div>

%{--Форма, цена ТС--}%
<div class="fieldcontain ${hasErrors(bean: vehicleInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="vehicle.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price" value="${fieldValue(bean: vehicleInstance, field: 'price')}" required="" type=""/>

</div>

%{--Список, категория ТС--}%
<div class="fieldcontain ${hasErrors(bean: vehicleInstance, field: 'category', 'error')} required">
	<label for="category">
		<g:message code="vehicle.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="category" from="${insurance.Category?.values()}" keys="${insurance.Category.values()*.name()}" required="" value="${vehicleInstance?.category?.name()}" />

</div>