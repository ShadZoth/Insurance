<%@ page import="insurance.Passport" %>
<%@ page import="insurance.Client" %>

%{--Продавец--}%
<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'seller', 'error')} required">
    <label for="seller">
        <g:message code="client.seller.label" default="Seller"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="seller" name="seller.id" from="${insurance.User.list().findAll { it.hasRole('ROLE_SELLER') }}"
              optionKey="id" required="" value="${clientInstance?.seller?.id}" class="many-to-one"/>
</div>

%{--Client--}%
%{--Выбор даты, >дата регистрации (тут временно и для примера, дата должна цепляться автоматом)--}%
<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'registrationDate', 'error')} required">
    <label for="registrationDate">
        <g:message code="client.registrationDate.label" default="Registration Date"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="registrationDate" precision="day" value="${clientInstance?.registrationDate}"/>
</div>

%{--Passport--}%
%{--Форма, номер паспорта.--}%
<div class="fieldcontain ${hasErrors(bean: passportInstance, field: 'number', 'error')} required">
    <label for="number">
        <g:message code="passport.number.label" default="Number"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="number" required="" value="${passportInstance?.number}"/>

</div>

%{--Выбор даты, когда выдан--}%
<div class="fieldcontain ${hasErrors(bean: passportInstance, field: 'issueDate', 'error')} required">
    <label for="issueDate">
        <g:message code="passport.issueDate.label" default="Issue Date"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="issueDate" precision="day" value="${passportInstance?.issueDate}"/>

</div>

%{--Форма, фамилия клиента--}%
<div class="fieldcontain ${hasErrors(bean: passportInstance, field: 'lastName', 'error')} required">
    <label for="lastName">
        <g:message code="passport.lastName.label" default="Last Name"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="lastName" maxlength="40" required="" value="${passportInstance?.lastName}"/>

</div>

%{--Форма, имя клиента--}%
<div class="fieldcontain ${hasErrors(bean: passportInstance, field: 'firstName', 'error')} required">
    <label for="firstName">
        <g:message code="passport.firstName.label" default="First Name"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="firstName" maxlength="40" required="" value="${passportInstance?.firstName}"/>

</div>

%{--Форма, отчество клиента--}%
<div class="fieldcontain" ${hasErrors(bean: passportInstance, field: 'fathName', 'error')} required">
<label for="fathName">
    <g:message code="passport.fathName.label" default="Fath Name"/>
    <span class="required-indicator">*</span>
</label>
<g:textField name="fathName" maxlength="40" required="" value="${passportInstance?.lastName}"/>

</div>

%{--Выбор даты, дата рождения--}%
<div class="fieldcontain ${hasErrors(bean: passportInstance, field: 'birthDate', 'error')} required">
    <label for="birthDate">
        <g:message code="passport.birthDate.label" default="Birth Date"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="birthDate" precision="day" value="${passportInstance?.birthDate}"/>

</div>

%{--Список enum, пол--}%
<div class="fieldcontain ${hasErrors(bean: passportInstance, field: 'sex', 'error')} required">
    <label for="sex">
        <g:message code="passport.sex.label" default="Sex"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select name="sex" from="${insurance.Passport$Sex?.values()}" keys="${insurance.Passport$Sex.values()*.name()}"
              required="" value="${passportInstance?.sex?.name()}"/>

</div>

</%@ page import="insurance.Passport" %>
<%@ page import="insurance.Client" %>