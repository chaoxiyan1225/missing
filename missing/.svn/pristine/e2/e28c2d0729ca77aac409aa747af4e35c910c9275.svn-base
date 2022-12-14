<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- TODO :抽出公共  top.jsp 界面 -->
<jsp:include page="../basic/back_js_css.jsp" />
<script type="text/javascript" src="../staticfile/commonjs/uptosale.js"></script>
</head>
<body>
	<jsp:include page="../basic/top.jsp" />
	<!-- sidebar -->
	<jsp:include page="../basic/menu_common.jsp" />
	<!-- end sidebar -->
	<!-- main container -->
	<div class="content">
		<div class="container-fluid">
			<div id="pad-wrapper">
				<!-- table sample -->
				<!-- the script for the toggle all checkboxes from header is located in js/theme.js -->
				<div class="table-products section">
					<div class="row-fluid head">
						<div class="span12">
							<h4>全部商品</h4>
						</div>
					</div>
					<div class="row-fluid">
						<table class="table table-hover">
							<thead>
								<tr>
									<th class="span3">商品名</th>
									<th class="span3"><span class="line"></span>折扣价</th>
									<th class="span3"><span class="line"></span>门店价</th>
									<th class="span3"><span class="line"></span>销售次数</th>
									<th class="span3"><span class="line"></span>销售金额</th>
									<th class="span3"><span class="line"></span>状态</th>
									<th class="span3"><span class="line"></span>操作</th>
								</tr>
							</thead>
							<tbody>
								<!-- row -->
								<!-- 遍历所有的兑换码 -->
								<c:forEach items="${products}" var="product">
									<tr>
										<th class="width200">${product.productName}</th>
										<th class="width100">${product.discountPrice}元</th>
										<th class="width100">${product.productPrice}元</th>
										<th class="width100">${product.saleTotalTimes}次</th>
										<th class="width100">${product.saleTotalMoney}元</th>
										<c:if test="${product.productStatus==0}">
											<th class="width100" id="${product.productId}"><font
												color="red">已下架</font></th>
											<th class="width200"><input type="button" value="编辑"
												class="btn_modify"
												style="background: url(../staticfile/images/modification.png) no-repeat left center; border: 0px; margin-left: 3px; width: 55px;"
												onclick="editProduct(${product.productId},-1)" /> <input
												type="button" value="上架" class="btn_modify"
												style="background: url(../staticfile/images/modification.png) no-repeat left center; border: 0px; margin-left: 3px; width: 55px;"
												onclick="editProduct(${product.productId},1)" /></th>
										</c:if>
										<c:if test="${product.productStatus==1}">
											<th class="width100" id="${product.productId}"><font
												color="green">已上架</font></th>
											<th class="width200"><input type="button" value="编辑"
												class="btn_modify"
												style="background: url(../staticfile/images/modification.png) no-repeat left center; border: 0px; margin-left: 3px; width: 55px;"
												onclick="editProduct(${product.productId},-1)" /> <input
												type="button" value="下架" class="btn_modify"
												style="background: url(../staticfile/images/modification.png) no-repeat left center; border: 0px; margin-left: 3px; width: 55px;"
												onclick="editProduct(${product.productId},0)" /></th>
										</c:if>
									</tr>
									<!-- 商家下面的所有商品 列表 开始 符号 -->
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="pagination">
						<ul>
							<li><a
								href="<%=request.getContextPath()%>/admin/toproductlist?currentPage=0">&#8249&#8249</a></li>
							<li><c:if test="${currentPage>0}">
									<a
										href="<%=request.getContextPath()%>/admin/toproductlist?currentPage=${currentPage-1}">&#8249</a>
								</c:if></li>
							<li><c:if test="${currentPage<allPages}&&${products.size()}==20 }">
									<a
										href="<%=request.getContextPath()%>/admin/toproductlist?currentPage=${currentPage+1}">&#8250</a>
								</c:if>
								<c:if test="${products.size()}<20 }">
									<a
										href="<%=request.getContextPath()%>/admin/toproductlist?currentPage=${currentPage+1}">&#8250</a>
								</c:if>
								
								</li>
							<li><a
								href="<%=request.getContextPath()%>/admin/toproductlist?currentPage=${allPages}">&#8250&#8250</a></li>
						</ul>
					</div>
				</div>
				<!-- end table sample -->
			</div>
		</div>
	</div>
	<jsp:include page="../basic/pop.jsp" />
</body>
</html>