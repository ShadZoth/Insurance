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
	<g:datePicker name="expectedStartTime" precision="minute"  value="${serviceInstance?.expectedStartTime}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: serviceInstance, field: 'addressStart', 'error')} required">
	<label for="addressStart">
		<g:message code="service.addressStart.label" default="Address Start" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="addressStart" required="" value="${serviceInstance?.addressStart}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: serviceInstance, field: 'driver', 'error')} ">
	<label for="driver">
		<g:message code="service.driver.label" default="Driver" />
		
	</label>
	<g:select id="driver" name="driver.id" from="${serviceInstance.getValidDrivers()}" optionKey="id" value="${serviceInstance?.driver?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: serviceInstance, field: 'otherCompany', 'error')} ">
	<label for="otherCompany">
		<g:message code="service.otherCompany.label" default="Other Company" />
		
	</label>
	<g:select id="otherCompany" name="otherCompany.id" from="${insurance.Company.list()}" optionKey="id" value="${serviceInstance?.otherCompany?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: serviceInstance, field: 'realStartTime', 'error')} ">
	<label for="realStartTime">
		<g:message code="service.realStartTime.label" default="Real Start Time" />
		
	</label>
	<g:datePicker name="realStartTime" precision="minute"  value="${serviceInstance?.realStartTime}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: serviceInstance, field: 'endTime', 'error')} ">
	<label for="endTime">
		<g:message code="service.endTime.label" default="End Time" />
		
	</label>
	<g:datePicker name="endTime" precision="minute"  value="${serviceInstance?.endTime}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: serviceInstance, field: 'addressEnd', 'error')} required">
	<label for="addressEnd">
		<g:message code="service.addressEnd.label" default="Address End" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="addressEnd" required="" value="${serviceInstance?.addressEnd}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: serviceInstance, field: 'children', 'error')} ">
	<label for="children">
		<g:message code="service.children.label" default="Children" />
		
	</label>
	<g:checkBox name="children" value="${serviceInstance?.children}" />

</div>

<div class="fieldcontain ${hasErrors(bean: serviceInstance, field: 'conditioner', 'error')} ">
	<label for="conditioner">
		<g:message code="service.conditioner.label" default="Conditioner" />
		
	</label>
	<g:checkBox name="conditioner" value="${serviceInstance?.conditioner}" />

</div>

<div class="fieldcontain ${hasErrors(bean: serviceInstance, field: 'disabled', 'error')} ">
	<label for="disabled">
		<g:message code="service.disabled.label" default="Disabled" />
		
	</label>
	<g:checkBox name="disabled" value="${serviceInstance?.disabled}" />

</div>

<div class="fieldcontain ${hasErrors(bean: serviceInstance, field: 'hugeBack', 'error')} ">
	<label for="hugeBack">
		<g:message code="service.hugeBack.label" default="Huge Back" />
		
	</label>
	<g:checkBox name="hugeBack" value="${serviceInstance?.hugeBack}" />

</div>

<div class="fieldcontain ${hasErrors(bean: serviceInstance, field: 'premium', 'error')} ">
	<label for="premium">
		<g:message code="service.premium.label" default="Premium" />
		
	</label>
	<g:checkBox name="premium" value="${serviceInstance?.premium}" />

</div>

<div class="fieldcontain ${hasErrors(bean: serviceInstance, field: 'smoking', 'error')} ">
	<label for="smoking">
		<g:message code="service.smoking.label" default="Smoking" />
		
	</label>
	<g:checkBox name="smoking" value="${serviceInstance?.smoking}" />

</div>

<div class="fieldcontain ${hasErrors(bean: serviceInstance, field: 'van', 'error')} ">
	<label for="van">
		<g:message code="service.van.label" default="Van" />
		
	</label>
	<g:checkBox name="van" value="${serviceInstance?.van}" />

</div>

<div class="fieldcontain ${hasErrors(bean: serviceInstance, field: 'vip', 'error')} ">
	<label for="vip">
		<g:message code="service.vip.label" default="Vip" />
		
	</label>
	<g:checkBox name="vip" value="${serviceInstance?.vip}" />

</div>

