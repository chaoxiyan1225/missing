<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- TODO :抽出公共  top.jsp 界面 -->
<jsp:include page="../basic/back_js_css.jsp" />
<script type="text/javascript" src="../staticfile/commonjs/uptosale.js"></script>
<link rel="stylesheet" type="text/css"	href="../staticfile/styles/compiled/new-user.css" />
</head>
<body>
	<jsp:include page="../basic/top.jsp" />
	<!-- sidebar -->
	<jsp:include page="../basic/menu_common.jsp" />
	<!-- end sidebar -->

	<!-- main container -->
    <div class="content">
        <div class="container-fluid">
            <div id="pad-wrapper" class="new-user">
                <div class="row-fluid header">
                    <h3>添加商户</h3>
                </div>

                <div class="row-fluid form-wrapper">
                    <!-- left column -->
                    <div class="span9 with-sidebar">
                        <div class="container">
                          <form action="<%=request.getContextPath()%>/admin/addmchuser" method="post" name="newMch"  enctype="multipart/form-data" class="main_form" onsubmit="return  checkAddMch();">
                              <div class="span12 field-box">
                                    <label>商户登录户名:</label>
                                    <input class="span5" name="mchName" id="mchName"  type="text" />&nbsp&nbsp&nbsp<span style="color: red">*</span>&nbsp必填：长度30以内
                                </div>
                                <div class="span12 field-box">
                                    <label>选择级别:</label>
                                    <div class="ui-select span5">
                                        <select name="mchLevel" id="mchLevel" >
                                            <option value="1" >1级</option>
                                            <option value="2" >2级</option>
                                            <option value="3" >3级</option>
                                        </select>
                                    </div> &nbsp&nbsp&nbsp<span style="color: red">*</span>&nbsp必填：级别越高，权限越高
                                </div>
                                <div class="span12 field-box">
                                    <label>邮箱地址:</label>
                                    <input class="span5" name="email" id="email"  type="text" />&nbsp&nbsp&nbsp<span style="color: red">*</span>&nbsp必填：长度30以内
                                </div>
                                <div class="span12 field-box">
                                    <label>商铺名:</label>
                                    <input class="span5" name="shopName" id="shopName"  type="text" />&nbsp&nbsp&nbsp<span style="color: red">*</span>&nbsp必填：长度30以内
                                </div>
                                <div class="span12 field-box">
                                    <label>电话号码:</label>
                                    <input class="span5" name="phoneNum" id="phoneNum"  type="text" />&nbsp&nbsp&nbsp<span style="color: red">*</span>&nbsp必填：数字，长度20以内
                                </div>
                                <div class="span12 field-box">
                                    <label>商家微信号:</label>
                                    <input class="span5" name="fkOpenId" id="fkOpenId"  type="text" />&nbsp&nbsp&nbsp<span style="color: red">*</span>&nbsp必填：务必与微信上一致
                                </div>
                                <div class="span12 field-box">
                                    <label>店面地址:</label>
                                    <div class="address-fields">
                                        <input class="span7" name="shopAddress" id="shopAddress"  type="text" placeholder="例如：四川省成都市武侯区吉泰路888号" />&nbsp&nbsp&nbsp<span style="color: red">*</span>&nbsp必填：
                                    </div>
                                </div>
                                <div class="span12 field-box">
								     <label>商家头像:</label> <input class="span4" type="file"
									style="width: 50%" id="contentFile0" name="contentFile0"/>&nbsp&nbsp&nbsp<span style="color: red">*</span>&nbsp必填：套餐展示图标
							     </div>
							     <div class="span12 field-box">
								     <label>其他内容图片:</label> 
								        <input class="span5" type="file" style="width: 30%" name="contentFile1"/>
									    <input class="span5" type="file" style="width: 20%" name="contentFile2"/>&nbsp&nbsp&nbsp<span style="color: red">*</span>&nbsp必填：套餐内展示图标
							     </div>

                                <div class="span12 field-box textarea">
                                    <label>备注:</label>
                                    <textarea class="span7" name="shopDetail" id="shopDetail" ></textarea>
                                    <span class="charactersleft">90 characters remaining. Field limited to 100 characters</span>
                                </div>
                                <div class="span11 field-box actions">
                                    <input  type="submit" class="btn-glow primary" value="确定" />
                                    <span>OR</span>
                                    <input type="reset" value="取消" class="reset" />
                                </div>
                            </form>
                        </div>
                    </div>
            </div>
        </div>
    </div>
    <!-- end main container -->

    <jsp:include page="../basic/pop.jsp" />

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
        $(function () {

            // toggle form between inline and normal inputs
            var $buttons = $(".toggle-inputs button");
            var $form = $("form.new_user_form");

            $buttons.click(function () {
                var mode = $(this).data("input");
                $buttons.removeClass("active");
                $(this).addClass("active");

                if (mode === "inline") {
                    $form.addClass("inline-input");
                } else {
                    $form.removeClass("inline-input");
                }
            });
        });
        
        function checkAddMch(){
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

</body>
</html>