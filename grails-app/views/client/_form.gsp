<%@ page import="insurance.Client" %>


%{--Выбор даты, дата регистрации--}%
<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'registrationDate', 'error')} required">
    <label for="registrationDate">
        <g:message code="client.registrationDate.label" default="Registration Date"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="registrationDate" precision="day" value="${clientInstance?.registrationDate}"/>

</div>

%{--Чекбокс, в архиве (не нужен)--}%
%{--<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'archived', 'error')} ">--}%
    %{--<label for="archived">--}%
        %{--<g:message code="client.archived.label" default="Archived"/>--}%

    %{--</label>--}%
    %{--<g:checkBox name="archived" value="${clientInstance?.archived}"/>--}%

%{--</div>--}%

%{----------------------Ссылки не нужны----------------------------------}%

%{--Добавление контактов--}%
<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'contacts', 'error')} ">
    <label for="contacts">
        <g:message code="client.contacts.label" default="Contacts"/>

    </label>

    <ul class="one-to-many">
        <g:each in="${clientInstance?.contacts ?}" var="c">
            <li><g:link controller="contact" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
        </g:each>
        <li class="add">
            <g:link controller="contact" action="create"
                    params="['client.id': clientInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'contact.label', default: 'Contact')])}</g:link>
        </li>
    </ul>

</div>

%{--Добавление ТС--}%
<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'vehicles', 'error')} ">
    <label for="vehicles">
        <g:message code="client.vehicles.label" default="Vehicles"/>

    </label>

    <ul class="one-to-many">
        <g:each in="${clientInstance?.vehicles ?}" var="v">
            <li><g:link controller="vehicle" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
        </g:each>
        <li class="add">
            <g:link controller="vehicle" action="create"
                    params="['client.id': clientInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'vehicle.label', default: 'Vehicle')])}</g:link>
        </li>
    </ul>

</div>

%{--Добавление страховок--}%
<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'warrants', 'error')} ">
    <label for="warrants">
        <g:message code="client.warrants.label" default="Warrants"/>

    </label>

    <ul class="one-to-many">
        <g:each in="${clientInstance?.warrants ?}" var="w">
            <li><g:link controller="warrant" action="show" id="${w.id}">${w?.encodeAsHTML()}</g:link></li>
        </g:each>
        <li class="add">
            <g:link controller="warrant" action="create"
                    params="['client.id': clientInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'warrant.label', default: 'Warrant')])}</g:link>
        </li>
    </ul>

</div>

