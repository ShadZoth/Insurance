<html>
<head>
	<meta name='layout' content='main'/>
    %{--TODO: придумать перевод--}%
	<title><g:message code="springSecurity.login.title"/></title>
	<style type='text/css' media='screen'>
	#login {
		margin: 15px 0px;
		padding: 0px;
		text-align: center;
	}

	#login .inner {
		width: 340px;
		padding-bottom: 6px;
		margin: 60px auto;
		text-align: left;
		border: 1px solid #aab;
		background-color: #f0f0fa;
		-moz-box-shadow: 2px 2px 2px #eee;
		-webkit-box-shadow: 2px 2px 2px #eee;
		-khtml-box-shadow: 2px 2px 2px #eee;
		box-shadow: 2px 2px 2px #eee;
	}

	#login .inner .fheader {
		padding: 18px 26px 14px 26px;
		background-color: #f7f7ff;
		margin: 0px 0 14px 0;
		color: #2e3741;
		font-size: 18px;
	}

	#login .inner .cssform p {
		clear: left;
		margin: 0;
		padding: 4px 0 3px 0;
		padding-left: 40px;
		margin-bottom: 20px;
		height: 1%;
	}

	#login .inner .cssform input[type='text'] {
		width: 240px;
	}
    #login .inner .cssform input[type='password'] {
        width: 240px;
    }

	#login #remember_me_holder {
		padding-left: 45px;
	}

	#login #submit {
		margin-left: 70px;
	}

	#login #remember_me_holder label {
		margin-left: 0;
		text-align: left;
		width: 150px
	}

	#login .inner .login_message {
		padding: 6px 20px 20px 20px;
		color: #c33;
        text-align: center;
	}

	#login .inner .text_ {
		width: 120px;
	}

	#login .inner .chk {
		height: 12px;
	}
	</style>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    %{--Шрифт--}%
    <link href='http://fonts.googleapis.com/css?family=Lora&subset=latin,cyrillic' rel='stylesheet' type='text/css'>
</head>

<body>
<div id='login'>
	<div class='inner'>
		<div class='fheader'><g:message code="springSecurity.login.header"/></div>

		<g:if test='${flash.message}'>
			<div class='login_message'>${flash.message}</div>
		</g:if>

		<form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
			<p>
				<input type='text' class='text_' name='j_username' id='username' placeholder="${message(code: "springSecurity.login.label", default: "Login")}"/>
			</p>

			<p>
				<input type='password' class='text_' name='j_password' id='password' placeholder="${message(code: "springSecurity.password.label", default: "Password")}"/>
			</p>

			<p id="remember_me_holder">
				<input type='checkbox' class='chk' name='${rememberMeParameter}'
                       id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
				<label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
			</p>

			<p>
				<input type='submit' id="submit" value='${message(code: "springSecurity.login.button")}'/>
			</p>
		</form>
	</div>
</div>
<script type='text/javascript'>
	<!--
	(function() {
		document.forms['loginForm'].elements['j_username'].focus();
	})();
	// -->
</script>
</body>
</html>
