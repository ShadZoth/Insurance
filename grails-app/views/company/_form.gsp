<%@ page import="org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils; insurance.Company" %>


%{--Выбор даты, дата регистрации--}%
<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'registrationDate', 'error')} required">
	<label for="registrationDate">
		<g:message code="company.registrationDate.label" default="Registration Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="registrationDate" precision="day"  value="${companyInstance?.registrationDate}"  />

</div>

%{--Список продавцов, доступно только админу--}%
<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'seller', 'error')} required">
	<label for="seller">
		<g:message code="company.seller.label" default="Seller" />
		<span class="required-indicator">*</span>
	</label>
    <g:usersHavingRole role="ROLE_SELLER" id="seller" name="seller.id"
                       optionKey="id" required=""
                       onlyMe="${SpringSecurityUtils.ifAnyGranted('ROLE_SELLER')}"
                           value="${companyInstance?.seller?.id}" class="many-to-one"/>
</div>

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


