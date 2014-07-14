<%@ page import="insurance.Vehicle" %>


%{--Выбор владельца транспорта (ТС). Название пункта содержит ссылку на создание владельца.--}%
<div class="fieldcontain ${hasErrors(bean: vehicleInstance, field: 'owner', 'error')} required">
	<label for="owner">
        <a href="../person/create.gsp"><g:message code="vehicle.owner.label" default="Owner" /></a>
		<span class="required-indicator">*</span>
	</label>
	<g:select id="owner" name="owner.id" from="${insurance.Client.list()}" optionKey="id" required="" value="${vehicleInstance?.owner?.id}" class="many-to-one"/>
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

%{--Список, производитель (марка) ТС. Название пункта содержит ссылку на создание производителя.--}%
<div class="fieldcontain ${hasErrors(bean: vehicleInstance, field: 'manufacturer', 'error')} required">
	<label for="manufacturer">
        <a href="../manufacturer/create.gsp"><g:message code="vehicle.manufacturer.label" default="Manufacturer" /></a>
		<span class="required-indicator">*</span>
	</label>
	<g:select id="manufacturer" name="manufacturer.id" from="${insurance.Manufacturer.list()}" optionKey="id" required="" value="${vehicleInstance?.manufacturer?.id}" class="many-to-one"/>

</div>

%{--Ссылка на добавление ДТП--}%
<div class="fieldcontain ${hasErrors(bean: vehicleInstance, field: 'accidents', 'error')} ">
	<label for="accidents">
		<g:message code="vehicle.accidents.label" default="Accidents" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${vehicleInstance?.accidents?}" var="a">
    <li><g:link controller="accident" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="accident" action="create" params="['vehicle.id': vehicleInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'accident.label', default: 'Accident')])}</g:link>
</li>
</ul>


</div>

%{--Ссылка на добавление сертификатов ТС--}%
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

