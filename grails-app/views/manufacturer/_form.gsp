<%@ page import="insurance.Manufacturer" %>


%{--Форма, название производителя--}%
<div class="fieldcontain ${hasErrors(bean: manufacturerInstance, field: 'name', 'error')} required">
    <label for="name">
        <g:message code="manufacturer.name.label" default="Name"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="name" maxlength="30" required=""
                 value="${manufacturerInstance?.name}"/>

</div>

