<%@ page import="insurance.User" %>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'sellers', 'error')} ">
    %{--@declare id="sellers"--}%<label for="sellers">
        <g:message code="user.sellers.label" default="Sellers" />

    </label>

    <ul class="one-to-many">
           <g:each in="${userInstance?.sellers?}" var="c">
        <li><g:link controller="seller" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
            </g:each>
        <li></li>

        %{--<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'seller', 'error')} required">--}%
            %{--<label for="seller">--}%
                %{--<g:message code="person.seller.label" default="Seller" />--}%
                %{--<span class="required-indicator">*</span>--}%
            %{--</label>--}%
            %{--<g:select id="seller" name="seller.id"--}%
                      %{--from="${insurance.User.list().findAll {--}%
                          %{--it.hasRole('ROLE_SELLER')--}%
                      %{--}}" optionKey="id" required=""--}%
                      %{--value="${personInstance?.seller?.id}" class="many-to-one"/>--}%
        %{--</div>--}%


        <li class="add">
            <g:link controller="user" action="edit_2" params="['user.id': userInstance?.id]">Add seller</g:link>
            %{--<a href="../edit_2.gsp">Add seller</a>--}%
            %{--<g:link controller="user" action="addClientToManader" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'client.label', default: 'Seller')])}</g:link>--}%
        </li>
    </ul>


</div>