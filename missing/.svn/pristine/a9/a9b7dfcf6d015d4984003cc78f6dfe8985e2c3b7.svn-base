<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="login-bg">
<head>
<title>和齐购商户登录</title>

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


	<!-- background switcher
	<div class="bg-switch visible-desktop">
		<div class="bgs">
			<a href="#" data-img="landscape.jpg" class="bg active"> <img
				src="../staticfile/images/bgs/landscape.jpg" />
			</a> <a href="#" data-img="blueish.jpg" class="bg"> <img
				src="../staticfile/images/bgs/blueish.jpg" />
			</a> <a href="#" data-img="7.jpg" class="bg"> <img
				src="../staticfile/images/bgs/7.jpg" />
			</a> <a href="#" data-img="8.jpg" class="bg"> <img
				src="../staticfile/images/bgs/8.jpg" />
			</a> <a href="#" data-img="9.jpg" class="bg"> <img
				src="../staticfile/images/bgs/9.jpg" />
			</a> <a href="#" data-img="10.jpg" class="bg"> <img
				src="../staticfile/images/bgs/10.jpg" />
			</a> <a href="#" data-img="11.jpg" class="bg"> <img
				src="../staticfile/images/bgs/11.jpg" />
			</a>
		</div>
	</div> -->


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
		
		$.post("<%=request.getContextPath()%>/mchuser/login",{name:name,passwd:password},function(data){
			if (data.isResultOk) {
				window.location.href="<%=request.getContextPath()%>/mchuser/toindex";
			} else {
				alert("用户名或者密码错误，请重新登录");
			}
	    });
	};
		$(function() {
			// bg switcher
			var $btns = $(".bg-switch .bg");
			$btns.click(function(e) {
				e.preventDefault();
				$btns.removeClass("active");
				$(this).addClass("active");
				var bg = $(this).data("img");

				$("html").css("background-image",
						"url('../staticfile/images/bgs/" + bg + "')");
			});

		});
	</script>

</body>
</html>