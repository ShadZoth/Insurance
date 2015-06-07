<%@ page import="insurance.Person" %>

%{--Продавец--}%
%{--Виден только администратору--}%
<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'dispatcher', 'error')} required">
    <label for="dispatcher">
        <g:message code="person.dispatcher.label" default="Dispatcher"/>
        <span class="required-indicator">*</span>
    </label>
    <g:usersHavingRole id="dispatcher" name="dispatcher.id" role="ROLE_DISPATCHER"
                       onlyMe="${org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils.ifAnyGranted('ROLE_DISPATCHER')}"
                       optionKey="id" required=""
                       value="${personInstance?.dispatcher?.id}"
                       class="many-to-one"/>
</div>