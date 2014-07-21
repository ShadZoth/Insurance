<%@ page import="org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils; insurance.User; org.springframework.security.core.context.SecurityContextHolder; insurance.Warrant" %>


%{--Выбор клиента--}%

    <div class="fieldcontain ${hasErrors(bean: warrantInstance, field: 'client', 'error')} required">
        <label for="client">
            <g:message code="warrant.client.label" default="Client"/>
            <span class="required-indicator">*</span>
        </label>
        <g:select id="client" name="client.id" from="${myClientList?:(insurance.Client.list())}"
                  optionKey="id" required=""
                  value="${warrantClientId ?: (warrantInstance?.client?.id)}"
                  class="many-to-one"/>

    </div>


%{--Выбор продукта (не нужно)--}%
%{--<div class="fieldcontain ${hasErrors(bean: warrantInstance, field: 'product', 'error')} required">--}%
%{--<label for="product">--}%
%{--<g:message code="warrant.product.label" default="Product" />--}%
%{--<span class="required-indicator">*</span>--}%
%{--</label>--}%
%{--<g:select id="product" name="product.id" from="${insurance.Product.list()}" optionKey="id" required="" value="${warrantInstance?.product?.id}" class="many-to-one"/>--}%

%{--</div>--}%

<div class="fieldcontain ${hasErrors(bean: warrantInstance, field: 'issueDate', 'error')} required">
    <label for="issueDate">
        <g:message code="warrant.issueDate.label" default="Issue Date"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="issueDate" precision="day"
                  value="${warrantInstance?.issueDate}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: warrantInstance, field: 'expireDate', 'error')} required">
    <label for="expireDate">
        <g:message code="warrant.expireDate.label" default="Expire Date"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="expireDate" precision="day"
                  value="${warrantInstance?.expireDate}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: warrantInstance, field: 'price', 'error')} required">
    <label for="price">
        <g:message code="warrant.price.label" default="Price"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="price"
             value="${fieldValue(bean: warrantInstance, field: 'price')}"
             required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: warrantInstance, field: 'payments', 'error')} ">
    <label for="payments">
        <g:message code="warrant.payments.label" default="Payments"/>

    </label>

    <ul class="one-to-many">
        <g:each in="${warrantInstance?.payments ?}" var="p">
            <li><g:link controller="payment" action="show"
                        id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
        </g:each>
        <li class="add">
            <g:link controller="payment" action="create"
                    params="['warrant.id': warrantInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'payment.label', default: 'Payment')])}</g:link>
        </li>
    </ul>

</div>

<div class="fieldcontain ${hasErrors(bean: warrantInstance, field: 'product', 'error')} required">
    <label for="product">
        <g:message code="warrant.product.label" default="Product"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="product" name="product.id" from="${insurance.Product.list()}"
              optionKey="id" required="" value="${warrantInstance?.product?.id}"
              class="many-to-one"/>

</div>


