<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- this page specific styles -->
<link rel="stylesheet" href="../staticfile/styles/compiled/new-user.css"
	type="text/css" media="screen" />
<!-- open sans font -->
<jsp:include page="./basic/back_js_css.jsp" />
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

function checkUpdateMch(){
	var temElement = newMch.mchName;
	var mchName = temElement.value;
	if(mchName == '' || mchName.length > 30){
		showMessage("登录名不合法","error",2000);
		temElement.focus();
		return false ;
	}
	
	var temElement = newMch.email;
	var email = temElement.value;
	if(email == '' || mchName.length > 30){
		showMessage("邮箱不合法","error",2000);
		temElement.focus();
		return false ;
	}
	
	var temElement = newMch.shopName;
	var shopName = temElement.value;
	if(shopName == "" || shopName.length > 30){
		showMessage("商铺名不合法","error",2000);
		temElement.focus();
		return false ;
	}
	
	temElement = newMch.phoneNum;
	var phoneNum = temElement.value;
	if(phoneNum == ""){
		showMessage("电话号码为空或者非数字","error",2000);
		temElement.focus();
		return false;
	}
	
	
	temElement = newMch.shopAddress;
	var  address  = temElement.value;
   	if(address == "" || address.length > 50){
		showMessage("商铺地址不合法","error",2000);
		temElement.focus();
		return false;
	}
   	
	temElement = newMch.fkOpenId;
	var  fkOpenId  = temElement.value;
   	if(fkOpenId == "" || address.length > 50){
		showMessage("微信号不合法","error",2000);
		temElement.focus();
		return false;
	}
   	
   	temElement = newMch.contentFile0;
   	if(temElement.value == ''){
		showMessage("商铺头像必须选择","error",2000);
		temElement.focus();
		return false;
   	}
   	temElement = newMch.contentFile1;
   	if(temElement.value == ''){
		showMessage("详情图片1必须选择","error",2000);
		temElement.focus();
		return false;
   	}
   	temElement = newMch.contentFile2;
   	if(temElement.value == ''){
		showMessage("详情图片2必须选择","error",2000);
		temElement.focus();
		return false;
   	}
   	
   	return true ;
	
}

</script>
</head>
<body>
	<jsp:include page="./basic/top.jsp" />
	<!-- sidebar -->
	<jsp:include page="./basic/menu_common.jsp" />
	<!-- end sidebar -->


	<!-- main container -->
	<div class="content">

		<div class="container-fluid">
			<div id="pad-wrapper" class="new-user">
				<div class="row-fluid header">
					<h3>个人信息   <font color="red"> ${result} </font> </h3>
				</div>
				<div id="save_result_info" class="save_success"></div><!--保存失败，数据并发错误！-->

				<div class="row-fluid form-wrapper">
					<!-- left column -->
					<div class="span9">
						<div class="container">
		                  <form class="new_user_form normal-input" action="<%=request.getContextPath()%>/mchuser/updateuserinfo" method="post" name="newMch" class="main_form" onsubmit="return  checkUpdateMch();">
                     
							<div class="span12 field-box">
								<label>商家用户名:</label> <input class="span9" type="text"
									style="width: 50%" readonly="readonly"
									value="${mchUser.mchName}" />
							</div>
							<div class="span12 field-box">
								<label>级别:</label> <input class="span9" type="text"
									style="width: 50%" readonly="readonly" value="${mchUser.mchLelvel}级" />
							</div>
							<div class="span12 field-box">
								<label>商铺名:</label> <input class="span9" type="text"
									id="shopName" style="width: 50%" name="shopName"
									value="${mchUser.shopName}" />&nbsp&nbsp&nbsp<span
									style="color: red">*</span>&nbsp必填：25长度以内汉字
							</div>
							<div class="span12 field-box">
								<label>商铺地址:</label> <input class="span9" type="text"
									style="width: 50%"  name="shopAddress" id="shopAddress"
									value="${mchUser.shopAddress}" />&nbsp&nbsp&nbsp<span
									style="color: red">*</span>&nbsp必填：25长度以内汉字
							</div>
							<div class="span12 field-box">
								<label>总销售额:</label> <input class="span9" type="text"
									style="width: 50%" readonly="readonly"
									value="${mchUser.totalMoney}元" />
							</div>
							<div class="span12 field-box">
								<label>服务状态:</label>
								     <select id="serviceStatus" name="serviceStatus" style="width:120px">
		                               <c:forEach items="${mchStatuss}" var="status">
		                               <c:if test="${mchUser.serviceStatus==status.statusMsg}">
		                                    <option value="${mchUser.serviceStatus}" selected="selected" >${mchUser.serviceStatus}</option>
		                               </c:if>
		                               <c:if test="${mchUser.serviceStatus != status.statusMsg}">
		                                    <option value="${status.statusMsg}">${status.statusMsg}</option>
		                               </c:if>
                                       </c:forEach>
                                       </select>&nbsp&nbsp&nbsp<span
									style="color: red">*</span>&nbsp必选：设置为非正常营业中状态时将不能预约取号
							</div>
							<div class="span12 field-box">
								<label>积分:</label> <input class="span9" type="text"
									style="width: 50%" readonly="readonly"
									value="${mchUser.points}" />
							</div>
							<div class="span9 field-box">
								<label>营业时间:</label> <input class="span4" type="text" name="extProps" id="extProps" value="${mchUser.extProps}"
									style="width: 50%" value="例如：09:30-21:00" />&nbsp&nbsp&nbsp<span
									style="color: red">*</span>&nbsp必填：在当前时间外则不能取号
							</div>
							<div class="span12 field-box">
								<label>电话:</label> <input class="span9" type="text"
									style="width: 50%"  name="phoneNum" id="phoneNum"  value="${mchUser.phoneNum}" />&nbsp&nbsp&nbsp<span
									style="color: red">*</span>&nbsp必填：手机或固话
							</div>
							<div class="span12 field-box">
								<label>微信号:</label> <input class="span9" type="text"
									style="width: 50%"  name="fkOpenId"  id="fkOpenId"  value="${mchUser.fkOpenId}" />&nbsp&nbsp&nbsp<span
									style="color: red">*</span>&nbsp必填：微信号Id
							</div>
							<div class="span12 field-box">
								<label>邮箱:</label> <input class="span9" type="text"
									style="width: 50%"  id="email"  name="email"  value="${mchUser.email}" />&nbsp&nbsp&nbsp<span
									style="color: red">*</span>&nbsp选填：邮箱
							</div>
							<div class="span12 field-box">
								<label>注册时间:</label> <input class="span9" type="text"
									style="width: 50%" readonly="readonly"
									value="${mchUser.registerTime}" />
							</div>
							<div class="span12 field-box textarea">
                                    <label>商铺描述:</label>
                                    <textarea class="span7" name="shopDetail" id="shopDetail" >${mchUser.shopDetail}</textarea>
                                    <span class="charactersleft">限制在200字以内</span>
                                </div>
							<div class="span11 field-box actions" style="text-align: center">
								<input type="submit" class="btn-glow primary" value="保存"
									style="width: 100px;" />&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								<input type="button" class="btn-glow primary" value="取消"
									style="width: 100px;" />
							</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end main container -->
</body>
</html>