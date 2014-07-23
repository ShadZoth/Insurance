<%@ page import="insurance.License" %>


%{--Выбор клиента. Название пункта содержит ссылку на создание клиента.--}%
<div class="fieldcontain ${hasErrors(bean: licenseInstance, field: 'owner', 'error')} required">
    <label for="owner">
        <a href="../person/create.gsp"><g:message code="license.owner.label" default="Owner"/></a>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="owner" name="owner.id" from="${insurance.Person.list()}" optionKey="id" required=""
              value="${licensePersonId ?: (licenseInstance?.owner?.id)}"
              class="many-to-one"/>

</div>

%{--Форма, номер прав.--}%
<div class="fieldcontain ${hasErrors(bean: licenseInstance, field: 'number', 'error')} required">
    <label for="number">
        <g:message code="license.number.label" default="Number"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="number" required="" value="${licenseInstance?.number}"/>

</div>

%{--Выбор даты, дата выдачи--}%
<div class="fieldcontain ${hasErrors(bean: licenseInstance, field: 'issueDate', 'error')} required">
    <label for="issueDate">
        <g:message code="license.issueDate.label" default="Issue Date"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="issueDate" precision="day" value="${licenseInstance?.issueDate}"/>

</div>

%{-------------------------Чекбоксы. Категории прав------------------------------------------}%
%{--TODO: сделать в строчку чекбоксы--}%

<div>
    <div class="fieldcontain ${hasErrors(bean: licenseInstance, field: 'a', 'error')} ">
        <label for="a">
            <g:message code="license.a.label" default="A"/>

        </label>
        <g:checkBox name="a" value="${licenseInstance?.a}"/>

    </div>
    <div class="fieldcontain ${hasErrors(bean: licenseInstance, field: 'b', 'error')} ">
        <label for="b">
            <g:message code="license.b.label" default="B"/>

        </label>
        <g:checkBox name="b" value="${licenseInstance?.b}"/>

    </div>
    <div class="fieldcontain ${hasErrors(bean: licenseInstance, field: 'c', 'error')} ">
        <label for="c">
            <g:message code="license.c.label" default="C"/>

        </label>
        <g:checkBox name="c" value="${licenseInstance?.c}"/>

    </div>
    <div class="fieldcontain ${hasErrors(bean: licenseInstance, field: 'd', 'error')} ">
        <label for="d">
            <g:message code="license.d.label" default="D"/>

        </label>
        <g:checkBox name="d" value="${licenseInstance?.d}"/>

    </div>
    <div class="fieldcontain ${hasErrors(bean: licenseInstance, field: 'e', 'error')} ">
        <label for="e">
            <g:message code="license.e.label" default="E"/>

        </label>
        <g:checkBox name="e" value="${licenseInstance?.e}"/>

    </div>
    <div class="fieldcontain ${hasErrors(bean: licenseInstance, field: 'tb', 'error')} ">
        <label for="tb">
            <g:message code="license.tb.label" default="Tb"/>

        </label>
        <g:checkBox name="tb" value="${licenseInstance?.tb}"/>

    </div>
    <div class="fieldcontain ${hasErrors(bean: licenseInstance, field: 'tm', 'error')} ">
        <label for="tm">
            <g:message code="license.tm.label" default="Tm"/>

        </label>
        <g:checkBox name="tm" value="${licenseInstance?.tm}"/>
    </div>
</div>
