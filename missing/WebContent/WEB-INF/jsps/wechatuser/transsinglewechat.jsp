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
	rel="stylesheet"  />
<link href="../staticfile/styles/singlefood.css"
	rel="stylesheet"  />
<link rel="stylesheet" type="text/css" href="../staticfile/styles/index_new.css">
<link rel="stylesheet" type="text/css"
	href="../staticfile/styles/screen.css">
<script src="../staticfile/commonjs/jquery-1.9.1.min.js"></script>
</head>
<body class="automove" id="deal-detail" data-com="pagecommon"
	data-page-id="100009" data-iswebview="false">
	<header class="navbar">
		<span class="nav-header h1"
			style="background-color:gray; font-size: 0.5rem;">订单号：${cacheTransaction.transaction.outTradeNo}</span>
	</header>
	<div id="deal" class="deal">
		<div class="list">
			<dl class="list list-in">
				<dd class="dd-padding buy-price" data-com="sticky"
					data-distance="1.01">
				</dd>
			</dl>
		</div>
		<div id="feedback_async" style="margin-top: .2rem">
			<dl style="opacity: 1;" id="deal-terms" class="list">
				<dt gaevent="imt/deal/terms">
					<b>订单详情</b>
				</dt>
				<dd class="dd-padding">
					<ul>
						<li>
							<div class="tip-title">
								<span style="color: blue">订单状态   : <font color="blank">${cacheTransaction.statusMsg}</font></span>
							</div>
						</li>
						<li>
							<div class="tip-title">
								<span style="color: blue">购买商品名    : <font color="blank">${cacheTransaction.productName}</font></span>
							</div>
						</li>
						<li>
							<div class="tip-title">
								<span style="color: blue">订单时间  : <font color="blank">${cacheTransaction.transaction.recordTime}</font></span>
							</div>
						</li>
						
						<c:choose>
							  <c:when test="${ empty  cacheTransaction.muweihao}">
				        	  </c:when>
				        		<c:otherwise>
					                <li>
										<div class="tip-title">
											<span style="color: blue">祭扫信息 : </span>
										</div>
										<div class="tip-des">
										     逝者    姓     名: <font color="blank">${cacheTransaction.muweihao.deadName}</font><br/>
										     墓       位    号:<font color="blank">${cacheTransaction.muweihao.muweihao}</font><br/>
										     祭扫时间       :<font color="blank">${cacheTransaction.muweihao.jisaoDate}</font><br/>
										     祭扫人手机号:<font color="blank">${cacheTransaction.muweihao.jisaoTel}</font><br/>
										     祭扫说明       :<font color="blank">${cacheTransaction.muweihao.jisaoBeizhu}</font><br/>
										</div>
									</li>
        		               </c:otherwise>
        		           </c:choose>

						
			            <li>
							<div class="tip-title">
								<span style="color: blue">订单备注 : </span>
							</div>
							<div class="tip-des">${cacheTransaction.processMsg}</div>
						</li>
					</ul>
				</dd>
			</dl>
			
			<dl style="opacity: 1;" id="deal-terms" class="list">
				<dt gaevent="imt/deal/terms">
					<b>处理信息：</b>
				</dt>
				
				<dd class="dd-padding">	
				    <ul>
						<li>
							<div class="tip-title">
								<span style="color: blue">处理说明<font color="red">(如对订单处理有任何疑问请致电商家)</font>:</span>
							</div>
							<div class="tip-des">${cacheTransaction.processMsg}</div>
						</li>
					    <li>
							<div class="tip-title">
								<span style="color: blue">过程图片：</span>
							</div>
						</li>
						
                            <c:choose>
							  <c:when test="${ empty  cacheTransaction.contentPictures}">
				        			<div style="text-align:center; color:#ccc; font-size:32px; margin-top:200px;">亲，订单图片暂未更新</div>
				        	  </c:when>
				        		<c:otherwise>
				        			<c:forEach items="${cacheTransaction.contentPictures}" var="picture">
							          <li><img src="../${picture}"width="160" height="70"/></li>
				        			</c:forEach>
        		               </c:otherwise>
        		           </c:choose>
							
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
	    $('body').append(str);
	    setTimeout(function () {
	        $('.'+type+'-message').remove()
	    },time);
	};
    </script>

<script type="text/javascript"
	src="../staticfile/commonjs/jquery.lazyload.min.js"></script>
<script type="text/javascript"
	src="../staticfile/commonjs/shared.jquery.js"></script>
</html>