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
%{--Заголовок--}%
<div id="header">
    %{--Логотиип--}%
    <div id="grailsLogo" role="banner">
        <a class="home" href="${createLink(uri: '/')}">
            <img src="${resource(dir: 'images', file: 'logo.png')}" alt="Grails"/>
        </a>
    </div>

    %{--Название компании--}%
    <div id="companyName">
        <H1 align=center>Страховая компания %companyname%</H1>
    </div>

    %{--Когда не залогинены--}%
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

    %{--Когода залогинены--}%
        <sec:ifLoggedIn>
            <div id="logout">
                <p>Вы вошли как <sec:username/>
                (<g:link controller='logout'>
                    <g:message code="springSecurity.logout.button" default="Exit"/>
                </g:link>)
                </p>

                <sec:ifAllGranted roles="ROLE_ADMIN">
                    <p><g:message code="role.admin" default="Admin"/></p>
                </sec:ifAllGranted>

                <sec:ifAllGranted roles="ROLE_MANAGER">
                    <p><g:message code="role.manager" default="Manager"/></p>
                </sec:ifAllGranted>

                <sec:ifAllGranted roles="ROLE_SELLER">
                    <p><g:message code="role.seller" default="Seller"/></p>
                </sec:ifAllGranted>

                <sec:ifAllGranted roles="ROLE_CALL_CENTER">
                    <p><g:message code="role.call-center" default="Call-center"/></p>
                </sec:ifAllGranted>
            </div>
        </sec:ifLoggedIn>

    %{--Выбор языка--}%
        <div id="lang">
            <a href="${createLink(uri: '#')}">
                <img width="25" height="20" src="${resource(dir: 'images', file: 'en.png')}" alt="eng"/>
            </a>
            <a href="${createLink(uri: '#')}">
                <img width="25" height="20" src="${resource(dir: 'images', file: 'rus.png')}" alt="rus"/>
            </a>

        </div>
    </div>
</div>

%{--Строка поиска и меню--}%
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
        <sec:ifAllGranted roles="ROLE_MANAGER">
            <ul id="menu">
                <li><g:link action="index" controller="user">Подчиненные</g:link></li>
                <li>
                    <g:link action="index" controller="client">Клиенты</g:link>
                    <ul>
                        <li><g:link action="index" controller="person">Физические лица</g:link></li>
                        <li><g:link action="index" controller="company">Юридические лица</g:link></li>
                    </ul>
                </li>
                <li><g:link action="index" controller="warrant">Продажи</g:link></li>
                <li><g:link action="index" controller="product">Продукты</g:link></li>
            </ul>
        </sec:ifAllGranted>
        <sec:ifAllGranted roles="ROLE_ADMIN">
            <ul id="menu">
                <li>
                    <a href="#">Управление</a>
                    <ul>
                        <li><g:link action="index" controller="user">Пользователи</g:link></li>
                        %{--<li><g:link action="index" controller="console">Консоль</g:link></li>--}%
                        <li><g:link action="index" controller="developer">Контроллеры</g:link></li>
                    </ul>
                </li>
                <li>
                    <g:link action="index" controller="client">Клиенты</g:link>
                    <ul>
                        <li><g:link action="index" controller="person">Физические лица</g:link></li>
                        <li><g:link action="index" controller="company">Юридические лица</g:link></li>
                    </ul>
                </li>
                <li>
                    <a href="#">Информация</a>
                    <ul>
                        <li><g:link action="index" controller="accident">Аварии</g:link></li>
                        <li><g:link action="index" controller="contact">Контакты</g:link></li>
                        <li><g:link action="index" controller="license">Вод. права</g:link></li>
                        <li><g:link action="index" controller="passport">Паспорта</g:link></li>
                        <li><g:link action="index" controller="payment">Выплаты</g:link></li>
                        <li><g:link action="index" controller="vehicle">Траспорт</g:link></li>
                        <li><g:link action="index" controller="warrant">Продажи</g:link></li>
                    </ul>
                </li>
                <li>
                    <a href="#">Справочники</a>
                    <ul>
                        <li><g:link action="index" controller="manufacturer">Производители</g:link></li>
                        <li><g:link action="index" controller="contact">Контакты</g:link></li>
                        <li><g:link action="index" controller="price">Цены</g:link></li>
                        <li><g:link action="index" controller="product">Продукты</g:link></li>
                    </ul>
                </li>
            </ul>
        </sec:ifAllGranted>
        <sec:ifAllGranted roles="ROLE_CALL_CENTER">
            <ul id="menu">
                <li>
                    <g:link action="index" controller="client">Клиенты</g:link>
                    <ul>
                        <li><g:link action="index" controller="person">Физические лица</g:link></li>
                        <li><g:link action="index" controller="company">Юридические лица</g:link></li>
                    </ul>
                </li>
                <li><g:link action="index" controller="accident">Аварии</g:link></li>
                <li>
                    <a href="#">Информация</a>
                    <ul>
                        <li><g:link action="index" controller="contact">Контакты</g:link></li>
                        <li><g:link action="index" controller="passport">Паспорта</g:link></li>
                        <li><g:link action="index" controller="payment">Выплаты</g:link></li>
                        <li><g:link action="index" controller="vehicle">Траспорт</g:link></li>
                        <li><g:link action="index" controller="warrant">Продажи</g:link></li>
                    </ul>
                </li>
                <li><g:link action="index" controller="price">Цены</g:link></li>
            </ul>
        </sec:ifAllGranted>
        <sec:ifLoggedIn>
            <g:form id="searchableForm" name="searchableForm" method="get" controller="searchable" action="index">
                <input id="search_button" type="submit" value="Найти">
                <input id="querySearch" type="text" size="50" placeholder="Поиск..." name="q">
            </g:form>
        </sec:ifLoggedIn>
    </div>
</div>



<g:layoutBody/>
<div class="footer" role="contentinfo"></div>

%{--<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>--}%
<r:layoutResources/>
</body>
</html>
