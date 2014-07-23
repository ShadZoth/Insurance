<%@ page import="insurance.Product; insurance.Price" %>


%{--Форма, наименование продукта--}%
<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="product.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${productInstance?.name}"/>

</div>


%{------------------------------Чекбоксы, Корпоративный/Индивидуальный----------------------------------------}%
%{--Корпоративный--}%
<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'corporate', 'error')} ">
	<label for="corporate">
		<g:message code="product.corporate.label" default="Corporate" />
		
	</label>
	<g:checkBox name="corporate" value="${productInstance?.corporate}" />

</div>
%{--Индивидуальный--}%
<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'individual', 'error')} ">
	<label for="individual">
		<g:message code="product.individual.label" default="Individual" />
		
	</label>
	<g:checkBox name="individual" value="${productInstance?.individual}" />

</div>


%{--Выбор даты, дата начала действия цены.--}%
<div class="fieldcontain ${hasErrors(bean: priceInstance, field: 'since', 'error')} required">
    <label for="since">
        <g:message code="price.since.label" default="Since" />
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="since" precision="day"  value="${priceInstance?.since}"  />

</div>

%{--Форма, значение суммы цены.--}%
<div class="fieldcontain ${hasErrors(bean: priceInstance, field: 'value', 'error')} required">
    <label for="value">
        <g:message code="price.value.label" default="Value" />
        <span class="required-indicator">*</span>
    </label>
    <g:field name="value" value="${fieldValue(bean: priceInstance, field: 'value')}" required="" type=""/>

</div>

