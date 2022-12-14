<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="shortcut icon" type="image/x-icon" href="../staticfile/images/xianhua.jpg"/>
<title>购买页面</title>
<script type="text/javascript">
	if (/Android (\d+\.\d+)/.test(navigator.userAgent)) {
		var version = parseFloat(RegExp.$1);
		if (version > 2.3) {
			var phoneScale = parseInt(window.screen.width) / 640;
			document
					.write('<meta name="viewport" content="width=640, minimum-scale = '+ phoneScale +', maximum-scale = '+ phoneScale +', target-densitydpi=device-dpi">');
		} else {
			document
					.write('<meta name="viewport" content="width=640, target-densitydpi=device-dpi">');
		}
	} else {
		document
				.write('<meta name="viewport" content="width=640, user-scalable=no, target-densitydpi=device-dpi">');
	}
</script>
<style>
* {
	margin: 0;
	padding: 0;
	outline: 0;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	-webkit-box-sizing: border-box;
	font-family: '微软雅黑';
	color: #333
}

html {
	height: 100%;
	font-size: 100%;
	-webkit-text-size-adjust: 100%;
}

body {
	margin: 0;
	padding: 0;
	width: 100%;
	height: 100%;
	font-family: Helvetica, Arial, sans-serif;
	font-size: 14px;
	position: relative;
	word-break: break-all;
}

a {
	text-decoration: none;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0.35);
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}

th,td,caption {
	vertical-align: middle;
}

textarea {
	resize: none;
}

input,button,select,textarea {
	outline: none;
	border-radius: 0;
	font-family: inherit;
	font-size: inherit;
}

ul,ol,li {
	list-style: none;
}

.blue {
	color: #3bbaff
}

.table {
	display: table
}

.tableSpan {
	display: table-cell;
	vertical-align: middle;
	text-align: center
}

.all {
	position: relative;
	width: 640px;
	height: 100%;
	margin: 0 auto;
	background: #000;
	background-size: cover;
}

.all .page {
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	display: none;
}

.logo {
	position: absolute;
	left: 15px;
	top: 15px
}

.bg {
	width: 100%;
	height: 100%;
}

.type {
	width: 280px;
	position: absolute;
	bottom: 90px;
}

.tBg {
	width: 100%;
	opacity: 0.9
}

.t1 {
	left: 25px;
}

.t2 {
	right: 25px;
}

.tIcon {
	position: absolute;
	left: 20px;
	top: 20px;
}

.t2 .tIcon {
	top: 15px
}

.tTxt {
	position: absolute;
	right: 20px;
	top: 18px;
}

.tTxt .p1 {
	font-size: 36px;
	color: #3bbaff
}

.tTxt .p1 span {
	font-size: 18px;
	color: #3bbaff
}

.tTxt .p2 {
	font-size: 20px;
	color: #ddd
}

.btn {
	position: absolute;
	left: 19px;
	top: 100px;
}

.btn.used {
	opacity: 0.5
}

.sell {
	position: absolute;
	width: 100%;
	text-align: center;
	top: 180px;
	color: #ddd;
	font-size: 20px;
}

#upDiv {
	position: absolute;
	bottom: 5px;
	text-align: center;
	width: 100%;
}

.page2 {
	background: #131313;
	position: relative;
	width: 640px;
	min-height: 100%;
	margin: 0 auto;
	background-size: cover;
}

.txtBox {
	position: relative;
	margin-top: 205px;
	background: #262223;
	width: 600px;
	margin-left: 20px;
	box-shadow: 0 0 4px 4px #000;
	z-index: 3;
	min-height: 600px;
	padding: 10px 0;
}

.txtBox .oneTxt {
	padding: 20px 0;
	width: 560px;
	position: relative;
	border-bottom: solid 1px #131313;
	margin: 5px auto;
}

.txtBox div span {
	display: block;
	width: 40px;
	height: 40px;
	border-radius: 20px;
	background: #131313;
	text-align: center;
	line-height: 40px;
	color: #ddd;
	font-size: 20px;
	position: absolute;
	left: 0px;
	top: 13px;
}

.txtBox div div {
	font-size: 24px;
	color: #ddd;
	padding-left: 50px;
}

.swipe {
	overflow: hidden;
	visibility: hidden;
	position: relative;
}

.swipe-wrap {
	overflow: hidden;
	position: relative;
}

.swipe-wrap>figure {
	float: left;
	width: 100%;
	position: relative;
}

.bottom {
	width: 100%;
	position: absolute;
	bottom: 0;
}

.bottom1 {
	height: 80px;
	width: 100%;
}

.bottom2 {
	height: 100px;
	width: 100%;
	background: #121212
}

._bottom1 span {
	color: #fff;
	font-size: 30px;
	width: 100%;
}

._bottom1,._bottom2 {
	height: 100%;
	width: 50%;
	float: left;
	box-sizing: border-box;
}

.font1 {
	font-size: 36px;
	color: #3bbaff;
	line-height: 25px
}

.font1 span {
	font-size: 18px;
	color: #3bbaff
}

.font2 {
	font-size: 20px;
	color: #ddd
}

.bottom1 {
	background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#42aedb),
		to(#0263e8));
	background-image: -webkit-linear-gradient(top, #42aedb, #0263e8);
}

._bottom1 {
	height: 40px;
	margin-top: 20px;
}

.sanjiao {
	width: 0px;
	height: 0px;
	border-top: 170px solid transparent;
	border-bttom: 170px solid transparent;
	border-left: 170px solid #121212;
	font-size: 0px;
	line-height: 0px;
	-webkit-transform: translate(0px, 0px);
	position: absolute;
	left: 0px;
	bottom: 180px;
}

div.sanjiao {
	-webkit-animation: sanjiaoAnimate 3.0s infinite;
}

@
-webkit-keyframes sanjiaoAnimate { 50% {
	-webkit-transform: translate(-15px, 15px);
}

100%
{
-webkit-transform
:translate
(0px
,
0
px
);
}
}
.sanjiaoCover {
	width: 220px;
	height: 120px;
	position: absolute;
	left: -70px;
	bottom: 160px;
	-webkit-transform: rotate(45deg);
	opacity: 0;
	z-index: 9
}

.pIcon {
	position: absolute;
	left: 5px;
	bottom: 185px;
	z-index: 9
}

.main {
	position: fixed;
	left: 0;
	display: none;
	top: 0;
	width: 100%;
	height: 100%;
	z-index: 18
}

.bCover {
	position: absolute;
	left: 0;
	top: 0;
	z-index: 18;
	background: rgba(0, 0, 0, 0.6);
	width: 100%;
	height: 100%;
}

.win {
	width: 500px;
	padding: 0px;
	height: 300px;
	background: #fff;
	border-radius: 4px;
	position: absolute;
	left: 70px;
	bottom: 300px;
	z-index: 19;
	box-shadow: 0 0 10px 2px #333
}

.win_title {
	font-size: 32px;
	margin: 40px 0 30px 0;
	text-align: center;
}

.win_math {
	width: 300px;
	margin: 0 auto;
	height: 90px;
}

.win_math div {
	width: 300px;
	float: left;
	height: 60px;
	font-size: 30px;
	line-height: 50px;
	text-align: center;
	display: block;
	border: solid 1px #ccc
}

.win_math div:nth-child(1) {
    border-left: 0;
	border-right: 0;
	text-align: center;
	font-size: 32px;
	color: #3bbaff;
	line-height: 60px;
}

.win_btn {
	width: 80%;
	height: 70px;
	display: block;
	margin: 0 auto;
	background: #3bbaff;
	text-align: center;
	line-height: 70px;
	color: #fff;
	font-size: 32px;
}
</style>
<style>
.loading-out {
	width: 60px;
	height: 60px;
	margin: auto;
	-webkit-perspective: 120px;
}

.loading-box {
	width: 60px;
	height: 60px;
	position: relative;
	-webkit-transform-style: preserve-3d;
	-webkit-transition: 2s all;
	-webkit-transform: translateZ(-30px) rotateY(30deg);
}

.loading-box div {
	position: absolute;
	width: 100%;
	height: 100%;
	font-size: 24px;
	line-height: 60px;
	text-align: center;
	font-weight: bold;
	color: #fff
}

.loading-box div:nth-child(1) {
	left: 0px;
	top: -60px;
	background: red;
	-webkit-transform-origin: bottom;
	-webkit-transform: translateZ(30px) rotateX(90deg);
}

.loading-box div:nth-child(2) {
	left: -60px;
	top: 0px;
	background: blue;
	-webkit-transform-origin: right;
	-webkit-transform: translateZ(30px) rotateY(-90deg);
}

.loading-box div:nth-child(3) {
	left: 0px;
	top: 0px;
	background: #3C0;
	-webkit-transform: translateZ(30px);
}

.loading-box div:nth-child(4) {
	left: 60px;
	top: 0px;
	background: #30C;
	-webkit-transform-origin: left;
	-webkit-transform: translateZ(30px) rotateY(90deg);
}

.loading-box div:nth-child(5) {
	left: 0px;
	top: 60px;
	background: green;
	-webkit-transform-origin: top;
	-webkit-transform: translateZ(30px) rotateX(-90deg);
}

.loading-box div:nth-child(6) {
	left: 0px;
	top: 0px;
	background: #900;
	-webkit-transform: translateZ(-30px) rotateY(-180deg);
}

.loading-box {
	-webkit-animation: loadingAnimate 8.0s linear infinite;
}

@
-webkit-keyframes loadingAnimate { 100% {
	-webkit-transform: translateZ(-30px) rotateY(-1440deg);
}

}
.loading-out:hover .loading-box {
	-webkit-transform: translateZ(-25px) rotateY(-360deg);
}
</style>

<script src="<%=request.getContextPath()%>/staticfile/wechatimages/movie/phone/js/swipe.js"></script>
<script
	src="<%=request.getContextPath()%>/staticfile/wechatimages/movie/phone/js/jquery-1.10.2.min.js"></script>
<script>
	(function() {
		var support = (window.Modernizr && Modernizr.touch === true)
				|| (function() {
					return !!(('ontouchstart' in window) || window.DocumentTouch
							&& document instanceof DocumentTouch);
				})();
		var config = {
			start : support ? 'touchstart' : 'mousedown',
			move : support ? 'touchmove' : 'mousemove',
			end : support ? 'touchend' : 'mouseup'
		}
		var handler = {
			addEvent : function(e, type, fn, capture) {
				e.addEventListener(type, fn, !!capture);
			},
			removeEvent : function(e, type, fn, capture) {
				e.removeEventListener(type, fn, !!capture);
			}
		}
		window.touchSwipe = function(data) {
			var able = true;
			var index = 0, moveLen = 50, type = '|', speed = 0.3, scale = false, val = $(
					window).height(), start, time, name = 'pageY', len, obj = document
					.getElementById(data.id), page = $(obj).find(
					'.' + data.page), change = function(bool) {
				if (bool)
					index = index + 1 > page.length - 1 ? 0 : index + 1;
				else
					index = index - 1 >= 0 ? index - 1 : page.length - 1;
			}, getNext = function() {
				return page[len > 0 ? (index - 1 < 0 ? page.length - 1
						: index - 1) : (index + 1 > page.length - 1 ? 0
						: index + 1)];
			}
			this.lock = function(bool) {
				able = !bool;
			}
			this.handleEvent = function(e) {
				switch (e.type) {
				case 'touchstart':
				case 'mousedown':
					this.start(e);
					break;
				case 'touchmove':
				case 'mousemove':
					this.move(e);
					break;
				case 'touchend':
				case 'mouseup':
					this.end(e);
					break;
				}
			}
			this.init = function() {
				if (!able)
					return e.preventDefault();
				handler.addEvent(obj, config.start, this);
				$(page[index]).css({
					'z-index' : 10
				}).show();
			}
			this.start = function(e) {
				if (e.target.tagName == 'A')
					return e.preventDefault();
				len = 0;
				able = true;
				var t = support ? e.touches[0] : e;
				start = t[name];
				time = new Date().getTime();
				handler.addEvent(obj, config.move, this);
				handler.addEvent(obj, config.end, this);
			}
			this.move = function(e) {
				var t = support ? e.touches[0] : e;
				len = t[name] - start;
				if (index == 1 && $(window).scrollTop() > 0)
					return able = false;
				if (index == 1 && len < 0)
					return able = false;
				e.preventDefault();
				if (index == 0 && len > 0)
					return able = false;
				if (!able)
					return;
				move();
			}
			this.end = function(e) {
				if (!able)
					return;
				var t = support ? e.changedTouches[0] : e;
				var _time = new Date().getTime() - time;
				if (_time < 50 && Math.abs(len) > 20 || Math.abs(len) > moveLen)
					animate();
				else
					back();
				able = false;
				handler.removeEvent(obj, config.move, this);
				handler.removeEvent(obj, config.end, this);
			}
			this.kill = function() {
				handler.removeEvent(obj, config.start, this);
				handler.removeEvent(obj, config.move, this);
				handler.removeEvent(obj, config.end, this);
				able = false;
			}
			this.init();

			var move = function() {
				var next = getNext();
				var webkitTransform = scale ? translate(true) + ' scale('
						+ scale() + ')' : translate(true);
				$(page[index]).css({
					'z-index' : 10,
					'-webkit-transform' : webkitTransform
				}).show();
				$(next).css({
					'z-index' : 11,
					'-webkit-transform' : translate(false)
				}).show();
			}
			var translate = function(b1, b2) {
				var num = len > 0 ? -1 : 1;
				var _translate;
				if (b1) {
					var percent = Math.abs(len / val);
					_translate = (num * val * -1) * percent / 2;
					if (!scale)
						_translate = len;
				} else {
					_translate = (num * val) + len;
					if (b2)
						_translate = num * val;
				}
				return 'translate(0,' + _translate + 'px)';
			}
			var scale = function() {
				var percent = Math.abs(len / val);
				return 1 - (percent / 2);
			}
			var self = this;
			var animate = function() {
				$(page[index]).css({
					'-webkit-transition' : speed + 's'
				});
				var num = len > 0 ? -1 : 1;
				var _translate = val * num * -1;
				if (scale)
					_translate *= 0.25;
				_translate = type == '|' ? 'translate(0,' + _translate + 'px)'
						: 'translate(' + _translate + 'px,0)';
				_translate = _translate + (scale ? ' scale(0.5)' : '');
				page[index].style.webkitTransform = _translate;

				var next = getNext();
				$(next).css({
					'-webkit-transition' : speed + 's',
					'-webkit-transform' : 'translate(0,0)'
				});
				var a1 = page[index], a2 = next;
				change(num == 1 ? true : false);

				setTimeout(function() {
					$(a1).css({
						'-webkit-transition' : '0'
					}).hide();
					$(a2).css({
						'-webkit-transition' : '0'
					});
					if (data.callback)
						data.callback.call(self, index);
				}, speed * 1000);
			}
			var back = function() {
				var next = getNext();
				$(page[index]).css({
					'-webkit-transition' : speed + 's',
					'-webkit-transform' : 'translate(0,0)'
				});
				$(next).css({
					'-webkit-transition' : speed + 's',
					'-webkit-transform' : translate(false, true)
				});
				setTimeout(function() {
					$(page[index]).css({
						'-webkit-transition' : '0'
					});
					$(next).css({
						'-webkit-transition' : '0'
					});
				}, speed * 1000);
			}
			this.slide = function(e) {
				len = -1;
				var next = getNext();
				$(next).css(
						{
							'z-index' : 11,
							'-webkit-transform' : 'translate(0,'
									+ $(window).height() + 'px)'
						}).show();
				setTimeout(function() {
					animate();
				}, 0);
			}
		}
	})();

	var initUp = function() {
		var nextFrame = (function() {
			return window.requestAnimationFrame
					|| window.webkitRequestAnimationFrame
					|| window.mozRequestAnimationFrame
					|| window.oRequestAnimationFrame
					|| window.msRequestAnimationFrame
					|| function(callback, delay) {
						return setTimeout(callback, delay || 15);
					}
		})();
		var cancelFrame = (function() {
			return window.cancelRequestAnimationFrame
					|| window.webkitCancelAnimationFrame
					|| window.webkitCancelRequestAnimationFrame
					|| window.mozCancelRequestAnimationFrame
					|| window.oCancelRequestAnimationFrame
					|| window.msCancelRequestAnimationFrame || clearTimeout
		})();
		var e = document.getElementById('upDiv');
		var bottom = 5;
		var index = 0.5;
		var fn = function() {
			bottom += index;
			e.style.bottom = bottom + 'px';
			if (bottom > 40)
				index = -0.5;
			else if (bottom < 5)
				index = 0.5;
			nextFrame(fn);
		}
		fn();
	}

	window.onload = function() {
		init();
		initSwipe();
	}

	var init = function() {
		window.t = new touchSwipe({
			id : 'box',
			page : 'page'
		});
	}
	var initSwipe = function() {
		var slider1 = Swipe(document.getElementById('bgBox'), {
			continuous : true,
			auto : 3500,
			callback : function(pos) {
			},
			transitionEnd : function(index) {
			}
		});
	}

	var loading = function(bool) {
		if (bool == false)
			return $('#loadingDiv').remove();
		var html = '<div id="loadingDiv" style="display:table; width:100%; height:100%; position:absolute; text-align:center; left:0; top:0; background:#fff; z-index:999">';
		html += '<span style="display:table-cell; vertical-align:middle;">';
		html += '<div class="loading-out">';
		html += '<div class="loading-box">';
		html += '<div></div><div>院</div><div>大</div><div>地</div><div></div><div>影</div>';
		html += '</div></div></span></div>';
		$(html).appendTo($('#box'));

		$('#loadingDiv').css({
			height : $(window).height()
		});
	}
	var move = function(e) {
		e.slide = e.slide == null ? false : e.slide;
		if (e.slide)
			return;
		e.slide = true;
		t.slide();
		setTimeout(function() {
			e.slide = false;
		}, 300);
	}

	var abc = {
		buy : function() {
			$('.main').css({
				height : $(window).height()
			});
			$('.main .win_title').html('请选择服务类型');
			$('.main').show();
		},
		add : function() {
			var num = parseInt($('.win_math div')[1].innerHTML.replace('个', ''));
			num++;
			$('.win_math div')[1].innerHTML = num + '个';
		},
		del : function() {
			var num = parseInt($('.win_math div')[1].innerHTML.replace('个', ''));
			if (num == 1)
				return;
			num--;
			$('.win_math div')[1].innerHTML = num + '个';
		},
		pay : function() {
			var type =  document.getElementById("serviceType").value;
		
			var gourl = "<%=request.getContextPath()%>/wechatuser/buyqueueorder?mchid="+${mchid}+"&type="+type;
			window.location.href = gourl;
		},
		close : function() {
			$('.main').hide();
			$('.win_math div')[1].innerHTML = 1 + '个';
		}
	}
</script>
</head>

<body>
	<div class="all" id="box">

		<div class="page" style="height: 100%; overflow: hidden">
			<div class="bgBox swipe" id="bgBox"
				style="width: 100%; height: 100%;">
				<div class="swipe-wrap" >
					<!--产品展示-->
					<!-- 
					<c:forEach items="${files }" var="file">
						<figure>
						<img class="bg" src="${file.v_src }" /></figure>
					</c:forEach>
					 -->
					 <figure>
					 <img class="bg" src="<%=request.getContextPath()%>/staticfile/wechatimages/movie/phone/images/posterBK.jpg"/>
				</div>
			</div>
			<style>
</style>
			<div class="main">
				<div class="bCover" onclick="abc.close()"></div>
				<div class="win">
					<div class="win_title">请选择服务种类</div>
					<div>
						<div class="win_math">
							<div >
                               <select id="serviceType">
                                  <c:forEach  items="${types}" var="type">
                                      <option value="${type.typeStr}">${type.typeMsg}</option>
                                  </c:forEach>
		                          </select>
                            </div>
							
						</div>
					</div>
					<div class="win_btn" onclick="abc.pay(this)">0元取号</div>
				</div>
			</div>
			<div class="bottom" style="text-align:center;">
				<div class="bottom1" style="text-align:center;">
					<button onclick="abc.buy()" style="width:100%;height:100%;background:#00ccff;border:red;font-size:50px;">点我取号</button>
				</div>
				<div class="bottom2">
				</div>
			</div>
		</div>

		<div class="page" style="background: #131313;">
			<div
				style="width:100%; height:100%; position:absolute; left:0; top:0; z-index:1; background:url(<%=request.getContextPath()%>/staticfile/wechatimages/movie/phone/images/bgRepeat.png)"></div>
			<img style="position: absolute; top: 50px; left: 30px; z-index: 2;"
				src="<%=request.getContextPath()%>/staticfile/wechatimages/movie/phone/images/icondiscription.png" />
			<a href="tel:#"
				style="position: absolute; top: 60px; right: 30px; z-index: 2;"><img
				src="<%=request.getContextPath()%>/staticfile/wechatimages/movie/phone/images/iconCallImg.png" /></a>
			<img
				src="<%=request.getContextPath()%>/staticfile/wechatimages/movie/phone/images/cloroBar.png"
				style="position: absolute; left: 20px; top: 200px; z-index: 19;" />
			<div
				style="position: relative; width: 100%; position: relative; background: #000">
				<div class="txtBox">
					<table>
					<tr>
						<div class="oneTxt">
							<span>1</span>
							<div>您在本平台所购排号码，将自动发送到您的微信号上；</div>
						</div>
						<div class="oneTxt">
							<span>2</span>
							<div>取号码只支持到店服务，该平台在2020-12-31号前免费取号；</div>
						</div>
						<div class="oneTxt">
							<span>3</span>
							<div>请在我的取号码里面查看详情并合理安排到店时间，仅支持微信取号，每家理发店对每个微信号仅支持取号一次，请勿重复取号；</div>
						</div>
						<div class="oneTxt">
							<span>4</span>
							<div>为了能够顺利向您推送排队信息，请务必关注代祭祀公众号！</div>
						</div>
					</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

