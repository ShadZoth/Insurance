<%@ page import="insurance.Contact" %>


%{--Форма, значение контакта--}%
<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'value', 'error')} required">
	<label for="value">
		<g:message code="contact.value.label" default="Value" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="value" required="" value="${contactInstance?.value}"/>

</div>

%{--Выбор клиента. Название пункта содержит ссылку на создание клиента.--}%
<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'client', 'error')} required">
	<label for="client">
        <a href="../person/create.gsp"><g:message code="contact.client.label" default="Client" /></a>
		<span class="required-indicator">*</span>
	</label>
    <g:select id="client" name="client.id" from="${insurance.Client.list()}"
              optionKey="id" required=""
              value="${contactClientId ?: (contactInstance?.client?.id)}"
              class="many-to-one"/>

</div>

%{--Список enum, тип контакта.--}%
<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="contact.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="type" from="${insurance.Contact$ContactType?.values()}" keys="${insurance.Contact$ContactType.values()*.name()}" required="" value="${contactInstance?.type?.name()}" />

</div>

