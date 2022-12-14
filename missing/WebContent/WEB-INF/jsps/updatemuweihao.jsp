
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta content="telephone=no" name="format-detection">
<meta name="baidu-site-verification" content="t7oDT96Amk">
<title>修改墓位号</title>
<meta content="" name="keywords">
<meta content="" name="description">
<meta name="sogou_site_verification" content="G7nmLR75yc">
<meta name="baidu-tc-cerfication"
	content="0a8c6d28b570b218f78510c29be4529b">
<meta name="360-site-verification"
	content="8b6121969d78afda8caeb69053fa29d9">


<link rel="stylesheet" href="../daijisi/style/c3e09ac36d.css">
<link rel="shortcut icon" type="image/x-icon" href="../staticfile/images/xianhua.jpg"/>
<link rel="stylesheet" href="../daijisi/style/86fe49ca90.css">
<link rel="stylesheet" type="text/css"
	href="../daijisi/style/footer.css">
<script type="text/javascript" src="../daijisi/style/zepto.js"></script>
<script type="text/javascript" src="../daijisi/style/swipe.js"></script>
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
        $('.'+type+'-message').remove();
    },time);
};

function checkDate(riqi){
	 //日期
	return (new Date(riqi).getDate()==riqi.substring(riqi.length-2));


}

function checkMuweihaoForm(){
	var muweihaoForm=document.muweihao;
   	var name = muweihaoForm.deadName.value;
	if(name == "" || name.length > 25){
		showMessage("逝者姓名不合法",'error',2000);
		muweihaoForm.deadName.focus();
		return false ;
	}
	var muweihao = muweihaoForm.muweihao.value;
	if(muweihao =="" ||  muweihao.length > 25){
		showMessage("墓位号不合法",'error',2000);
		muweihaoForm.muweihao.focus();
		return false;
	}
	
	var jisaoDate = muweihaoForm.jisaoDate.value;
	if(jisaoDate =="" ||  jisaoDate.length !=8){
		showMessage("日期格式错误",'error',2000);
		muweihaoForm.jisaoDate.focus();
		return false;
	}
	
    var myreg = /^[1][3,4,5,6,7,8,9][0-9]{9}$/;
	var jisaoTel = muweihaoForm.jisaoTel.value;
	if(jisaoTel == ""){
		showMessage("手机号不能为空",'error',2000);
		muweihaoForm.jisaoTel.focus();
		return false;
	}
	
	if (!myreg.test(jisaoTel)) {
		showMessage("手机号非法",'error',2000);
        return false;
     }
	
	var userName = muweihaoForm.userName.value;
	if(userName ==""){
		showMessage("您的姓名必填",'error',2000);
		muweihaoForm.userName.focus();
		return false;
	}
	
	var relation = muweihaoForm.relation.value;
	if(relation ==""){
		showMessage("与逝者关系不能为空",'error',2000);
		muweihaoForm.userName.focus();
		return false;
	}
	
	var jisaoBeizhu = muweihaoForm.jisaoBeizhu.value;
	var jsondata={deadName:name,jisaoTel:jisaoTel,muweihao:muweihao,jisaoBeizhu:jisaoBeizhu,jisaoDate:jisaoDate,userName:userName,relation:relation};
	// 给json对象赋值
	$.post("<%=request.getContextPath()%>/wechatuser/muweihao/update",{muweihaoEntry:JSON.stringify(jsondata)},function(data){
		var json = JSON.parse(data);
		if (json.isResultOk) {
			showMessage('添加成功','success',2000);
			// 从model里面取数据 并封装
			window.location.href="./muweihao";
			return true ;
		} else {
			showMessage(json.resultMsg,'error',2000);
			return false ;
		};
		
    });
	
};

</script>
</head>
<body style="padding-bottom: 45px;" class=" hPC">

	<!--客户端下载的图片-->
	<header id="header" class="u-header clearfix">
		<!--返回按钮根据程序判断来源，返回上一级-->
		<!-- 非微信扫码进入的用户 -->
		<div class="u-hd-left f-left">
			<a href="./muweihao" class="J_backToPrev"><span
				class="u-icon i-hd-back"></span></a>
		</div>
		<div class="u-hd-tit">
			<span>修改墓位号</span>
		</div>
	</header>

	<div class="connerdiv">
		<form action="./muweihao/add" method="post" id="muweihao"
			name="muweihao" method="POST">
			<dl class="connerbox">
				<dd>
					<span class="form_hd"><font color="green">逝者姓名：</font></span><span
						class="form_td ml80"> <input name="deadName" maxlength="50"
						class="text_input" type="text" value="${muweihao.deadName}"></span>
				</dd>
				<dd>
					<span class="form_hd"><font color="green">墓位号：</font></span><span
						class="form_td ml80"> <input name="muweihao" maxlength="11"
						class="text_input" type="text" value="${muweihao.muweihao}"
						readonly="readonly"></span>
				</dd>
				<dd>
					<span class="form_hd"><font color="green">联系方式：</font></span><span
						class="form_td ml80"> <input name="jisaoTel" maxlength="50"
						class="text_input" type="text" value="${muweihao.jisaoTel}"></span>
				</dd>
				<dd>
					<span class="form_hd"><font color="green">祭扫时间：</font></span><span
						class="form_td ml80"> <input name="jisaoDate"
						maxlength="50" class="text_input" type="text"
						value="${muweihao.jisaoDate}"></span>
				</dd>
							    <dd>
					<span class="form_hd"><font color="green">您的姓名：</font></span><span
						class="form_td ml80"> <input name="userName"
						maxlength="50" class="text_input" type="text"
						value="${muweihao.userName}"></span>
				</dd>
				<dd>
					<span class="form_hd"><font color="green">与逝者关系：</font></span><span
						class="form_td ml80"> <input name="relation"
						maxlength="50" class="text_input" type="text"
						value="${muweihao.relation}"></span>
				</dd>
				
			</dl>
			<dl class="connerbox">
				<dd>
					<span><font color="green">祭扫备注说明：</font></span>
					<textarea name="jisaoBeizhu" rows="5"
						class="textarea_input textarea_address" placeholder="如有祭文要求请填写...">${muweihao.jisaoBeizhu}</textarea>
				</dd>
			</dl>
			<div class="ui-btn-area">
				<input data-commit="jisaoBeizhu" class="btn_red"
					data-istempuser="false" data-loading-text="正在提交..." value="完成"
					type="button" onClick="checkMuweihaoForm();">
			</div>
		</form>
	</div>
	<div class="space10"></div>
	<jsp:include page="./commonjsp/bottom_common.jsp" />


</body>
</html>