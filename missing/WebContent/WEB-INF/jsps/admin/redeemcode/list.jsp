<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

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
			<div id="pad-wrapper">
				<!-- table sample -->
				<!-- the script for the toggle all checkboxes from header is located in js/theme.js -->
				<div class="table-products section">
					<div class="row-fluid head">
						<div class="span12">
							<h4>兑换码</h4>
						</div>
					</div>
					<div class="row-fluid filter-block">
						<div class="pull-right">
							<div class="ui-select">
								<select name="isused"
									onchange="select(this.options[this.options.selectedIndex].value)">
									<c:if test="${isused == 'all'}">
									  <option value="all" SELECTED>全部</option>
									  <option value="used" >已兑换</option>
									  <option value="notused">未兑换</option>
									</c:if>
									<c:if test="${isused == 'used'}">
									    <option value="all" >全部</option>
										<option value="used" SELECTED>已兑换</option>
										<option value="notused" >未兑换</option>
									</c:if>
									<c:if test="${isused == 'notused'}">
									    <option value="all" >全部</option>
										<option value="used" >已兑换</option>
										<option value="notused" SELECTED>未兑换</option>
									</c:if>
								</select>
							</div>
							<input type="text" class="search" placeholder="请输入兑换码" id="query"
								onmouseout="queryRedeem()" /> <a id="querya" href=""
								class="btn-flat new-product">查询</a>
						</div>
					</div>
					<div class="row-fluid">
						<table class="table table-hover">
							<thead>
								<tr>
									<th class="span3">编号</th>
									<th class="span3"><span class="line"></span>兑换码</th>
									<th class="span3"><span class="line"></span>兑换商品名</th>
									<th class="span3"><span class="line"></span>金额</th>
									<th class="span3"><span class="line"></span>是否兑换</th>
									<th class="span3"><span class="line"></span>操作</th>
								</tr>
							</thead>
							<tbody>
								<!-- row -->
								<!-- 遍历所有的兑换码 -->
								<c:forEach items="${redeemCodes}" var="redeemCode">
									<tr>
										<td>${redeemCode.codeId}</td>
										<td>${redeemCode.randomCode}</td>
										<td>${productName}</td>
										<td>${redeemCode.payMoney}</td>
										<c:if test="${redeemCode.isUsed==true}">
											<td><span class="label label-success">已兑换</span></td>
											<td></td>
										</c:if>
										<c:if test="${redeemCode.isUsed==false}">
											<td><span class="label label-info">未兑换</span></td>
											<td>
												<ul class="actions">
													<li><i class="table-edit"
											     	onclick="redeem(${redeemCode.codeId})"></i><span
														style="color: green">兑换</span></li>
												</ul>
											</td>
										</c:if>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="pagination">
						<!-- 此处多传递一个参数来判断该查询请求来自主页 例如：&index=true -->
						<ul>
							<li><a
								href="<%=request.getContextPath()%>/admin/toredeemcodelist?isused=${isused}&currentPage=0">&#8249&#8249</a></li>
							<li><c:if test="${currentPage>0}">
									<a
										href="<%=request.getContextPath()%>/admin/toredeemcodelist?isused=${isused}&currentPage=${currentPage-1}">&#8249</a>
								</c:if></li>
							<li><c:if test="${currentPage<allPages}">
									<a
										href="<%=request.getContextPath()%>/admin/toredeemcodelist?isused=${isused}&currentPage=${currentPage+1}">&#8250</a>
								</c:if></li>
							<li><a
								href="<%=request.getContextPath()%>/admin/toredeemcodelist?isused=${isused}&currentPage=${allPages}">&#8250&#8250</a></li>
						</ul>
					</div>
				</div>
				<!-- end table sample -->
			</div>
		</div>
	</div>
	<jsp:include page="../basic/pop.jsp" /> 
	<script type='text/javascript'>  
    function select(s){  
    	 window.location.href="/missing/admin/toredeemcodelist?isused="+s; 
    };
</script>
</body>
</html>