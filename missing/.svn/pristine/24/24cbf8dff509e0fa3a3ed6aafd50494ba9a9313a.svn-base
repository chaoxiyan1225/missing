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
<link rel="shortcut icon" type="image/x-icon" href="../staticfile/images/xianhua.jpg"/>
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-touch-fullscreen" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<meta name="format-detection" content="telephone=no" />
<meta name="format-detection" content="address=no" />
<!-- 手机适配结束  -->
<link href="../staticfile/styles/food_front.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="./staticfile/commonjs/jquery-1.9.1.min.js"></script>
	<style type="text/css">
body {
  margin: 0;  padding: 0;
  font-size: 14px; font-family: "microsoft yahei",'Arial', 'Verdana','Helvetica', sans-serif;
}
.bar {
  position: fixed; top: 0; left: 0; right: 0; /* 决定了搜索框置顶 */
  height: 44px; padding: 0 10px;
  background-color: #fff; opacity: 0.8; /* 搜索框半透明效果 */
  z-index: 10;
}
.bar form {
  display: block; padding: 0;margin: 0;
}
.search-row {
  position: relative;
  height: 30px; padding: 7px 0;
}
.search-row input[type=search] {
  position: absolute; top: 7px;
  height: 30px; line-height: 21px; width: 100%; padding: 10px 15px 10px 30px;
  border: 0; border-radius: 6px; outline: 0; background-color: rgba(0,0,0,0.1);
  font-size: 16px; text-align: center;
  z-index: 100;
}
.search-row .placeholder {
  position: absolute; top: 2px; left: 0; right: 0;
  display: inline-block; height: 34px; line-height: 34px;
  border: 0; border-radius: 6px;
  font-size: 16px; text-align: center; color: #999;
  z-index: 1;  
}
.search-row .placeholder .iconfont {
  display: inline-block; width: 19px; line-height: 24px; padding: 10px 0; 
  font-size: 21px; color: #666;
}
.search-row .placeholder .text {
  line-height: 40px;
  vertical-align: top;
}
.background img {
  width: 100%;
}
.active:before {
  position: absolute; top: 11px; left: 5px; right: auto;
  display: block; margin-right: 0;
  font-size: 21px;
}
.active input[type=search] {
  text-align: left
}
.active .placeholder{
  display: none
}
</style>
</head>
<body id="deal-list" data-com="pagecommon" data-page-id="100265"
	data-iswebview="false">
	<div>
		<img src="/missing/staticfile/images/diandeng.jpg" style="width: 100%; height:50%" />
	</div>
	<br />
	<div class="deal-container">
		<div id="deals" class="deals-list">
			<!-- 每个商家的开始符 -->
				<dl class="list" gaevent="common/poilist">
					<dd class="poi-list-item">
						<a class="react" href="#"
							data-ctpoi="792766175882313728_a73227298_c5_e2978301047565630733">
							<span class="poiname"
							style="font-size: 22px; font-family: Microsoft YaHei"><b>${cacheUser.mchUser.shopName}</b></span>
							<div class="kv-line-r">
								<h6>
									<span class="stars" style="color: #E52010"><em
										class="star-text"> <c:forEach var="i" begin="1"
												end="${cacheUser.mchUser.points}" step="1">
												<i class="text-icon icon-star"></i>
											</c:forEach>${cacheUser.mchUser.points}星</em></span>
								</h6>
							</div>
						</a>
					</dd>
					<dd>
						<dl class="list">
						     <c:forEach items="${cacheUser.products}" var="product">
								<c:if test="${product.productStatus > 0}">
								<dd>
									<a
										href="tosingleproduct?type=${product.productType}&productId=${product.productId}"
										class="react ">
										<div class="dealcard dealcard-poi">
											<div
												style="background: transparent none repeat scroll 0% 0%;"
												class="dealcard-img imgbox">
												<img src="../${product.productHeadPicture}"
													style="width: 100%;" />
											</div>
											<div class="dealcard-block-right">
												<div class="title text-block">${product.productName}</div>
												<div class="price">
													<span class="strong" style="color: red">折扣价：${product.discountPrice}</span>
													<span class="strong-color" style="color: red">元</span> <span
														class="tag"
														style="color: #fff; border-color: #E52010; background-color: #E52010;">门店价${product.productPrice}元</span>
												</div>
											</div>
										</div>
									</a>
									<p class="posi-right-bottom">
										<a class="statusInfo" onclick="return false;" href="#">已售<span
											class="strong">${product.saleTotalTimes}</span></a>
									</p>
								</dd>
							  </c:if>
							</c:forEach>

						</dl>
					</dd>
				</dl>
				<!-- 每个商家的结束符 -->
			<dl id="listlast" gaevent="common/poilist"></dl>
			<input type="hidden" id="currentPage" name="currentPage"
				value="${currentPage}" />
			<dl>
				<dd>
					<div class="pager">
						<a href="javascript:" class="btn btn-weak" id="loadMeinvMOre">点击加载更多</a>
					</div>
				</dd>
			</dl>
		</div>
	</div>

	<script type="text/javascript">
	 $(function() {
		   //点击更多加载
		   $("#loadMeinvMOre").click(function() {
			  var currentPage = document.getElementById("currentPage").value;
			  $.post("<%=request.getContextPath()%>/wechatuser/getmorefoods",
												{
													currentPage : currentPage
												},
												function(data) {
													if (data.isResultOk) {
														// 从model里面取数据 并封装
														$("#listlast").before(
																data.resultMsg);
														document
																.getElementById("currentPage").value = data.currentPage;
													} else {
														//alert("have no");
														document
																.getElementById("loadMeinvMOre").innerText = "已无更多加载项";
													}

												});

							});

		});
		function changeColor(obj) {
			document.getElementById(obj.id).style.color = "#E52010";
			for (var i = 1; i < 5; i++) {
				var temp = "option" + i;
				if (temp == obj.id)
					continue;
				document.getElementById(temp).style.color = "black";
			}
		}
		
		/* 输入框获取到焦点 表示用户正在输入 */
		$("#word").focusin(function() {
		  $(".search-row").addClass("active iconfont icon-sousuo");
		});
		/* 输入框失去焦点 表示用户输入完毕 */
		$("#word").focusout(function() {
		  /* 判断用户是否有内容输入 */
		  if ($(this).val()=="") {
		    /* 没有内容输入 改变样式 */
		    $(".search-row").removeClass("active iconfont icon-sousuo");
		  } else {
		    /* 有内容输入 保持样式 并提交表单 */
		    $("#search").submit();
		  }
		});
	</script>
</body>
</html>