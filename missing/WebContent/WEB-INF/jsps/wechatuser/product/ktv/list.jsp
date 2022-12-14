<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>代祭祀</title>
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
<link href="../staticfile/styles/food_front.css"
	rel="stylesheet" type="text/css" />
</head>
<body id="deal-list" data-com="pagecommon" data-page-id="100265"
	data-iswebview="false">
	<header class="navbar" style="background-color:#9A08E5;"> <span
		class="nav-header h1" style="font-size: 0.5rem;">KTV</span> </header>
	<div>
		<img src="../staticfile/images/ktvIndex.jpg" style="width: 100%">
	</div>
	<div style="height: 15px; line-height: 25px;">
		<div
			style="float: left; width: 25%; text-align: center; vertical-align: middle;font-family:黑体;font-size:0.4rem"">
			<input type="button" value="销量 "
				style="background: transparent; border: 0px" id="option1"
				onclick="changeColor(this)" />
		</div>
		<div
			style="float: left; width: 25%; text-align: center; vertical-align: middle;font-family:黑体;font-size:0.4rem">
			<input type="button" value="价格"
				style="background: transparent; border: 0px" id="option2"
				onclick="changeColor(this)" />
		</div>
		<div
			style="float: left; width: 25%; text-align: center; vertical-align: middle;font-family:黑体;font-size:0.4rem"">
			<input type="button" value="一周热销"
				style="background: transparent; border: 0px" id="option3"
				onclick="changeColor(this)" />
		</div>
		<div
			style="float: left; width: 25%; text-align: center; vertical-align: middle;font-family:黑体;font-size:0.4rem"">
			<input type="button" value="好评点赞"
				style="background: transparent; border: 0px" id="option4"
				onclick="changeColor(this)" />
		</div>
	</div>
	<br />
	<div class="deal-container">
		<div id="deals" class="deals-list">
			<!-- 每个商家的开始符 -->
			<c:forEach items="${mchUsers}" var="mchUser">
				<dl class="list" gaevent="common/poilist">
					<dd class="poi-list-item">
						<a class="react" href="#"
							data-ctpoi="792766175882313728_a73227298_c5_e2978301047565630733">
							<span class="poiname"
							style="font-size: 22px; font-family: Microsoft YaHei"><b>${mchUser.mchUser.mchShopName}</b></span>
							<div class="kv-line-r">
								<h6>
									<span class="stars" style="color: #9A08E5"><em
										class="star-text"> <c:forEach var="i" begin="1"
												end="${mchUser.mchUser.points}" step="1">
												<i class="text-icon icon-star"></i>
											</c:forEach>${mchUser.mchUser.points}星</em></span>
								</h6>
							</div>
						</a>
					</dd>
					<dd>
						<dl class="list">
							<!-- 商家下面的所有商品 列表 开始 符号 -->
							<c:forEach items="${mchUser.products}" var="product">
								<dd>
									<a
										href="tosingleproduct?type=food&productId=${product.productId}"
										class="react ">
										<div class="dealcard dealcard-poi">
											<div
												style="background: transparent none repeat scroll 0% 0%;"
												class="dealcard-img imgbox">
												<img src="${product.productHeadPicture}"
													style="width: 100%;" />
											</div>
											<div class="dealcard-block-right">
												<div class="title text-block">${product.productName}</div>
												<div class="price">
													<span class="strong" style="color: #9A08E5">折扣价：${product.discountPrice}</span>
													<span class="strong-color" style="color: #9A08E5">元</span> <span
														class="tag"
														style="color: #fff; border-color: #9A08E5; background-color: #9A08E5;">门店价${product.productPrice}元</span>
												</div>
											</div>
										</div>
									</a>
									<p class="posi-right-bottom">
										<a class="statusInfo" onclick="return false;" href="#">已售<span
											class="strong">${product.saleTotalTimes}</span></a>
									</p>
								</dd>
								<!-- 商家下面的所有商品 列表 开始 符号 -->
							</c:forEach>

						</dl>
					</dd>
				</dl>
				<!-- 每个商家的结束符 -->
			</c:forEach>

			<dl class="list">
				<dd>
					<div class="pager">
						<a href="./tofoodlist?currentPage=${currentPage}"
							class="btn btn-weak">点击加载更多</a>
					</div>
				</dd>
			</dl>
		</div>
		<div class="shade hide"></div>
		<div class="loading hide">
			<div class="loading-spin"></div>
		</div>
	</div>
	<div style="display: none;" class="top-btn" data-com="gotop"
		gaevent="imt/ft/backtotop">
		<a class="react"><i class="text-icon">⇧</i></a>
	</div>
	<script type="text/javascript">
		function changeColor(obj) {
			document.getElementById(obj.id).style.color = "#9A08E5";
			for (var i = 1; i < 5; i++) {
				var temp = "option" + i;
				if (temp == obj.id)
					continue;
				document.getElementById(temp).style.color = "black";
			}
		}
	</script>
</body>
</html>