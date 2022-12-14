<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta content="telephone=no" name="format-detection">
<meta name="baidu-site-verification" content="t7oDT96Amk">
<title>订单详情</title>
<meta content="" name="keywords">
<meta content="" name="description">
<meta name="sogou_site_verification" content="G7nmLR75yc">
<meta name="baidu-tc-cerfication" content="0a8c6d28b570b218f78510c29be4529b">
<meta name="360-site-verification" content="8b6121969d78afda8caeb69053fa29d9">

<link rel="stylesheet" href="../daijisi/style/c3e09ac36d.css">
<link rel="stylesheet" href="../daijisi/style/86fe49ca90.css">
<link rel="shortcut icon" type="image/x-icon" href="../staticfile/images/xianhua.jpg"/>
<link rel="stylesheet" href="../daijisi/style/3c30a65871.layout.min.css">
<link rel="stylesheet" href="../daijisi/style/86fe49ca90.common.min.css">
<link rel="stylesheet" type="text/css" href="../daijisi/style/footer.css">
</head>

<body style="padding-bottom: initial;" class=" hPC">

		<header id="header" class="u-header clearfix">
	    <!--返回按钮根据程序判断来源，返回上一级-->
		 		 <!-- 非微信扫码进入的用户 -->
	    <div class="u-hd-left f-left">
                <a href="user.html" class="J_backToPrev"><span class="u-icon i-hd-back"></span></a>
                </div>
			     <div class="u-hd-tit"><span>订单列表</span></div>
		       	    <div class="u-hd-right f-right"><a href="" ><span class="u-icon i-hd-home"></span></a></div>
      		 	</header>
	
      <div class="space10"></div>
       <!--以下的模块为各种状态订单通用-->
         <c:choose>
	         <c:when test="${ empty  cacheTransactions}">
                  <div class="userdiv">
					  <div class="orderlisttit">您无订单 </div>
	              </div>
	          </c:when>
	          <c:otherwise>
	            <c:forEach items="${cacheTransactions}" var="cacheTransaction">
	            
	              <div class="userdiv">
					  <div class="orderlisttit">订单详情 </div>
					  <div class="orderdeatilbox clearfix">
					   <div class="orderdeatil clearfix">
					    <a href="">
					      <div class="user_orderlist_r">
					      <p class="cart_g_name">【单号】${cacheTransaction.transaction.outTradeNo}</p>
					      <p class="space10"></p>
					      <p class="g_d_price">¥${cacheTransaction.transaction.recordMoney/100}</p>
					      <p><span class="fl">时间：${cacheTransaction.transaction.recordTime}</span></p>
					       <p>  <span class="f1">状态：${cacheTransaction.statusMsg}</span></p>
					       </div>
					      </a>
					     </div>
			          </div>
				
					<div class="orderdeatilbox clearfix border_t"><p class="qx_p">
					 <a class="dzf_quxiao_button" href="./deleteDingdan?recordId=${cacheTransaction.transaction.recordId}">删除订单</a>
					   <a class="dzf_zhifu" href="./todingdanjisi?recordId=${cacheTransaction.transaction.recordId}">查看详情</a></p>
					</div>
					
				</div>
	            </c:forEach>
	        </c:otherwise>
	    </c:choose>

<!--商品清单-->
<div class="space10"></div>
   <jsp:include page="./commonjsp/bottom_common.jsp" />
</body>

</html>