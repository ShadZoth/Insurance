<%@ page import="insurance.Passport" %>



<div class="fieldcontain ${hasErrors(bean: passportInstance, field: 'number', 'error')} required">
	<label for="number">
		<g:message code="passport.number.label" default="Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="number" required="" value="${passportInstance?.number}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: passportInstance, field: 'driver', 'error')} required">
	<label for="person">
		<g:message code="passport.person.label" default="Person" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="person" name="person.id" from="${insurance.Driver.list()}" optionKey="id" required="" value="${passportInstance?.person?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: passportInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="passport.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" maxlength="40" required="" value="${passportInstance?.lastName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: passportInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="passport.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" maxlength="40" required="" value="${passportInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: passportInstance, field: 'fathName', 'error')} ">
	<label for="fathName">
		<g:message code="passport.fathName.label" default="Fath Name" />
		
	</label>
	<g:textField name="fathName" maxlength="40" value="${passportInstance?.fathName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: passportInstance, field: 'birthDate', 'error')} required">
	<label for="birthDate">
		<g:message code="passport.birthDate.label" default="Birth Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="birthDate" precision="day"  value="${passportInstance?.birthDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: passportInstance, field: 'sex', 'error')} required">
	<label for="sex">
		<g:message code="passport.sex.label" default="Sex" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="sex" from="${insurance.Passport$Sex?.values()}" keys="${insurance.Passport$Sex.values()*.name()}" required="" value="${passportInstance?.sex?.name()}" />

</div>

<div class="fieldcontain ${hasErrors(bean: passportInstance, field: 'issueDate', 'error')} required">
	<label for="issueDate">
		<g:message code="passport.issueDate.label" default="Issue Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="issueDate" precision="day"  value="${passportInstance?.issueDate}"  />

</div>

