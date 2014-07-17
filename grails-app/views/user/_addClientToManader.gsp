<%@ page import="insurance.User" %>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'sellers', 'error')} ">
    <label for="sellers">
        <g:message code="user.sellers.label" default="Sellers" />

    </label>

    <ul class="one-to-many">
        <g:each in="${userInstance?.sellers?}" var="c">
            <li><g:link controller="seller" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
        </g:each>
        <li class="add">

            %{--<g:link controller="user" action="addClientToManader" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'client.label', default: 'Seller')])}</g:link>--}%
        </li>
    </ul>




</div>