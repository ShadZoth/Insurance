<%@ page import="insurance.Product" %>


%{--Форма, наименование продукта--}%
<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'name', 'error')} required">
    <label for="name">
        <g:message code="product.name.label" default="Name"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="name" required="" value="${productInstance?.name}"/>

</div>


%{------------------------------Чекбоксы, Корпоративный/Индивидуальный----------------------------------------}%
%{--Корпоративный--}%
<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'corporate', 'error')} ">
    <label for="corporate">
        <g:message code="product.corporate.label" default="Corporate"/>

    </label>
    <g:checkBox name="corporate" value="${productInstance?.corporate}"/>

</div>
%{--Индивидуальный--}%
<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'individual', 'error')} ">
    <label for="individual">
        <g:message code="product.individual.label" default="Individual"/>

    </label>
    <g:checkBox name="individual" value="${productInstance?.individual}"/>

</div>

