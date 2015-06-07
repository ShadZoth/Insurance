<%@ page import="org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils; insurance.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
    <label for="username">
        <g:message code="user.username.label" default="Username"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="username" required="" value="${userInstance?.username}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
    <label for="password">
        <g:message code="user.password.label" default="Password"/>
        <span class="required-indicator">*</span>
    </label>
    <g:passwordField name="password" required="" value=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'authority', 'error')} required">
    <label for="authority">
        <g:message code="user.authority.label" default="Authority"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select name="authority"
              from="${userInstance.constraints.authority.inList.findAll {
                  return org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils.ifAnyGranted("ROLE_MANAGER") ? it.equals("ROLE_DISPATCHER") : true
              }}" required="" value="${userInstance?.authority}"
              valueMessagePrefix="user.authority"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountExpired', 'error')} ">
    <label for="accountExpired">
        <g:message code="user.accountExpired.label" default="Account Expired"/>

    </label>
    <g:checkBox name="accountExpired" value="${userInstance?.accountExpired}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountLocked', 'error')} ">
    <label for="accountLocked">
        <g:message code="user.accountLocked.label" default="Account Locked"/>

    </label>
    <g:checkBox name="accountLocked" value="${userInstance?.accountLocked}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'enabled', 'error')} ">
    <label for="enabled">
        <g:message code="user.enabled.label" default="Enabled"/>

    </label>
    <g:checkBox name="enabled" value="${userInstance?.enabled}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'passwordExpired', 'error')} ">
    <label for="passwordExpired">
        <g:message code="user.passwordExpired.label"
                   default="Password Expired"/>

    </label>
    <g:checkBox name="passwordExpired"
                value="${userInstance?.passwordExpired}"/>

</div>

