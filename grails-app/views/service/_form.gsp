<%@ page import="insurance.Service" %>



<div class="fieldcontain ${hasErrors(bean: serviceInstance, field: 'client', 'error')} required">
	<label for="client">
		<g:message code="service.client.label" default="Client" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="client" name="client.id" from="${insurance.Client.list()}" optionKey="id" required="" value="${serviceInstance?.client?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: serviceInstance, field: 'expectedStartTime', 'error')} required">
	<label for="expectedStartTime">
		<g:message code="service.expectedStartTime.label" default="Expected Start Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="expectedStartTime" precision="day"  value="${serviceInstance?.expectedStartTime}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: serviceInstance, field: 'addressStart', 'error')} required">
	<label for="addressStart">
		<g:message code="service.addressStart.label" default="Address Start" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="addressStart" required="" value="${serviceInstance?.addressStart}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: serviceInstance, field: 'addressEnd', 'error')} required">
	<label for="addressEnd">
		<g:message code="service.addressEnd.label" default="Address End" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="addressEnd" required="" value="${serviceInstance?.addressEnd}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: serviceInstance, field: 'driver', 'error')} required">
	<label for="driver">
		<g:message code="service.driver.label" default="Driver" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="driver" name="driver.id" from="${insurance.Driver.list()}" optionKey="id" required="" value="${serviceInstance?.driver?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: serviceInstance, field: 'endTime', 'error')} required">
	<label for="endTime">
		<g:message code="service.endTime.label" default="End Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="endTime" precision="day"  value="${serviceInstance?.endTime}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: serviceInstance, field: 'realStartTime', 'error')} required">
	<label for="realStartTime">
		<g:message code="service.realStartTime.label" default="Real Start Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="realStartTime" precision="day"  value="${serviceInstance?.realStartTime}"  />

</div>

