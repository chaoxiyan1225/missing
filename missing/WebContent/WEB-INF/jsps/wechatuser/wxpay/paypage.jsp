<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--android宽度自适应1:1-->
<meta content="user-scalable=0,width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
<meta http-equiv="pragma" content="no-cache"/>
<meta http-equiv="cache-control" content="no-cache"/>
<meta http-equiv="expires" content="0"/>
<title>微信支付</title>
 <style type="text/css">
   *{margin:0; padding:0;}
body,.all{position:absolute; left:0; top:0; text-align:center; width:100%; height:100%; display:table; color:#fff; font-weight:bold}
.all{background-color: rgba(0,0,0,.8);}
span{display:table-cell; vertical-align:middle}
a{border-radius:3px; display:block; color:#fff; font-size:14px; margin:auto; background:#093; width:70%; height:40px; line-height:40px; text-align:center; font-weight:bold;text-decoration: none;}
</style>
<script>
function callpay()
{
    WeixinJSBridge.invoke('getBrandWCPayRequest',{
    	<c:forEach items="${tmap}" var="val" varStatus="index">
    		<c:if test="${!index.last}">"${val.key }":"${val.value }",</c:if><c:if test="${index.last}">"${val.key }":"${val.value }"</c:if>
	</c:forEach>
    },function(res){
    if(res.err_msg == "get_brand_wcpay_request:ok" ) {
    		alert("支付成功");
    		var gourl = "<%=request.getContextPath()%>/wechatuser/todingdans";
			window.location.href=gourl;
    	}
    });
}
document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
	document.getElementById('all').style.display = 'none';
	callpay();
}, false);
</script>
</head>
  <body>
  	<div id="all" class="all">
		<span>
		<img width="40" src="<%=request.getContextPath()%>/staticfile/wechatimages/movie/admin/images/009.gif" />
		<br />
		支付中，请稍后...
		</span>
		</div>
    <a style="margin-top:40%; margin-bottom:40px" onclick="callpay();">点击支付</a>
	<a href="/userHome">取消支付，返回</a>
  </body>
</html>

