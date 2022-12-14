<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<meta charset="utf-8" />
<title>代祭祀</title>
<!-- 手机适配开始  -->
<meta name="applicable-device" content="mobile" />
<meta name="viewport"
	content="initial-scale=1, width=device-width, maximum-scale=1, user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-touch-fullscreen" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<link rel="shortcut icon" type="image/x-icon" href="../staticfile/images/xianhua.jpg"/>
<meta name="format-detection" content="telephone=no" />
<meta name="format-detection" content="address=no" />
<!-- 手机适配结束  -->
<link href="../staticfile/styles/food_front.css"
	rel="stylesheet" onload="MT.pageData.eveTime=Date.now()" />
<link href="../staticfile/styles/singlefood.css"
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
					style="background: url(../../${contentPicts[0]}) 50% 50%/cover no-repeat rgb(255, 255, 255);"
					class="cycle-slide index_img print_material" id="">
				</li>
				<li
					style="background: url(../../${contentPicts[1]}) 50% 50%/cover no-repeat rgb(255, 255, 255);"
					class="cycle-slide index_img" id="">
				</li>
				<li
					style="background: url(../../${contentPicts[2]}) 50% 50%/cover no-repeat rgb(255, 255, 255);"
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
					
					<a class="btn buy-btn btn-large btn-strong" style="background-color:red;color:white" href="<%=request.getContextPath()%>/wechatuser/tobuyproduct?productId=${cacheProduct.product.productId}">
							<c:choose>  
                                <c:when test="${cacheProduct.mchUser.serviceType == 0}">  
                                                                                                   立即购买 
                                </c:when>  
                                <c:when test="${cacheProduct.mchUser.serviceType == 1}">  
                                                                                                    购买折扣码
                                </c:when>
                            </c:choose>
                    </a>
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
								<span style="color: red">声明</span>
							</div>
							<div class="tip-des">购买服务性质产品订单完成时间估计一周内，请耐心等待</div>
						</li>
						<li>
							<div class="tip-title">
								<span style="color: red">订单咨询时间</span>
							</div>
							<div class="tip-des">商家营业时间</div>
						</li>
						<li>
							<div class="tip-title">
								<span style="color: red">使用规则</span>
							</div>
							<ul class="ul">
								<li>您下单支付成功后，会在公众号'我的订单里面查询'；</li>
								<li>商家工作人员会电话联系您确认订单详情，请保持电话畅通；</li>
								<li>如有任何建议可通过平台的'我的建议'提出；</li>			
								<li>请务必提供准确的祭祀信息；</li>
								<li>感谢您持续关注平台，给平台带来宝贵的建议！</li>
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