<%@ page import="insurance.Person" %>

%{--Продавец--}%
%{--Виден только администратору--}%
<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'seller', 'error')} required">
    <label for="seller">
        <g:message code="person.seller.label" default="Seller"/>
        <span class="required-indicator">*</span>
    </label>
    <g:usersHavingRole id="seller" name="seller.id" role="ROLE_SELLER"
                       onlyMe="${org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils.ifAnyGranted('ROLE_SELLER')}"
                       optionKey="id" required=""
                       value="${personInstance?.seller?.id}"
                       class="many-to-one"/>
</div>