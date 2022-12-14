<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="login-bg">
<head>
<title>大青山管理员登录</title>
<link rel="shortcut icon" type="image/x-icon" href="../staticfile/images/admin-logo.jpg">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- bootstrap -->
<link href="../staticfile/styles/bootstrap/bootstrap.css"
	rel="stylesheet" />
<link href="../staticfile/styles/bootstrap/bootstrap-responsive.css"
	rel="stylesheet" />
<link href="../staticfile/styles/bootstrap/bootstrap-overrides.css"
	type="text/css" rel="stylesheet" />

<!-- global styles -->
<link rel="stylesheet" type="text/css"
	href="../staticfile/styles/layout.css" />
<link rel="stylesheet" type="text/css"
	href="../staticfile/styles/elements.css" />
<link rel="stylesheet" type="text/css"
	href="../staticfile/styles/icons.css" />

<!-- libraries -->
<link rel="stylesheet" type="text/css"
	href="../staticfile/styles/lib/font-awesome.css" />

<!-- this page specific styles -->
<link rel="stylesheet" href="../staticfile/styles/compiled/signin.css"
	type="text/css" media="screen" />

<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
	<div class="row-fluid login-wrapper">
		<div style="margin-bottom:15px;">
			<h2 style="font-family:microsoft YaHei">GooHippo</h2>
		</div>

		<div class="span4 box">
			<div class="content-wrap">
				<h6 style="font-size:25px;">登&nbsp&nbsp&nbsp&nbsp&nbsp录</h6>
				<input class="span12" type="text" placeholder="用户名" id="name" /> <input
					class="span12" type="password" placeholder="密码" id="passwd" /> <a
					href="mailto:Zidane_2014@163.com" class="forgot">忘记密码?</a>
				<div class="remember">
				</div>
				<a class="btn-glow primary login" onclick="submit(this)">登录</a>
			</div>
		</div>

		<div class="span4 no-account">
		</div>
	</div>

	<!-- scripts -->
	<script src="../staticfile/commonjs/jquery-latest.js"></script>
	<script src="../staticfile/commonjs/bootstrap.min.js"></script>
	<script src="../staticfile/commonjs/theme.js"></script>

	<!-- pre load bg imgs -->
	<script type="text/javascript">
	var submit = function(e)
	{
		var name = document.getElementById("name").value;
	    var password = document.getElementById("passwd").value;
	   // var conform = document.getElementById("validcode").value;
		if(name.length == 0)
	    {
			$('#namerequired').text("用户名不能为空");
	    	return false;
	    }
	    if(password.length == 0)
	    {
	    	$('#passwdrequired').text("密码不能为空");
	    	return false;
	    }
		
		$.post("<%=request.getContextPath()%>/admin/login",{name:name,passwd:password},function(data){
			if (data.isResultOk) {
				window.location.href="<%=request.getContextPath()%>/admin/toindex";
			} else {
				alert("用户名或者密码错误，请重新登录");
			}
	    });
	 };

	$("html").css("background-image","url('../staticfile/images/bgs/11.jpg')");

	</script>

</body>
</html>