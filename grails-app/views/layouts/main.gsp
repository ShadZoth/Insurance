<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
    %{--Шрифт--}%
    <link href='http://fonts.googleapis.com/css?family=Lora&subset=latin,cyrillic' rel='stylesheet' type='text/css'>
    <g:layoutHead/>
    <g:javascript library="application"/>
    <r:layoutResources/>
</head>

<body>
<div id="header">
    <div id="grailsLogo" role="banner">
        <a class="home" href="${createLink(uri: '/')}">
            <img src="${resource(dir: 'images', file: 'logo.png')}" alt="Grails"/>
        </a>
    </div>

    <div id="companyName">
        <H1 align=center>Страховая компания %companyname%</H1>
    </div>

    <div id="login_Form">
        <sec:ifNotLoggedIn>
        %{--<H2 align=center>Login Form</H2>--}%
            <g:form id='loginForm' url="/Insurance/j_spring_security_check" method='POST'>
                <div id="login_fields">
                    <p><input type="text" name='j_username' id='username' placeholder="Логин"/></p>

                    <p><input type="password" placeholder="Пароль" name='j_password' id='password'/></p>
                </div>

                <div id="login_buttons">
                    <p><input type="submit" id="submit" value='Войти'/></p>

                    <p id="remember_me_holder">
                        <input type='checkbox' class='chk' name='${rememberMeParameter}'
                               id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
                        <label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
                    </p>
                </div>
            </g:form>

        </sec:ifNotLoggedIn>
        <sec:ifLoggedIn>
            <div id="logout">
                <p>Logged in as <sec:username/> (<g:link controller='logout'>Logout</g:link>)</p>
            </div>
        </sec:ifLoggedIn>
    </div>
</div>

<div id="search_string">
    <div id="navigation_bar">
        <sec:ifAllGranted roles="ROLE_SELLER">
            <ul id="menu">
                <li><g:link action="index" controller="warrant">Мои продажи</g:link></li>
                <li>
                    <g:link action="index" controller="client">Мои клиенты</g:link>
                    <ul>
                        <li><g:link action="index" controller="person">Физические лица</g:link></li>
                        <li><g:link action="index" controller="company">Юридические лица</g:link></li>
                    </ul>
                </li>
            </ul>
        </sec:ifAllGranted>
        <g:form id="searchableForm" name="searchableForm" method="get" controller="searchable" action="index">
            <input id="search_button" type="submit" value="Найти">
            <input id="querySearch" type="text" size="50" placeholder="Поиск..." name="q">
        </g:form>
    </div>
</div>



<g:layoutBody/>
<div class="footer" role="contentinfo"></div>

%{--<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>--}%
<r:layoutResources/>
</body>
</html>
