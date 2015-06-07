<%@ page import="org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils; insurance.Company" %>

%{--Список продавцов, доступно только админу--}%
<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'dispatcher', 'error')} required">
	<label for="dispatcher">
		<g:message code="company.dispatcher.label" default="Dispatcher" />
		<span class="required-indicator">*</span>
	</label>
    <g:usersHavingRole role="ROLE_DISPATCHER" id="dispatcher" name="dispatcher.id"
                       optionKey="id" required=""
                       onlyMe="${SpringSecurityUtils.ifAnyGranted('ROLE_DISPATCHER')}"
                           value="${companyInstance?.dispatcher?.id}" class="many-to-one"/>
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


