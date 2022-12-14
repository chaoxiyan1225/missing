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
<title>购物车</title>
<meta content="" name="keywords">
<meta content="" name="description">
<meta name="sogou_site_verification" content="G7nmLR75yc">
<meta name="baidu-tc-cerfication" content="0a8c6d28b570b218f78510c29be4529b">
<meta name="360-site-verification" content="8b6121969d78afda8caeb69053fa29d9">
<link rel="stylesheet" href="../daijisi/style/c3e09ac36d.css">
<link rel="shortcut icon" type="image/x-icon" href="../staticfile/images/xianhua.jpg"/>
<link rel="stylesheet" href="../daijisi/style/86fe49ca90.css">
<link rel="stylesheet" type="text/css" href="../daijisi/style/footer.css">
<script type="text/javascript" src="../daijisi/style/zepto.js"></script>
<script type="text/javascript" src="../daijisi/style/swipe.js"></script>
<style type="text/css">.u-footer{display:none;}</style>
</head>

<body>

		<header id="header" class="u-header clearfix">
	    <!--返回按钮根据程序判断来源，返回上一级-->
		 		 <!-- 非微信扫码进入的用户 -->
	    <div class="u-hd-left f-left">
      		 <a href="./daijisi" class="J_backToPrev"><span class="u-icon i-hd-back"></span></a>
        </div>
			   <span class="u-hd-tit">购物车</span>
		 	    <div class="u-hd-right f-right">
					<a href="./index">
					   <span class="u-icon i-hd-home"></span>
					</a>
				</div>
		 	</header>
<div id="cart_list">
  
  <!--特卖会订单-->
  <div class="space10"></div>
      <h2 class="order_sendby clearfix">
	<span>
	    待支付商品列表
	</span>
  </h2>
  <div class="cartdiv">
     <div class="cartlist clearfix">
         <c:choose>
	         <c:when test="${ empty  cacheProducts}">
	            	 <div class="cartlistinner clearfix">
				             <font color="blue"> <b>还未添加商品</b></font>
					</div>
	          </c:when>
	          <c:otherwise>
	            <c:forEach items="${cacheProducts}" var="cacheProduct">
				      <div class="cartlistinner clearfix">
					  	<a href="#" class="cart_orderlist_i">
				        	<img style="display: inline;" src="../${cacheProduct.product.productHeadPicture}" data-brandlazy="true" height="101" width="80">
						</a>
				        <div class="cart_orderlist_info"> <a href="#">
				          <p class="cart_g_name">${cacheProduct.product.productName}</p>
				           <p class="cart_g_name">&emsp;</p>
				           <p class="cart_g_name">&emsp;</p>
				           <p class="cart_g_name">&emsp;</p>
						            </a>
				          <div class="amount-confirm-box" data-product_id="43280703" data-size_id="112517730">
				              <a href="javascript:;"  onclick="delgouwuche(${cacheProduct.product.productId});return false;" class="amount-action amount-action-min disabled">-</a>
				              <span class="amount-text">${cacheProduct.buyCnt}</span>
				              <input class="amount-num" readonly="readonly" data-brand-id="328791" data-product_id="43280703" data-size_id="112517730" data-id="" value="1" name="num" type="text">
				              <a href="javascript:;"  onclick="addgouwuche(${cacheProduct.product.productId});return false;" class="amount-action amount-action-max" data-action="addNum" mars_sead="cart_edit_btn" data_mars="prd_id:43280703">+</a>
				          </div>
				        </div>
					      <a class="cart_orderlist_p" href="#" target="_blank" style="display:block">
					          <span class="c_price">¥${cacheProduct.product.discountPrice}</span>
					          <span class="fontstyle">¥${cacheProduct.product.productPrice}</span>
					      </a>
				        <span class="delete">
				         <a href="javascript:;" onclick="delAllgouwuche(${cacheProduct.product.productId});return false;"  data-action="delete" data-usecoupon="0" >
				         <img src="../daijisi/images/74ff20009b.png" height="22" width="22">
				        </a>
				      </span>
					</div>
	            
	            </c:forEach>
	
	        </c:otherwise>
	    </c:choose>
      </div>
        
      <c:choose>
	         <c:when test="${ empty  muweihaos}">
			     <div class="orderaction clearfix">
			      	    <p class="fl"><font color="red">*</font><b>未找到默认墓位号</b></p>
			            <div class="clear"></div>
				        <div class="use_bouns clearfix">
				 	 	 <div class="use_bouns">
			    	        请<a href="./addMuweihao" class="fontyellow"> 添加墓位号&gt;&gt;</a>
			        	 </div>
				 	 	 </div>
			    </div>
	          </c:when>
	          <c:otherwise>
	             <div class="orderaction clearfix">
				    <span class="form_hd"><b><font color="red">*</font>祭扫墓位号：</b></span>
			        <span class="form_td ml80">
			        <select id="uuid" name="transport_day" class="text_select" onchange="">
			          <option value="">点击选择墓位号&emsp;</option>
			          <c:forEach items="${muweihaos}" var="muweihao">
				          <option value="${muweihao.uuid}">${muweihao.deadName}&emsp;</option>

			          </c:forEach>
			        </select>
					</span>
			    </div>
	          
	          </c:otherwise>
	  </c:choose>
		    <!--<div class="saveguid"><span></span>100%正品保证</div>-->
		     <c:choose>
	          <c:when test="${ empty  cacheProducts}">
	          </c:when>
	          <c:otherwise>
			    <div class="container nav-current-box checkout-box">
			      <div class="navbar-header">
			        <p class="totle">总金额：<span class="price">¥${payForMoney}</span></p>
			        <span>为您节省：¥${saveMoney}</span>
			      </div>
			      
			      <c:choose>
				      <c:when test="${ empty  muweihaos}">
	                       			      
					      <div class="navbar-brand">
					         <a class="btn btn-large btn-purple"  href="./addMuweihao" data-islogin="true" data-shopcarthide="true" data-countdown="true" data-carttime="1189">请先添加墓位号</a>
					      </div>
		              </c:when>
		              <c:otherwise>
		                <div class="navbar-brand">
				           <a class="btn btn-large btn-purple"  href="javascript:;"  onclick="payfor(6);return false;" data-islogin="true" data-shopcarthide="true" data-countdown="true" data-carttime="1189">去结算</a>
				        </div>
		              </c:otherwise>
	              </c:choose>
	              
			    </div>
	          </c:otherwise>
	    </c:choose>
  </div>


</div>
<div class="space10"></div>
   <jsp:include page="./commonjsp/bottom_common.jsp" />
</body>

  <script>
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
		        $('.'+type+'-message').remove();
		    },time);
		};

		 var addgouwuche = function(id){
			if(id.length == 0)
		    {
				showMessage("未选择商品",'error',1000);
		    	return false;
		    }

			$.post("<%=request.getContextPath()%>/wechatuser/gouwuche/add",{productId:id},function(data){
				var json = JSON.parse(data);
				if (json.isResultOk) {
					showMessage('添加购物车成功','success',2000);
					//页面刷新下数据
					window.location.href="./gouwuche";
					return true ;
				} else {
					showMessage('系统异常，请重试','error',2000);
					return false ;
				};
		    });
		};	
		
		 var delgouwuche = function(id){
			if(id.length == 0)
		    {
				showMessage("未选择商品",'error',1000);
		    	return false;
		    }

			$.post("<%=request.getContextPath()%>/wechatuser/gouwuche/deleteone",{productId:id},function(data){
				var json = JSON.parse(data);
				if (json.isResultOk) {
					showMessage('删除成功','success',2000);
					//页面刷新下数据
					window.location.href="./gouwuche";
					return true ;
				} else {
					showMessage('系统异常，请重试','error',2000);
					return false ;
				};
		    });
		};	
		
		 var delAllgouwuche = function(id){
			if(id.length == 0)
		    {
				showMessage("未选择商品",'error',1000);
		    	return false;
		    }

			$.post("<%=request.getContextPath()%>/wechatuser/gouwuche/deleteall",{productId:id},function(data){
				var json = JSON.parse(data);
				if (json.isResultOk) {
					showMessage('删除成功','success',2000);
					//页面刷新下数据
					window.location.href="./gouwuche";
					return true ;
				} else {
					showMessage('系统异常，请重试','error',2000);
					return false ;
				};
		    });
		};	
		
		
		 var payfor = function(mchid){
			 
			   var uuid = document.getElementById('uuid').value;
				if(uuid.length == 0)
			    {
					showMessage("必须选择墓位号",'error',1000);
			    	return false;
			    }
				
				window.location.href="./payforgouwuche?muweihao="+uuid+"&mchId="+mchid;
				
				return true;
			
			};
	
	</script>

</html>