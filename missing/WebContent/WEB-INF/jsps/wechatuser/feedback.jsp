<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>提点意见</title>
<!--Custom Theme files-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="shortcut icon" type="image/x-icon" href="../staticfile/images/xianhua.jpg"/>
<meta name="keywords"
	content="Smarter Home Contact Form Responsive, Login form web template,Flat Pricing tables,Flat Drop downs  Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="applijewelleryion/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--//Custom Theme files-->
<link href="../staticfile/styles/feedbackstyle.css" rel="stylesheet"
	type="text/css" media="all" />
</head>
<body>
	<!-- main -->
	<div class="main">
		<h1>意见表</h1>
		<div class="main-bdy">
			<div class="main-body-left">
				<img src="../staticfile/images/hippo.jpg" style="width: 100%">
				<h2>联系我们</h2>
				<p>在使用产品的过程中，有任何的疑问或者觉得产品有不足之处都可以通过意见表提交给我们。</p>
			</div>
			<div class="main-body-right">
				<form method="post" action="./addsuggest">
					<div style="margin-bottom: 10px;">
						<select style="width: 150px; height: 40px;" name="fkMchId"><option/>请选择
							<c:forEach items="${mchUsers}" var="mchUser">
								<option value="${mchUser.mchUser.mchId}">${mchUser.mchUser.mchShopName}</option>
							</c:forEach>
						</select>
					</div>
					<input type="text" placeholder="您的昵称" name="nickName" required=" " > <input
						type="email" placeholder="您的邮箱" name="email" required=" " >
					<textarea placeholder="提出意见" name="info" required=" " ></textarea>
					<input type="submit" value="提交">
				</form>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<!-- //main -->
</body>
</html>