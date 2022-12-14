<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="">
<head>
<meta charset="UTF-8" />
<meta content="IE=edge" http-equiv="X-UA-Compatible" />
<meta name="keywords" />
<meta content="云祭祀平台，墓地,公墓,墓地风水,昌平墓地,公墓,陵园,墓地网,墓地价格,购墓补贴,周边墓地,墓地团购,地图看墓"
	name="description" />
<meta content="telephone=no, email=no" name="format-detection" />
<meta content="width=device-width, initial-scale=1, maximum-scale=1"
	name="viewport" />
<meta content="66c08037a980c793a02f295e8e66037c_1535333012"
	name="shenma-site-verification" />
<title>云祭思平台</title>
<meta content="width=device-width, initial-scale=1, maximum-scale=1"
	name="viewport" />
<meta content="66c08037a980c793a02f295e8e66037c_1535333012"
	name="shenma-site-verification" />
<link rel="shortcut icon" type="image/x-icon"
	href="/favicon.ico;jsessionid=362D40EA4F202DCB840BB9FB53AAE247" />
<script>
	
</script>

<script src="../yikong/js/shipei.js"></script>
<link rel="stylesheet" href="../yikong/css/swiper.css" />
<link rel="stylesheet" href="../yikong/css/index.css" />
<link rel="stylesheet" href="../yikong/css/reset.css" />
<link rel="shortcut icon" type="image/x-icon"
	href="../staticfile/images/xianhua.jpg" />
<!--begin::页面样式 -->

<!--end::页面样式 -->
<script src="../yikong/js/jquery-3.0.0.min.js"></script>
<script src="../yikong/js/swiper-3.4.2.jquery.min.js"></script>
<script>
	var time_range_now = function(beginTime, endTime) {
		var nowdate = Math.round(new Date() / 1000);
		console.log(nowdate);

		if (nowdate<endTime && nowdate > = beginTime) {
			console.log('添加样式9999');
			$("html").css({
				'-webkit-filter' : 'grayscale(100%)',
				'-moz-filter' : 'grayscale(100%)',
				'-ms-filter' : 'grayscale(100%)',
				'-o-filter' : 'grayscale(100%)'
			});
		}
	};
	// time_range_now(1536595200,1536681599);
	time_range_now(1544630400, 1544716799);
</script>
</head>
<script>
	/*]]>*/

	$(function() {
		// 点击右侧面包屑功能
		var nav = 1;
		$('.nav .right').click(function() {
			if (nav == 1) {
				$('.mbx').fadeIn();
				$('body').css({
					overflow : 'hidden'
				});
				nav = 0;
			} else {
				$('.mbx').fadeOut();
				$('body').css({
					overflow : 'initial'
				});
				nav = 1;
			}
		});

		$('.mbx').click(function() {
			$(this).fadeOut();
			$('body').css({
				overflow : 'initial'
			});
		});

		$('.nav .left span').click(function() {
			$('.dingw').slideDown();
			$('body').css({
				overflow : 'hidden'
			});
		});
		$('http://m.yiko.org/.dingw .hide').click(function() {
			$('.dingw').slideUp();
			$('body').css({
				overflow : 'initial'
			});
		});

		$('.nav .center').click(function() {
			$('.sousu').fadeIn();
			$('body').css({
				overflow : 'hidden'
			});
		});
		$('.sousu .shur span').click(function() {
			$('.sousu').fadeOut();
			$('body').css({
				overflow : 'initial'
			});
		});

		$('.fanhui .nav .left img.fanhui').click(function() {
			history.back(-1);
		});
	});

	function search(keywords) {
		console.log(keywords);
		var url = "/garden/search?keywords=" + keywords;
		location = url;
	}
</script>
<body>
	<div align="center" id="index">
		<div>
			<!-- 导航 -->
			<div class="nav">
				<div class="left">
					<div>
						<img alt="" src="../yikong/img/s-dw.png" /> <span class="dw">包头市</span>
						<img alt="" class="icon" src="../yikong/img/s-sjdw.png" />
					</div>
				</div>
				<div class="right">
					<img alt="" src="../yikong/img/s-dh.png" />
				</div>
				<div class="center wenben"></div>


				<!-- 定位城市模块 -->
				<div class="dingw">
					<div class="hide"></div>
					<div class="dingwBox">
						<h3>
							<span></span> &nbsp;&nbsp;选择城市&nbsp;&nbsp; <span></span>
						</h3>
						<div class="dangq">
							<img alt="" src="../yikong/img/icon_location.png" /> <span
								class="dw">当前定位城市：包头市</span>
						</div>
						<div class="dangq">
							<h2 class="tujianH2">
								<span></span>开通城市
							</h2>
							<div>
								<span> <a href="#">包头</a>
								</span>
							</div>
						</div>
						<img alt="" class="sy_csjy" src="../yikong/img/sy_csjy.png" />
					</div>

				</div>
			</div>
			<!--  <div class="tiShi" th:if="${session.ifLocate && ((session.areaCode != '110000')||(session.areaCode != '310000'))}">您所在的城市暂无数据，默认定位为北京市</div>-->
			<!-- banner -->
			<div class="banner">
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<a href="#">
								<div
									style="background: url(../yikong/img/logo1.jpg) center; background-size: cover;"></div>
							</a>
						</div>
						<div class="swiper-slide">
							<a href="#">
								<div
									style="background: url(../yikong/img/logo2.jpg) center; background-size: cover;"></div>
							</a>
						</div>
					</div>
					<div class="swiper-pagination"></div>
				</div>
			</div>

			<!--        <div>
            <p th:text="${session.name}"></p>
            <p th:text="${age}"></p>
        </div>-->

			<!-- 产品列表 -->
			<div class="list bgF">

				<!--购墓优势-->
				<div class="youshi">
					<div>
						<a href="#"> <img alt="价格透明" src="../yikong/img/s-jgtm.png" />
						</a> 价格透明
					</div>
					<div>
						<img alt="诚信经营" src="../yikong/img/s-cxjy.png" /> 诚信经营
					</div>
					<div>
						<img alt="亲情服务" src="../yikong/img/s-qqfw.png" /> 亲情服务
					</div>
				</div>

				<ul>
					<li><a href="./fuluyuan"> <img alt="陵园墓地"
							src="../yikong/img/s-lymd.png" /><br /> 陵园墓地
					</a></li>

					<li><a href="./daijisi"> <img alt="代祭祀"
							src="../yikong/img/s-by.png" /><br /> 代祭祀
					</a></li>
					
					<li><a href="./jingshi"> <img alt="生命晶石"
							src="../yikong/img/s-bzbk.png" /><br /> 生命晶石
					</a></li>
					<li><a href="./anxitang"> <img alt="安息堂续费"
							src="../yikong/img/s-gmgw.png" /><br /> 安息堂续费
					</a></li>
					<li><a href="./huimin"> <img alt="惠民政策"
							src="../yikong/img/s-gmlc.png" /><br /> 惠民政策
					</a></li>
			
				</ul>
			</div>

			<!-- 推荐陵园 -->
			<div class="tuijian bgF">
				<h2 class="tujianH2">
					<span></span>推荐·陵园墓地 <a href="./fuluyuan"> 查看更多 </a>
				</h2>
				<img alt="推荐·陵园墓地" class="title_img"
					src="../yikong/img/s-yzlyqxk.jpg" />
				<ul class="md binzang-list bzyp">
					<li><a href="./fuluyuan">
							<div class="minHeight">
								<div class="biaoqian">
									<img alt="" src="../yikong/img/lable_dijia.png" /> <img alt=""
										src="../yikong/img/lable_rexiao.png" /> <img alt=""
										src="../yikong/img/lable_tuijian.png" /> <img alt=""
										src="../yikong/img/lable_youzhi.png" />
								</div>
								<img alt="福禄园公墓" src="../yikong/img/fuluyuan.jpg" />
								<div class="text">
									<p>
										<span>福禄园公墓</span> <i class="diqu">[</i><i class="diqu">青山区</i><i
											class="diqu">]</i>

									</p>
									<i class="miaoshu">包头市大青山陵园是包头市墓园与殡仪馆配套之陵园。是国家和自治区以及包头市殡葬协会会员单位。是受理骨灰盒安葬业务合法的大型公墓。
										大青山陵园占地千余亩，位于包头市区正北方，地貌呈座椅型，东西北三方倚靠大青山，面对黄河</i>
									<div class="tedian">
										<span>风水宝地</span> <span>大师选穴</span> <span>免费专车</span>
									</div>
									<span> <span class="qsj">起售价:</span> ￥0.7万
									</span>
								</div>
							</div>
					</a></li>
				</ul>
				<div class="ckgd">
					<a href="#" tppabs="http://m.yiko.org/garden/list">显示更多</a>
				</div>
			</div>
			<!-- 推荐殡葬用品 -->
			<div class="tuijian bgF" id="bzyp">
				<h2 class="tujianH2">
					<span></span>推荐·代祭祀 <a href="./daijisi"
						tppabs="http://m.yiko.org/funeral/list"> 查看更多 </a>
				</h2>
				<img alt="推荐·殡仪" class="title_img" src="../yikong/img/s-ytlbytc.jpg"
					tppabs="http://m.yiko.org/../yikong/img/s-ytlbytc.jpg;jsessionid=362D40EA4F202DCB840BB9FB53AAE247" />
				<!-- 殡仪套餐 -->
				<div class="bysj" style="margin-top: .2rem; padding-bottom: .1rem;">
					<div class="bytc">
						<ul>
							<li><a href="#" tppabs="http://m.yiko.org/taocan/detail/7">
									<img alt="安乐套餐 | 4990套餐" src="../yikong/img/xianhua.jpg"
									tppabs="https://img.yiko.org/user/download/0e55f4ccece4c4fd20f23fefc05e2c0d.jpg" />
									<div>
										<span class="title">代鲜花 | 68元起</span><br /> <span class="bor">大花束</span>
										<span class="bor">优惠5折</span> <span class="jiag">￥68</span>
									</div>
							</a></li>
						</ul>
					</div>
				</div>

			</div>

			<!-- 推荐文章 -->
			<div class="tuijian bgF">
				<h2 class="tujianH2">
					<span></span>推荐·文章
				</h2>
				<img alt="推荐·文章" class="title_img" src="../yikong/img/s-qmbzzs.jpg" />
				<ul class="wenZ">
					<!--文章-->
					<li><a
						href="https://mp.weixin.qq.com/s/BpdJQVLCzn0uINmsx6KquQ"
						tppabs="http://m.yiko.org/article/2149">
							<div class="left">
								<span class="ms"> <i>平台资讯</i> <span>福禄园公墓简介</span>
								</span> <span class="miaoshu">福禄园公墓包头市最大的生态公墓</span> <span class="le">
									<img alt="阅读量" class="" src="../yikong/img/s-wzyd.png"
									tppabs="http://m.yiko.org/../yikong/img/s-wzyd.png;jsessionid=362D40EA4F202DCB840BB9FB53AAE247" />
									<span class="yd">7499</span> <img alt="时间" class=""
									src="../yikong/img/s-wzsj.png"
									tppabs="http://m.yiko.org/../yikong/img/s-wzsj.png;jsessionid=362D40EA4F202DCB840BB9FB53AAE247" />
									<span>2019-04-08</span>
								</span>
							</div>
							<div class="right">
								<img alt="福禄园公墓" src="../yikong/img/fuluyuan.jpg"
									tppabs="https://img.yiko.org//user/download/f6d70d5f77f775fab47d846967570155.jpg_195x195" />
							</div>
					</a></li>
				</ul>
			</div>
			<!--底部公司介绍-->
			<div>
				<style>
.jiejian {
	background: #90EE90;
	padding: .5rem 0px .45rem 0rem;
	text-align: center;
}

.jiejian img {
	width: 3rem;
}

.jiejian h2 {
	font-size: .3rem;
	color: #AA770F;
	margin: .25rem 0rem .4rem;
	font-weight: inherit;
}

.jiejian p {
	padding: 0 .5rem;
	font-size: .25rem;
	color: #BAA271;
	word-break: break-all;
}
</style>
				<div class="jiejian">
					<h2>
						云祭思<br> 一站式殡葬服务平台<br> 融合风水大师选墓穴等专业服务<br>
						包头市殡仪指定官方合作平台
					</h2>
				</div>
			</div>
		</div>
	</div>
	<div class="onload">
		<script src="../yikong/js/iconfont.js"></script>
		<script src="../yikong/js/jquery.tmpl.min.js"></script>
	</div>
	<div>
		<div class="but"></div>
	</div>
</body>
</html>