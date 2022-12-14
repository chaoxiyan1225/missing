<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="../staticfile/ckeditor/ckeditor.js" type="text/javascript"></script>
<!-- this page specific styles -->
<link rel="stylesheet" href="../staticfile/styles/compiled/new-user.css"
	type="text/css" media="screen" />
<!-- open sans font -->
<jsp:include page="../basic/back_js_css.jsp" />
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
					<h3>商品添加</h3>
				</div>

				<div class="row-fluid form-wrapper">
					<!-- left column -->
					<div class="span9">
						<div class="container">
						  <form action="<%=request.getContextPath()%>/mchuser/preaddproduct" method="post" name="newProduct"  enctype="multipart/form-data" class="main_form" onsubmit="return  checkAddProduct();">
							<div class="span12 field-box">
								<label>商品标题:</label> <input class="span9" type="text"
									style="width: 50%" name="productName" id="productName" />&nbsp&nbsp&nbsp<span style="color: red">*</span>&nbsp必填：25长度内的汉字
							</div>
							<div class="span12 field-box">
								<label>商品优惠价格:</label> <input class="span9" type="text"
									style="width: 50%" id="discountPrice" name="discountPrice" />&nbsp&nbsp&nbsp<span style="color: red">*</span>&nbsp必填：(元)网购价格，需要小于店内价格
							</div>
							<div class="span12 field-box">
								<label>商品店内价格:</label> <input class="span9" type="text"
									style="width: 50%" id="productPrice" name="productPrice"/>&nbsp&nbsp&nbsp<span style="color: red">*</span>&nbsp必填：(元)店内实际价格
							</div>
							<div class="span12 field-box">
								<label>商品类型:</label> 
								<select style="width: 50%; height: 30px;" name="productType">
								    <option/>请选择
								    <option value="jisi">祭祀</option>
						        </select>
						        &nbsp&nbsp&nbsp<span style="color: red">*</span>&nbsp必填：商品所属的类型
						        
							</div>
							<div class="span12 field-box">
								<label>商品详情:</label>&nbsp&nbsp&nbsp<span style="color: red">*</span>&nbsp必填：商品包含套餐内容（如2份凉菜）
								
							</div>
							<div class="span12 field-box">
								<textarea id="productDescription" class="ckeditor" name="productDescription" rows="20" cols="15"  style="text-align:right;"></textarea>
								<!-- <input class="span9" type="text"
									style="width: 50%" name="productDescription" id="productDescription"/>&nbsp&nbsp&nbsp<span style="color: red">*</span>&nbsp必填：商品包含套餐内容（如2份凉菜）      -->
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
							<div class="span12 field-box">
								<label></label> 
								<input class="span9" type="file" style="width: 30%" name="contentFile5" />
								<input class="span9" type="file" style="width: 20%" name="contentFile6"/>
							</div>
							<div class="span11 field-box actions" style="text-align:center">
								<input type="submit" class="btn-glow primary" value="预览" style="width:100px;" />&nbsp&nbsp <input
									type="button" class="btn-glow primary" value="保存"  style="width:100px;"/>&nbsp&nbsp <input
									type="button" class="btn-glow primary" value="取消"  style="width:100px;"/>
							</div>
						   </form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	    <script type="text/javascript">
        function checkAddProduct(){
        	var productName = newProduct.productName.value;
        	if(productName == "" || productName.length > 25){
        		alert("商品名不合法");
        		newProduct.productName.focus();
        		return false ;
        	}
        	
        	var discountPrice = newProduct.discountPrice.value;
        	if(discountPrice == "" ){
        		alert("商品折扣价不能为空或者不是数字");
        		newProduct.discountPrice.focus();
        		return false;
        	}
        	
        	var productPrice = newProduct.productPrice.value;
           	if(productPrice == "" ){
        		alert("商品价格不能为空或者不是数字");
        		newProduct.productPrice.focus();
        		return false;
        	}
           	
           	if(isNaN(discountPrice) > isNaN(productPrice)){
           		alert("折扣价不能大于商品价格");
           		return false;
           	}
           	
           	
           	return true ;
        	
        }
    </script>
	<!-- end main container -->
</body>
</html>