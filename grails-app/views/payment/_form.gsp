<%@ page import="insurance.Payment" %>


%{--Выбор даты, дата платежа--}%
<div class="fieldcontain ${hasErrors(bean: paymentInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="payment.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${paymentInstance?.date}"  />

</div>

%{--Форма, сумма платежа--}%
<div class="fieldcontain ${hasErrors(bean: paymentInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="payment.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amount" value="${fieldValue(bean: paymentInstance, field: 'amount')}" required=""/>

</div>

%{--Выбор ДТП. Название пункта содержит ссылку на создание ДТП.--}%
<div class="fieldcontain ${hasErrors(bean: paymentInstance, field: 'accident', 'error')} required">
	<label for="accident">
		<a href="../accident/create.gsp"><g:message code="payment.accident.label" default="Accident" /></a>
		<span class="required-indicator">*</span>
	</label>
    <g:select id="accident" name="accident.id"
              from="${insurance.Accident.list()}" optionKey="id" required=""
              value="${paymentAccidentId ?: (paymentInstance?.accident?.id)}"
              class="many-to-one"/>

</div>

%{--Выбор страховки. Название пункта содержит ссылку на создание страховки.--}%
<div class="fieldcontain ${hasErrors(bean: paymentInstance, field: 'warrant', 'error')} required">
	<label for="warrant">
		<a href="../warrant/create.gsp"><g:message code="payment.warrant.label" default="Warrant" /></a>
		<span class="required-indicator">*</span>
	</label>
    <g:select id="warrant" name="warrant.id" from="${insurance.Warrant.list()}"
              optionKey="id" required=""
              value="${paymentWarrantId ?: (paymentInstance?.warrant?.id)}"
              class="many-to-one"/>

</div>

