<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="shortcut icon" type="image/x-icon" href="../staticfile/images/xianhua.jpg"/>
<title>我的订单</title>
<jsp:include page="./basic/phone_js_css.jsp"/>
<script type="text/javascript">
	if(/Android (\d+\.\d+)/.test(navigator.userAgent)){
		var version = parseFloat(RegExp.$1);
		if(version>2.3){
			var phoneScale = parseInt(window.screen.width)/640;
			document.write('<meta name="viewport" content="width=640, minimum-scale = '+ phoneScale +', maximum-scale = '+ phoneScale +', target-densitydpi=device-dpi">');
		}else{
			document.write('<meta name="viewport" content="width=640, target-densitydpi=device-dpi">');
		}
	}else{
		document.write('<meta name="viewport" content="width=640, user-scalable=no, target-densitydpi=device-dpi">');
	}
</script>
<style>
*{margin: 0; padding: 0; outline: 0; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); -webkit-box-sizing: border-box;font-family:'微软雅黑'; color:#333}
html{height: 100%; font-size: 100%; -webkit-text-size-adjust: 100%;}
body{margin:0; padding:0; width: 100%; height: 100%; font-family: Helvetica, Arial, sans-serif; font-size: 14px;position: relative; word-break:break-all;}
a{text-decoration: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.35);}

table{border-collapse: collapse; border-spacing: 0;}
th, td, caption{vertical-align: middle;}
textarea{resize: none;}
input, button, select, textarea{outline: none; border-radius: 0; font-family: inherit; font-size: inherit;}
ul,ol,li{list-style: none;}
.blue{color:#3bbaff}
.table{display:table}
.tableSpan{display:table-cell; vertical-align:middle; text-align:center}
.all{position: relative; width: 640px; height: 100%; margin: 0 auto; background:#131313; background-size:cover;}
.all .page{position: absolute; left: 0; top: 0; width:100%;}
.logo{position:absolute; left:15px; top:15px}
.bg{width:100%; height:100%;}
.type{width:280px; position:absolute; bottom:90px;}
.tBg{width:100%;opacity:0.9}
.t1{left:25px;}
.t2{right:25px;}
.tIcon{position:absolute; left:20px; top:20px;}
.t2 .tIcon{top:15px}
.tTxt{position:absolute; right:20px; top:18px;}
.tTxt .p1{font-size:36px; color:#3bbaff}
.tTxt .p1 span{font-size:18px; color:#3bbaff}
.tTxt .p2{font-size:20px;color:#ddd}
.btn{position:absolute; left:19px; top:100px;}
.btn.used{opacity:0.5}
.sell{position:absolute; width:100%; text-align:center; top:180px; color:#ddd; font-size:20px;}
#upDiv{position:absolute; bottom:5px; text-align:center; width:100%;}
.page2{ background:#131313;position: relative; width: 640px; min-height: 100%; margin: 0 auto; background-size:cover;}
.txtBox{position:relative; margin-top:205px; background:#262223; width:600px; margin-left:20px; box-shadow:0 0 4px 4px #000; z-index:3; min-height:600px; padding:10px 0 20px 0;}
.txtBox .oneTxt{padding:20px 0; width:560px; position:relative; border-bottom:solid 1px #131313; margin:5px auto;}
.oneTxt {color:#ccc; font-size:32px; padding:0 5px;}
.oneTxt span{color:#999; font-size:20px; padding:0 2px; margin-top:5px;}
.yongyin {width:100px;text-align:center;line-height:100%;padding:0.3em;font:16px Arial,sans-serif bold;font-style:normal;text-decoration:none;
     margin:2px;vertical-align:text-bottom;zoom:1;outline:none;font-size-adjust:none;font-stretch:normal;border-radius:50px;box-shadow:0px 1px 2px rgba(0,0,0,0.2);
     text-shadow:0px 1px 1px rgba(0,0,0,0.3);color:#fefee9;border:0.2px solid #2299ff;background-repeat:repeat;background-size:auto;background-origin:padding-box;
     background-clip:padding-box;background-color:#3399ff;background: linear-gradient(to bottom, #eeeff9 0%,#3399ff 100%);
}
</style>
</head>

<body>
<div class="all">

<div class="page">
	<img src="../staticfile/wechatimages/movie/phone/images/bgRepeat.png" style="position:absolute; left:0px; top:0;" />
    <img style="position:absolute; top:55px; left:30px; z-index:2;" src="../staticfile/wechatimages/movie/phone/images/mytransaction.png" />	
    <a href="tel:${tel }" style="position:absolute; top:60px; right:30px; z-index:2;"><img src="../staticfile/wechatimages/movie/phone/images/iconCallImg.png" /></a>
    <img src="../staticfile/wechatimages/movie/phone/images/cloroBar.png" style="position:absolute; left:20px; top:200px; z-index:19;" />
    <div style="position:relative; width:100%; background:#131313; position:relative; z-index:10">
        <div class="txtBox">
        	<c:choose>
        		<c:when test="${ empty  cacheTransactions}">
        			<div style="text-align:center; color:#ccc; font-size:32px; margin-top:200px;">亲，您当前暂无订单</div>
        		</c:when>
        		<c:otherwise>
        			<c:forEach items="${cacheTransactions}" var="cacheTransaction">
        			 	<div class="oneTxt">
            				${cacheTransaction.transaction.outTradeNo}
		                       <button type="button" class="yongyin" style="width:100px; height:30px;" onclick="window.location.href='totransactionwechat我 ?recordId=${cacheTransaction.transaction.recordId}'" >
            				   <font>查看详情</font></button>
		            
		                    <br />
               			 <span>
                             ${cacheTransaction.productName}--
	               			 ${cacheTransaction.statusMsg}
	               			<fmt:formatDate value="${cacheTransaction.transaction.recordTime}" pattern="yyyy-MM-dd HH:mm"/> 
	               		</span>
           				 </div>
        			</c:forEach>
        		</c:otherwise>
        	</c:choose>
        </div>
        
    	<a style="height:80px; line-height:80px; color:#666; font-size:18px; text-align:center; display:block;">
       		Power By 简易生活科技	
        </a>
        
	</div>
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
	
</script>

</html>

