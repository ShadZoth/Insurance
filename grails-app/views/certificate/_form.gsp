<%@ page import="insurance.Certificate" %>


%{--Выбор ТС. Название пункта содержит ссылку на создание ТС.--}%
<div class="fieldcontain ${hasErrors(bean: certificateInstance, field: 'vehicle', 'error')} required">
    <label for="vehicle">
        <a href="../vehicle/create.gsp"><g:message code="accident.vehicle.label" default="Vehicle" /></a>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="vehicle" name="vehicle.id" from="${insurance.Vehicle.list()}" optionKey="id" required="" value="${certificateInstance?.vehicle?.id}" class="many-to-one"/>

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

%{--Форма, имя владельца--}%
<div class="fieldcontain ${hasErrors(bean: certificateInstance, field: 'ownerFirstName', 'error')} required">
	<label for="ownerFirstName">
		<g:message code="certificate.ownerFirstName.label" default="Owner First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="ownerFirstName" maxlength="30" required="" value="${certificateInstance?.ownerFirstName}"/>

</div>

%{--Форма, фамилия владельца--}%
<div class="fieldcontain ${hasErrors(bean: certificateInstance, field: 'ownerLastName', 'error')} required">
	<label for="ownerLastName">
		<g:message code="certificate.ownerLastName.label" default="Owner Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="ownerLastName" maxlength="30" required="" value="${certificateInstance?.ownerLastName}"/>

</div>

%{--Форма, VIN-код ТС--}%
<div class="fieldcontain ${hasErrors(bean: certificateInstance, field: 'vin', 'error')} required">
	<label for="vin">
		<g:message code="certificate.vin.label" default="Vin" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="vin" maxlength="17" required="" value="${certificateInstance?.vin}"/>

</div>

