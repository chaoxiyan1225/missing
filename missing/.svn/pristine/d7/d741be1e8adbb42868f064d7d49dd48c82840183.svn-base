<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
                    <h3>添加员工</h3>
                </div>

                <div class="row-fluid form-wrapper">
                    <!-- left column -->
                    <div class="span9 with-sidebar">
                        <div class="container">
                            <form action="<%=request.getContextPath()%>/mchuser/addorupdatestaff" method="post"  id="staff"  name="staff" class="new_user_form inline-input"  onsubmit="" >
                              <div class="span12 field-box">
                                    <label>用户名:</label>
                                    <input class="span5" type="text" id="name" name="name"  value="${staff.name}"/>
                                    &nbsp&nbsp&nbsp<span style="color: red">*</span>&nbsp必填：25长度内的汉字
                                     <input  id="fkMchId" name="fkMchId" type="hidden" value="${staff.fkMchId}"/>
                                     <input id="id" name="id" type="hidden"  value="${staff.id}"/>
                                </div>
                                <div class="span12 field-box">
                                    <label>昵称:</label>
                                    <input class="span5" type="text" id="nickName" name="nickName" value="${staff.nickName}"/>
                                     &nbsp&nbsp&nbsp<span style="color: red">*</span>&nbsp选填：25长度的汉字，无则与用户名一致
                                </div>
                                <div class="span12 field-box">
                                    <label>选择状态:</label>
                                    <div class="ui-select span5">
                                        <select name="status">
                                        
                                            <option value="正常上班" >正常上班</option>
                                            <option value="待报备" >待报道</option>
                                            <option value="已报道" >已报道</option>
                                        </select>
                                    </div>
                                    &nbsp&nbsp&nbsp<span style="color: red">*</span>&nbsp必填：选择状态
                                </div>
                                <div class="span12 field-box">
                                    <label>电话号码:</label>
                                    <input class="span5" type="text" id="phoneNum" name="phoneNum" value="${staff.phoneNum}"/>
                                    &nbsp&nbsp&nbsp<span style="color: red">*</span>&nbsp必填：中国大陆电话号码
                                </div>
                                <div class="span12 field-box">
                                    <label>微信号:</label>
                                    <input class="span5" type="text"  id="fkOpenId" name="fkOpenId" value="${staff.fkOpenId}" />
                                    &nbsp&nbsp&nbsp<span style="color: red">*</span>&nbsp必填：微信号唯一标识
                                </div>

                                <div class="span12 field-box textarea">
                                    <label>员工备注:</label>
                                    <textarea class="span9"   id="detail" name="detail" value="${staff.detail}" ></textarea>
                                    <span class="charactersleft">90 characters remaining. Field limited to 100 characters</span>
                                </div>
                                <div class="span11 field-box actions">
                                    <input type="button" class="btn-glow primary" value="创建" onClick="checkStaffForm();"/>
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
        
        function checkStaffForm(){
        	
        	var staffForm=document.staff;
           	var name = staffForm.name.value;
        	if(name == "" || name.length > 25){
        		showMessage("员工姓名不合法",'error',2000);
        		staffForm.name.focus();
        		return false ;
        	}
        	
        	//姓名要校验下，防止冲突
        	
        	var nickName = staffForm.nickName.value;
        	if(nickName =="" ||  nickName.length > 25){
        		showMessage("昵称不合法",'error',2000);
        		staffForm.nickName.focus();
        		return false;
        	}
        	

            var myreg = /^[1][3,4,5,6,7,8,9][0-9]{9}$/;
        	var phoneNum = staffForm.phoneNum.value;
        	if(phoneNum == ""){
        		showMessage("手机号不能为空",'error',2000);
        		staffForm.phoneNum.focus();
        		return false;
        	}
        	
        	if (!myreg.test(phoneNum)) {
        		showMessage("手机号非法",'error',2000);
                return false;
             }
        	
        	
        	var fkOpenId = staffForm.fkOpenId.value;
        	if(fkOpenId == "" || fkOpenId.length > 50){
        		showMessage("微信号非法",'error',2000);
        		staffForm.nickName.focus();
        		return false;
        	}
        	
        	staffForm.submit();
        };
        
    </script>

</body>
</html>