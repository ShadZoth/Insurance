<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to Grails</title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'developer.css')}" type="text/css">
</head>

<body>
%{--<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
<sec:ifAnyGranted roles="ROLE_ADMIN">
<div id="page-body" role="main">
    <div id="controller-list" role="navigation">
        <h2><g:message code="dev.index.availcontrollers" default="Available Controllers: "/></h2>
        <ul>
            %{--TODO исправить: searchable отображается дважды--}%
            <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.name }}">
                <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.name}</g:link></li>
            </g:each>
        </ul>
    </div>
</div>

<div id="status" role="complementary">
    <h1><g:message code="dev.index.appstat" default="Application Status"/></h1>
    <ul>
        <li><g:message code="dev.index.appver" default="App version: "/><g:meta name="app.version"/></li>
        <li><g:message code="dev.index.grailsver" default="Grails version: "/><g:meta name="app.grails.version"/></li>
        <li><g:message code="dev.index.groovyver" default="Groovy version: "/>${GroovySystem.getVersion()}</li>
        <li><g:message code="dev.index.jvmver" default="JVM version: "/>${System.getProperty('java.version')}</li>
        <li><g:message code="dev.index.reloadingact" default="Reloading active: "/>${grails.util.Environment.reloadingAgentEnabled}</li>
        <li><g:message code="dev.index.controllers" default="Controllers: "/>${grailsApplication.controllerClasses.size()}</li>
        <li><g:message code="dev.index.domails" default="Domains: "/>${grailsApplication.domainClasses.size()}</li>
        <li><g:message code="dev.index.services" default="Services: "/>${grailsApplication.serviceClasses.size()}</li>
        <li><g:message code="dev.index.taglibs" default="Tag Libraries: "/>${grailsApplication.tagLibClasses.size()}</li>
    </ul>

    <h1><g:message code="dev.index.instplugs" default="Installed Plugins"/></h1>
    <ul>
        <g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
            <li>${plugin.name} - ${plugin.version}</li>
        </g:each>
    </ul>
</div>
</sec:ifAnyGranted>
</body>
</html>
