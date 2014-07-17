<%@ page import="insurance.Vehicle" %>
<%@ page import="insurance.Certificate" %>

%{--Выбор владельца транспорта (ТС). Название пункта содержит ссылку на создание владельца.--}%
<div class="fieldcontain ${hasErrors(bean: vehicleInstance, field: 'owner', 'error')} required">
	<label for="owner">
        <g:message code="vehicle.owner.label" default="Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="owner" name="owner.id" from="${insurance.Client.list()}" optionKey="id" required="" value="${vehicleInstance?.owner?.id}" class="many-to-one"/>
</div>

%{--Список, производитель (марка) ТС. --}%
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
	<g:field name="price" value="${fieldValue(bean: vehicleInstance, field: 'price')}" required=""/>

</div>

%{--Список, категория ТС--}%
<div class="fieldcontain ${hasErrors(bean: vehicleInstance, field: 'category', 'error')} required">
	<label for="category">
		<g:message code="vehicle.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="category" from="${insurance.Category?.values()}" keys="${insurance.Category.values()*.name()}" required="" value="${vehicleInstance?.category?.name()}" />

</div>

%{--Форма, номер сертификата--}%
<div class="fieldcontain ${hasErrors(bean: certificateInstance, field: 'number', 'error')} required">
    <label for="number">
        <g:message code="certificate.number.label" default="Number" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="number" required="" value="${certificateInstance?.number}"/>

</div>

%{--Форма, цвет.--}%
<div class="fieldcontain ${hasErrors(bean: certificateInstance, field: 'color', 'error')} ">
    <label for="color">
        <g:message code="certificate.color.label" default="Color" />

    </label>
    <g:textField name="color" maxlength="18" value="${certificateInstance?.color}"/>

</div>

%{--Выбор даты, дата выдачи--}%
<div class="fieldcontain ${hasErrors(bean: certificateInstance, field: 'issueDate', 'error')} required">
    <label for="issueDate">
        <g:message code="certificate.issueDate.label" default="Issue Date" />
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="issueDate" precision="day"  value="${certificateInstance?.issueDate}"  />

</div>

%{--Форма, VIN-код ТС--}%
<div class="fieldcontain ${hasErrors(bean: certificateInstance, field: 'vin', 'error')} required">
    <label for="vin">
        <g:message code="certificate.vin.label" default="Vin" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="vin" maxlength="17" required="" value="${certificateInstance?.vin}"/>

</div>

