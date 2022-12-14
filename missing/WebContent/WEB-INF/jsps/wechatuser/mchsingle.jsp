<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<link rel="shortcut icon" type="image/x-icon" href="../staticfile/images/xianhua.jpg"/>
<meta charset="utf-8" />
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
			style="background-color: #E52010; font-size: 0.5rem;">${cacheUser.mchUser.shopName}</span>
	</header>
	<div class=" clearfix ">
		<div class="unslider-carousel has-dots" data-cycle-loader="true"
			data-cycle-pause-on-hover="true">
			<ul class="cycle-paused">
			 <!-- TODO: 解析 contentPicturePath 循环加载， 要带上commonPath-->
				<li
					style="background: url(../${cacheUser.contentPictures[0]}) 50% 50%/cover no-repeat rgb(255, 255, 255);"
					class="cycle-slide index_img print_material" id="">
				</li>
				<li
					style="background: url(../${cacheUser.contentPictures[1]}) 50% 50%/cover no-repeat rgb(255, 255, 255);"
					class="cycle-slide index_img" id="">
				</li>
				<li
					style="background: url(../${cacheUser.contentPictures[2]}) 50% 50%/cover no-repeat rgb(255, 255, 255);"
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
					<span class="stars" style="color: #E52010"><em
										class="star-text"> <c:forEach var="i" begin="1"
												end="${cacheUser.mchUser.points}" step="1">
												<i class="text-icon icon-star"></i>
											</c:forEach>${cacheUser.mchUser.points}星</em></span>
					 <br/>
						<strong class="J_pricetag strong-color"><span
							style="font-size:0.3rem">当前排队人数 ${waitingNum}人</span></strong>
					</div>
					
					<c:if test="${cacheUser.inService == true}">
					   <a class="btn buy-btn btn-large btn-strong" style="background-color:red;color:white" href="<%=request.getContextPath()%>/wechatuser/tobuyqueueorder?mchid=${cacheUser.mchUser.mchId}">
                          <font size="4">点我取号</font>
                        </a>
			        </c:if>
			        <c:if test="${cacheUser.inService == false}">
					   <a class="btn buy-btn btn-large btn-strong" style="background-color:red;color:white" href="#">
                          <font size="4">已打烊</font>
                        </a>
			        </c:if>

				    <div style="float:left"></div>
				</dd>
			</dl>
		</div>
		<dl class="list">
			<dd>
				<dl>
					<dt gaevent="imt/deal/bizinfo">
						<b>商家信息</b>
											  <br/>
					<span
							style="font-size:0.3rem">服务总次数 ${cacheUser.mchUser.totalSaleCount}</span></strong>
					</dt>
					<dd class="dd-padding">
						<div class="merchant">
							<div class="biz-detail">
								<a gaevent="imt/detail/merchant" class="react" href="#">
									<h5 class="title single-line">${cacheUser.mchUser.shopName}</h5>
									<div class="address single-line">
										${cacheUser.mchUser.shopAddress}</div>
								</a>
							</div> 
							
						  <c:if test="${isFollow == 'false'}">
						     <div class="text-icon"   onclick="submit(${cacheUser.mchUser.mchId})">
						       <font size="5" color="">❤关注   </font>
						    </div>
						  </c:if>	
						  <c:if test="${isFollow == 'true' }">
						   <div class="text-icon"   onclick="submit(${cacheUser.mchUser.mchId})">
						       <font size="5" color="red">❤已关注 </font>
						    </div>
						    
						    </c:if>
							<div class="biz-call">
								<a gaevent="imt/detail/bizPhone" data-com="phonecall"
									class="react phone"
									href="tel:${cacheUser.mchUser.phoneNum}"><i
									class="text-icon"><span style="color:red">✆</span></i></a>
							</div>
						</div>
					</dd>
				</dl>
			</dd>
		</dl>
		<div id="feedback_async" style="margin-top: .2rem">
			<dl style="opacity: 1;" id="deal-terms" class="list">	
				<dd class="dd-padding">
					<ul>
						<li>
							<div class="tip-title">
								<span style="color: red">当前营业状态</span>
							</div>
							<div class="tip-des">${cacheUser.mchUser.serviceStatus}</div>
						</li>
						<li>
							<div class="tip-title">
								<span style="color: red">营业时间段</span>
							</div>
							<div class="tip-des">${start}-${end}</div>
						</li>
						<li>
							<div class="tip-title">
								<span style="color: red">商家简介</span>
							</div>
							<div class="tip-des">${cacheUser.mchUser.shopDetail}</div>
						</li>
						<li>
							<div class="tip-title">
								<span style="color: red">取号须知</span>
							</div>
							<ul class="ul">
								<li>一个商家仅支持一个微信号排队一次，无需重复排队；</li>
								<li>排队取号当天在商家营业时间段内消费完成；</li>
								<li>排队过号会自动保留，但是在商家服务时间段外无效；</li>
								<li>为保证服务质量，请勿将该公众号消息免打扰；</li>
								<li>取号后平台会提前两个号微信通知您到店服务，请务必关注微信消息；</li>
							</ul>
						</li>
					</ul>
				</dd>
			</dl>
		</div>
	</div>
</body>

<script type="text/javascript">
function showMessage(message,type,time) {
    let str = '';
    switch (type) {
        case 'success':
            str = '<div class="success-message" style="width: 300px;height: 40px;text-align: center;background-color:#daf5eb;;color: rgba(59,128,58,0.7);position: fixed;left: 43%;top: 10%;line-height: 40px;border-radius: 5px;z-index: 9999">\n' +
                '    <span class="mes-text">'+message+'</span></div>';
            break;
        case 'error':
            str = '<div class="error-message" style="width: 300px;height: 40px;text-align: center;background-color: #f5f0e5;color: rgba(238,99,99,0.8);position: fixed;left: 43%;top: 10%;line-height: 40px;border-radius: 5px;;z-index: 9999">\n' +
                '    <span class="mes-text">'+message+'</span></div>';
    }
    $('body').append(str)
    setTimeout(function () {
        $('.'+type+'-message').remove()
    },time);
};

 var submit = function(id){
	if(id.length == 0)
    {
		showMessage("必须选择一个商家",'error',1000);
    	return false;
    }

	$.post("<%=request.getContextPath()%>/wechatuser/followmch",{mchid:id},function(data){
		showMessage(data.resultMsg,'success',2000);
    });
	
	return true ;
};	
</script>
<script type="text/javascript"
	src="../staticfile/commonjs/jquery.lazyload.min.js"></script>
<script type="text/javascript"
	src="../staticfile/commonjs/shared.jquery.js"></script>

</html>