<%@ page import="insurance.Accident" %>


%{--Выбор даты, дата проишествия--}%
<div class="fieldcontain ${hasErrors(bean: accidentInstance, field: 'dateTime', 'error')} required">
    <label for="dateTime">
        <g:message code="accident.dateTime.label" default="Date Time"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="dateTime" precision="day"
                  value="${accidentInstance?.dateTime}"/>

</div>

%{--Форма, коэффициент повреждений.--}%
<div class="fieldcontain ${hasErrors(bean: accidentInstance, field: 'damage', 'error')} required">
    <label for="damage">
        <g:message code="accident.damage.label" default="Damage"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="damage"
             value="${fieldValue(bean: accidentInstance, field: 'damage')}"
             required="" type=""/>

</div>

%{--Выбор ТС. Название пункта содержит ссылку на создание ТС.--}%
<div class="fieldcontain ${hasErrors(bean: accidentInstance, field: 'vehicle', 'error')} required">
    <label for="vehicle">
        <a href="../vehicle/create.gsp"><g:message code="accident.vehicle.label"
                                                   default="Vehicle"/></a>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="vehicle" name="vehicle.id" from="${insurance.Vehicle.list()}"
              optionKey="id" required=""
              value="${accidentVehicleId ?: (accidentInstance?.vehicle?.id)}"
              class="many-to-one"/>

</div>

