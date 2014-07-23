<!DOCTYPE html>
<html>
<head>
    <title>
        %{--TODO проверить--}%
        <g:if env="development"><g:message code="err.gre" default="Grails Runtime Exception"/></g:if>
        <g:else><g:message code="err.error" default="Error"/></g:else>
    </title>
    <meta name="layout" content="main">
    <g:if env="development"><link rel="stylesheet" href="${resource(dir: 'css', file: 'errors.css')}" type="text/css"></g:if>
</head>
<body>
<g:if env="development">
    <g:renderException exception="${exception}" />
</g:if>
<g:else>
    <ul class="errors">
        <li><g:message code="err.hasoccured" default="An error has occurred"/></li>
    </ul>
</g:else>
</body>
</html>
