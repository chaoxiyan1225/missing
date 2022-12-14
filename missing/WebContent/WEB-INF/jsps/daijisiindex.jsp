<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">
    <title>代祭祀</title>
    <link rel="stylesheet" type="text/css" href="../daijisi/style/public.css">
    <link rel="shortcut icon" type="image/x-icon" href="../staticfile/images/xianhua.jpg"/>
    <link rel="stylesheet" type="text/css" href="../daijisi/style/home.css">
	<link rel="stylesheet" type="text/css" href="../daijisi/style/footer.css">
	<link rel="stylesheet" type="text/css" href="../daijisi/style/reset.css" media="all">
    <link rel="stylesheet" type="text/css" href="../daijisi/style/common1.css" media="all">

<!--首页幻灯js-->
<script type="text/javascript" src="../daijisi/style/zepto.js"></script>
<script type="text/javascript" src="../daijisi/style/swipe.js"></script>
<!--首页幻灯js end-->
</head>
<body>
    <div class="loading_page" style="display: none;"></div>
	
	<div style="overflow:hidden;">
	   <div class="clearboth wrap-logo-zn " id="logo"><img src="../daijisi/images//daijisi.png"></div>
       <div class="searchnew" id="searchContainer"><div class="products-search-item"><div class="main-nav-search "><div class="input-group"><input autocomplete="off" id="input-main-nav-search" class="form-control" title="产品搜索" placeholder="搜索祭扫用品" type="search"><span class="input-group-btn"><button class="btn5 submit" type="submit" id="btnSearch"><i class="search-icon"></i></button></span></div></div></div></div>
	</div>
    <div class="banner openwebview" >
	    <div style="-webkit-transform:translate3d(0,0,0);">
		<div id="banner_box" class="box_swipe">
			<ul style="list-style: none outside none; transition-duration: 500ms;">
					<li>
						<a onClick="return false;">
							<img src="../daijisi/images/daijisi.jpg" alt="2" style="width:100%;">
						</a>
					</li>
			</ul>
			<ol>					
				<li class="on"></li>
				<li></li>
			</ol>
		</div>
	</div>
	

</div>

 <div class="recommend openwebview">
        <!--<div style="display: block;" class="tit">
            <h2>您的专属推荐</h2>
        </div>-->
 <div class="wrap">
        
 <div class="item">
    <div class="caption">
        <h3 class="caption_life"><a href="#">套餐祭祀</a></h3>
        <!--<span class="browse">(3.6万人正在浏览)</span>-->
    </div>
    <!-- 
    <div class="item_brand">
	     <a href="javascript:;" data-url="/index/activity/show/aid/3249" >
            <img class="fadeInImg" src="../daijisi/xianhua_img/xianhua.jpg">
        </a>
    </div>
     -->
    <div class="item_con clearfix" >
        <dl><dt>
		<img class="fadeInImg"  src="../daijisi/xianhua_img/zhuiyiqinren.jpg"></dt>
		<dd><p class="txt">【C套餐】追忆亲人...</p><div class="price clearfix"><span class="now_price"><i>￥</i><em>298</em></span><span>               
         <span>&nbsp;&nbsp;&nbsp; <a href="#" onclick="addgouwuche(1);return false;">  <font color="blue">加入购物车</font></a></span>
            </span><span class="old_price"><i>￥</i><em>348</em></span></div></dd></dl>
        <dl><dt>
		<a href="javascript:;" data-url="//product/detail?pid=15012276248249&amp;from=1">
		<img class="fadeInImg" src="../daijisi/xianhua_img/zhuisimianhuai.jpg"></a></dt>
		<dd><p class="txt">【B套餐】追思缅怀...</p><div class="price clearfix"><span class="now_price"><i>￥</i><em>398</em></span>
		 <span>&nbsp;&nbsp;&nbsp;<a  href="#" onclick="addgouwuche(2);return false;">  <font color="blue">加入购物车</font></a></span>
		<span class="old_price"><i>￥</i><em>448</em></span></div></dd></dl>
	</div>
	<div class="item_con clearfix" >
        <dl><dt><a href="javascript:;" data-url="//product/detail?pid=15012273794234&amp;from=1">
		<img class="fadeInImg" src="../daijisi/xianhua_img/tiantanglidesinian.jpg"></a></dt>
		<dd><p class="txt">【A套餐】天堂里的思念...</p><div class="price clearfix"><span class="now_price"><i>￥</i><em>699</em></span>
		 <span>&nbsp;&nbsp;&nbsp;<a  href="#" onclick="addgouwuche(3);return false;">  <font color="blue">加入购物车</font></a></span>
		<span class="old_price"><i>￥</i><em>749</em></span></div></dd></dl><dl><dt>
		<a href="javascript:;">
		<img class="fadeInImg" src="../daijisi/xianhua_img/sirendingzhi.jpg"></a></dt>
		<dd><p class="txt">【特定】私人定制...</p><div class="price clearfix"><span class="now_price"><i>￥</i><em>面谈</em></span>
		 <span>&nbsp;&nbsp;&nbsp;<a  href="#" onclick="addgouwuche(4);return false;">  <font color="blue">加入购物车</font></a></span>
		<span class="old_price"><i>￥</i><em>面谈</em></span></div></dd></dl>
	</div>
</div>
<div class="item" >
    <div class="caption">
        <h3 class="caption_beauty"><a href="#">单品祭祀</a></h3>
        <!--<span class="browse">(3.6万人正在浏览)</span>-->
    </div>
     <!--  
        <div class="item_brand"><a href="javascript:;" data-url="/index/activity/show/aid/3217" >
            <img class="fadeInImg" src="../daijisi/huaquanzhiqian_img/huaquanzhiqian.jpg">
            
        </a></div>
        -->
    <div class="item_con clearfix" >
        <dl><dt><a href="javascript:;" data-url="//product/detail?pid=15011264403">
		<img class="fadeInImg"  src="../daijisi/xianhua_img/mianhuai.jpg"></a></dt><dd><p class="txt">缅怀...</p><div class="price clearfix">
		<span class="now_price"><i>￥</i><em>88</em></span>
	    <span>&nbsp;&nbsp;&nbsp;<a href="#" onclick="addgouwuche(5);return false;">  <font color="blue">加入购物车</font></a></span>
		<span class="old_price"><i>￥</i><em>138</em></span>
		</div></dd></dl><dl><dt><a href="javascript:;" data-url="//product/detail?pid=15011264447">
		<img class="fadeInImg"  src="../daijisi/xianhua_img/qiangua.jpg"></a></dt><dd><p class="txt">牵挂...</p><div class="price clearfix">
		<span class="now_price"><i>￥</i><em>138</em></span>
		<span>&nbsp;&nbsp;&nbsp;<a  href="#" onclick="addgouwuche(6);return false;">  <font color="blue">加入购物车</font></a></span>
		<span class="old_price"><i>￥</i><em>188</em></span>
		</div></dd></dl>
    </div>
	<div class="item_con clearfix" >
        <dl><dt><a href="javascript:;" data-url="//product/detail?pid=15011264403">
		<img class="fadeInImg"  src="../daijisi/xianhua_img/zhuisi.jpg"></a></dt><dd><p class="txt">追思...</p><div class="price clearfix">
		<span class="now_price"><i>￥</i><em>188</em></span>
		<span>&nbsp;&nbsp;&nbsp;<a  href="#" onclick="addgouwuche(7);return false;">  <font color="blue">加入购物车</font></a></span>
		<span class="old_price"><i>￥</i><em>238</em></span>
		</div></dd></dl><dl><dt><a href="javascript:;" data-url="//product/detail?pid=15011264447">
		<img class="fadeInImg"  src="../daijisi/xianhua_img/zhuiyi.jpg"></a></dt><dd><p class="txt">追忆...</p><div class="price clearfix">
		<span class="now_price"><i>￥</i><em>68</em></span>
	    <span>&nbsp;&nbsp;&nbsp;<a  href="#" onclick="addgouwuche(8);return false;">  <font color="blue">加入购物车</font></a></span>
		<span class="old_price"><i>￥</i><em>118</em></span>
		</div></dd></dl>
    </div>
</div>
</div>
</div>
<jsp:include page="./commonjsp/bottom_common.jsp" />

</body>
	<script>
		$(function(){
			new Swipe(document.getElementById('banner_box'), {
				speed:500,
				auto:3000,
				callback: function(){
					var lis = $(this.element).next("ol").children();
					lis.removeClass("on").eq(this.index).addClass("on");
				}
			});
		});
		
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
					// 从model里面取数据 并封装
					document.getElementById("count").innerHTML = "<strong style=''>"+json.data+"</strong>";
					return true ;
				} else {
					showMessage('系统异常，请重试','error',2000);
					return false ;
				};
				
		    });
			
			
		};	
	
	</script>

</html>