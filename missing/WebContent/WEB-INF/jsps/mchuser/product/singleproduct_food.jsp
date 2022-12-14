<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<meta charset="utf-8" />
<title>咕咕河马——和齐购</title>
<!-- 手机适配开始  -->
<meta name="applicable-device" content="mobile" />
<meta name="viewport"
	content="initial-scale=1, width=device-width, maximum-scale=1, user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-touch-fullscreen" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<meta name="format-detection" content="telephone=no" />
<meta name="format-detection" content="address=no" />
<!-- 手机适配结束  -->
<link href="/missing/staticfile/styles/food_front.css"
	rel="stylesheet" onload="MT.pageData.eveTime=Date.now()" />
<link href="/missing/staticfile/styles/singlefood.css"
	rel="stylesheet" onload="MT.pageData.eveTime=Date.now()" />
<link rel="stylesheet" type="text/css" href="../staticfile/styles/index_new.css">
<link rel="stylesheet" type="text/css"
	href="../staticfile/styles/screen.css">
<script src="../staticfile/commonjs/jquery-1.9.1.min.js"></script>
</head>
<body class="automove" id="deal-detail" data-com="pagecommon"
	data-page-id="100009" data-iswebview="false">
	<header class="navbar">
		<span class="nav-header h1"
			style="background-color: #E52010; font-size: 0.5rem;">${cacheProduct.mchUser.shopName}</span>
	</header>
	<div class=" clearfix ">
		<div class="unslider-carousel has-dots" data-cycle-loader="true"
			data-cycle-pause-on-hover="true">
			<ul class="cycle-paused">
			 <!-- TODO: 解析 contentPicturePath 循环加载， 要带上commonPath-->
				<li
					style="background: url(../${cacheProduct.product.productHeadPicture}) 50% 50%/cover no-repeat rgb(255, 255, 255);"
					class="cycle-slide index_img print_material" id="">
				</li>
				<li
					style="background: url(../${cacheProduct.product.productHeadPicture}) 50% 50%/cover no-repeat rgb(255, 255, 255);"
					class="cycle-slide index_img" id="">
				</li>
				<li
					style="background: url(../staticfile/images/hotPot2.jpg) 50% 50%/cover no-repeat rgb(255, 255, 255);"
					class="cycle-slide index_img sqsy_index">
				</li>
			</ul>
		</div>
	</div>
	<div id="deal" class="deal">
		<div class="list">
			<dl class="list list-in">
				<dd class="dd-padding buy-price" data-com="sticky"
					data-distance="1.01">
					<div class="price">
					<b>${cacheProduct.product.productName}</b><br/>
						<strong class="J_pricetag strong-color"><span
							style="color: red;font-size:0.3rem">折扣价：${cacheProduct.product.discountPrice}</span></strong> <span
							class="strong-color"><span style="color: red"> 元</span></span> <span
							style="letter-spacing: -.02rem;"><s>门市价:${cacheProduct.product.productPrice}元</s></span>
					</div>
					<a class="btn buy-btn btn-large btn-strong" style="background-color:red;color:white" 
						href="<%=request.getContextPath()%>/wechatuser/tobuyproduct?productId=${product.product.productId}">立即购买</a>
						<div style="float:right">已售${cacheProduct.product.saleTotalTimes}</div>
				</dd>
			</dl>
		</div>
		<dl class="list">
			<dd>
				<dl>
					<dt gaevent="imt/deal/bizinfo">
						<b>套餐详情</b>
					</dt>
					<dd class="dd-padding">
						<div class="merchant">
							<div class="biz-detail">
								<p>${cacheProduct.product.productName}</p>
								<div class="address single-line">
									<p>${cacheProduct.product.productDescription}</p>
								</div>
							</div>
						</div>
					</dd>
				</dl>
			</dd>
		</dl>
		<dl class="list">
			<dd>
				<dl>
					<dt gaevent="imt/deal/bizinfo">
						<b>商家信息</b>
					</dt>
					<dd class="dd-padding">
						<div class="merchant">
							<div class="biz-detail">
								<a gaevent="imt/detail/merchant" class="react" href="#">
									<h5 class="title single-line">${cacheProduct.mchUser.shopName}</h5>
									<div class="address single-line">
										${cacheProduct.mchUser.shopAddress}</div>
								</a>
							</div>
							<div class="biz-call">
								<a gaevent="imt/detail/bizPhone" data-com="phonecall"
									class="react phone"
									href="tel:${cacheProduct.mchUser.phoneNum}"><i
									class="text-icon"><span style="color:red">✆</span></i></a>
							</div>
						</div>
					</dd>
				</dl>
			</dd>
		</dl>
		<div id="feedback_async" style="margin-top: .2rem">
			<dl style="opacity: 1;" id="deal-terms" class="list">
				<dt gaevent="imt/deal/terms">
					<b>购买须知</b>
				</dt>
				<dd class="dd-padding">
					<ul>
						<li>
							<div class="tip-title">
								<span style="color: red">有效期</span>
							</div>
							<div class="tip-des">自购买之后十五天（包含购买当天）</div>
						</li>
						<li>
							<div class="tip-title">
								<span style="color: red">使用时间</span>
							</div>
							<div class="tip-des">商家营业时间</div>
						</li>
						<li>
							<div class="tip-title">
								<span style="color: red">使用规则</span>
							</div>
							<ul class="ul">
								<li>您在本平台所购的是商品兑换串码，交易发生时兑换码将自动发送到您的微信号上</li>
								<li>串码自您收到时起即可在对应商家进行兑换；</li>
								<li>有效期是自您收到之日起15天，过期作废且购买金额不再退还；</li>
								<li>请根据您的需要选择购买，本平台不承担因串码过期未兑换给您带来的损失；</li>
								<li>当前仅支持微信支付，一次性购买多个时只能得到一个兑换码且一次性全部兑换，如需分多次兑换则请多次购买兑换码；</li>
								<li>为了能够顺利向您推送您购买的兑换码，购票前请务必关注平昌欢乐购官方微信！</li>
							</ul>
						</li>
					</ul>
				</dd>
			</dl>
		</div>
	</div>
</body>

<script type="text/javascript"
	src="../staticfile/commonjs/jquery.lazyload.min.js"></script>
<script type="text/javascript"
	src="../staticfile/commonjs/shared.jquery.js"></script>
</html>