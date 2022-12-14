
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
<title>墓位号列表</title>
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
</head>

<body style="padding-bottom: 45px;" class=" hPC">
<!--客户端下载的图片-->
		<header id="header" class="u-header clearfix">
	    <!--返回按钮根据程序判断来源，返回上一级-->
		 		 <!-- 非微信扫码进入的用户 -->
	    <div class="u-hd-left f-left">
                <a href="./wode" class="J_backToPrev"><span class="u-icon i-hd-back"></span></a>
                </div>
			     <div class="u-hd-tit"><span>墓位号列表</span></div>
		       	    
      		 	</header>
	

<a href="./addMuweihao" data-addaddress="true" class="textlink fl">新增墓位号+</a>
    <div class="clear"></div>
     <c:choose>
	         <c:when test="${ empty  muweihaos}">
	            <div class="u-addrbox userdiv" >
	             <div class="addr_box">
	                                       您还未添加墓位号！
	            </div>
	           </div>
	                                    
	          </c:when>
	          <c:otherwise>
			    <c:forEach items="${muweihaos}" var="muweihao">
			     <div class="u-addrbox userdiv" id="${muweihao.muweihao}">
				  <div class="addr_box">
				    <p>逝者姓名：${muweihao.deadName}<span class="addr_tel">墓位号：${muweihao.muweihao}</span><span class="addr_tel">联系方式：${muweihao.jisaoTel}</span></p>
				    <p class="clear"></p>
				    <p>备注说明：${muweihao.jisaoBeizhu}</p>
				    <span class="moren" style="display:none;">默认</span>  </div>
				    <div class="addr_ope">
				       <a href="javascript:;" onclick="deleteMuweihao('${muweihao.muweihao}');return false;" data-addressid="51318775" data-address="del" ><span class="delete"></span>删除</a>
				       <a href="updateMuweihao?uuid=${muweihao.uuid}" ><span class="edi"></span>修改</a>
				    </div>
				</div>
				</c:forEach>
			    
	          </c:otherwise>
	    </c:choose>
    
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

 var deleteMuweihao = function(muweihao){
	if(muweihao.length == 0)
    {
		showMessage("墓位号未选择",'error',1000);
    	return false;
    }

	$.post("<%=request.getContextPath()%>/wechatuser/muweihao/del",{muweihao:muweihao},function(data){
		var json = JSON.parse(data);
		if (json.isResultOk) {
			showMessage('删除成功','success',2000);
			// 从model里面取数据 并封装
			document.getElementById(muweihao).innerHTML = "";
			window.location.href="./muweihao";
			return true ;
		} else {
			showMessage('系统异常，请重试','error',2000);
			return false ;
		};
		
    });
};	


var updateMuweihao = function(muweihao){
	if(muweihao.length == 0)
    {
		showMessage("墓位号未选择",'error',1000);
    	return false;
    }
	

	location.href = encodeURI("<%=request.getContextPath()%>/wechatuser/updateMuweihao?muweihao="+muweihao);
};	
</script>
<!--以下是翻页的样式-->
<!--以下是翻页的样式-->
<div class="pagediv clearfix">
<div class="fl page">
        <span>${muweihaoCnt}/${muweihaoCnt}</span>
</div>
</div>

<jsp:include page="./commonjsp/bottom_common.jsp" />

</body></html>