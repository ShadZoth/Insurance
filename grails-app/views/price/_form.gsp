<%@ page import="insurance.Price" %>


%{--Список, выбор продукта. Название пункта содержит ссылку на создание продукта.--}%
<div class="fieldcontain ${hasErrors(bean: priceInstance, field: 'product', 'error')} required">
	<label for="product">
        <a href="../product/create.gsp"><g:message code="price.product.label" default="Product" /></a>
		<span class="required-indicator">*</span>
	</label>
    <g:select id="product" name="product.id" from="${insurance.Product.list()}"
              optionKey="id" required=""
              value="${priceProductId ?: (priceInstance?.product?.id)}"
              class="many-to-one"/>

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
	<g:field name="value" value="${fieldValue(bean: priceInstance, field: 'value')}" required=""/>

</div>

