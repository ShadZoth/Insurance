<%@ page import="insurance.Company" %>


%{--Выбор даты, дата регистрации--}%
<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'registrationDate', 'error')} required">
	<label for="registrationDate">
		<g:message code="company.registrationDate.label" default="Registration Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="registrationDate" precision="day"  value="${companyInstance?.registrationDate}"  />

</div>

%{--Список продавцов, доступно только админу--}%
<sec:ifAnyGranted roles="ROLE_ADMIN">
<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'seller', 'error')} required">
	<label for="seller">
		<g:message code="company.seller.label" default="Seller" />
		<span class="required-indicator">*</span>
	</label>
    <g:select id="seller" name="seller.id"
              from="${insurance.User.list().findAll {
                  it.hasRole('ROLE_SELLER')
              }}" optionKey="id" required=""
              value="${companyInstance?.seller?.id}" class="many-to-one"/>

</div>
</sec:ifAnyGranted>

%{--Форма, Название компании--}%
<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="company.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="30" required="" value="${companyInstance?.name}"/>
</div>


%{--Форма, ИНН--}%
<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'inn', 'error')} required">
	<label for="inn">
		<g:message code="company.inn.label" default="Inn" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="inn" maxlength="12" required="" value="${companyInstance?.inn}"/>

</div>


