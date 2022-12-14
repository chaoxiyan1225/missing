
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<!-- saved from url=(0026)//user.html -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta content="telephone=no" name="format-detection">
<meta name="baidu-site-verification" content="t7oDT96Amk">
<title>个人中心</title>
<meta content="" name="keywords">
<meta content="" name="description">
<meta name="sogou_site_verification" content="G7nmLR75yc">
<meta name="baidu-tc-cerfication" content="0a8c6d28b570b218f78510c29be4529b">
<meta name="360-site-verification" content="8b6121969d78afda8caeb69053fa29d9">

<link rel="shortcut icon" type="image/x-icon" href="../staticfile/images/xianhua.jpg"/>
<link rel="stylesheet" href="../daijisi/style/3c30a65871.layout.min.css">
<link rel="stylesheet" href="../daijisi/style/86fe49ca90.common.min.css">
<link rel="stylesheet" type="text/css" href="../daijisi/style/footer.css">
</head>

<body class=" hAndroid hPC" >
		<header id="header" class="u-header clearfix">

	    <div class="u-hd-left f-left">
                <a href="./daijisi" class="J_backToPrev"><span class="u-icon i-hd-back"></span></a>
                </div>
			     <div class="u-hd-tit"><span>个人中心</span></div>
		       	
   </header>
	
<!-- 未登录 -->
<div class="userinfo">
  <div class="userinfo_content">
		<p class="username"><font color="yellow">云祭思真诚为您服务</font></p>
  </div>
</div>


<div class="s_links in_user_center userdiv">
  <a href="./todingdans"><em class="s_history"></em>查看订单<span></span></a>
</div>
<c:choose>
  <c:when test="${needShow == true}">
	<div class="s_links in_user_center userdiv">
	  <a href="./muweihao"><em class="s_addr"></em>墓位号<span></span></a>
	</div>
	<div class="s_links in_user_center userdiv">
	  <a href="./bangzhuzhongxin"><em class="s_fav"></em>帮助中心<span></span></a>
	</div>
  
  </c:when>
</c:choose>



<!--以下是底部样式-->

	 <jsp:include page="./commonjsp/bottom_common.jsp" />

</body></html>