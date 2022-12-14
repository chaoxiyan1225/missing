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
                    <h3>添加商户</h3>
                </div>

                <div class="row-fluid form-wrapper">
                    <!-- left column -->
                    <div class="span9 with-sidebar">
                        <div class="container">
                          <form action="<%=request.getContextPath()%>/mchuser/preaddproduct" method="post" name="newProduct"  enctype="multipart/form-data" class="main_form" onsubmit="return  checkAddProduct();">
                              <div class="span12 field-box">
                                    <label>用户名:</label>
                                    <input class="span5" type="text" />
                                </div>
                                <div class="span12 field-box">
                                    <label>选择状态:</label>
                                    <div class="ui-select span5">
                                        <select>
                                            <option value="AK" >Alaska</option>
                                            <option value="HI" >Hawaii</option>
                                            <option value="CA" >California</option>
                                            <option value="NV" >Nevada</option>
                                            <option value="OR" >Oregon</option>
                                            <option value="WA" >Washington</option>
                                            <option value="AZ" >Arizona</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="span12 field-box">
                                    <label>级别:</label>
                                    <input class="span5" type="text" />
                                </div>
                                <div class="span12 field-box">
                                    <label>商铺名:</label>
                                    <input class="span5" type="text" />
                                </div>
                                <div class="span12 field-box">
                                    <label>电话号码:</label>
                                    <input class="span5" type="text" />
                                </div>
                                <div class="span12 field-box">
                                    <label>微信号:</label>
                                    <input class="span5" type="text" />
                                </div>
                                <div class="span12 field-box">
                                    <label>商品地址:</label>
                                    <div class="address-fields">
                                        <input class="span12" type="text" placeholder="Street address" />
                                        <input class="span12 small" type="text" placeholder="City" />
                                        <input class="span12 small" type="text" placeholder="State" />
                                        <input class="span12 small last" type="text" placeholder="Postal Code" />
                                    </div>
                                </div>
                                <div class="span12 field-box">
								     <label>商品图标:</label> <input class="span9" type="file"
									style="width: 50%" id="producthead" name="headFile"/>&nbsp&nbsp&nbsp<span style="color: red">*</span>&nbsp必填：套餐展示图标
							     </div>
							     <div class="span12 field-box">
								     <label>商品详细图标:</label> 
								        <input class="span9" type="file" style="width: 30%" name="contentFile1"/>
									    <input class="span9" type="file" style="width: 20%" name="contentFile2"/>&nbsp&nbsp&nbsp<span style="color: red">*</span>&nbsp必填：套餐内展示图标
							     </div>
							    <div class="span12 field-box">
								    <label></label> 
								    <input class="span9" type="file" style="width: 30%" name="contentFile3"/>
								    <input class="span9" type="file" style="width: 20%" name="contentFile4"/>
							    </div>

                                <div class="span12 field-box textarea">
                                    <label>备注:</label>
                                    <textarea class="span9"></textarea>
                                    <span class="charactersleft">90 characters remaining. Field limited to 100 characters</span>
                                </div>
                                <div class="span11 field-box actions">
                                    <input type="button" class="btn-glow primary" value="确定" />
                                    <span>OR</span>
                                    <input type="reset" value="取消" class="cacel" />
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
    </script>

</body>
</html>