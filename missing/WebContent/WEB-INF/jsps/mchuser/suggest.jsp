<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="./basic/back_js_css.jsp" />
</head>
<body>
	<jsp:include page="./basic/top.jsp" />
	<!-- sidebar -->
	<jsp:include page="./basic/menu_common.jsp" />
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
							<h4>用户意见</h4>
						</div>
					</div>
					<div class="row-fluid">
						<table class="table table-hover">
							<thead>
								<tr>
									<th class="span2">编号</th>
									<th class="span2"><span class="line"></span>昵称</th>
									<th class="span2"><span class="line"></span>邮箱</th>
									<th class="span3"><span class="line"></span>内容</th>
									<th class="span3"><span class="line"></span>时间</th>
								</tr>
							</thead>
							<tbody>
								<!-- row -->
								<!-- 遍历所有的兑换码 -->
								<c:forEach items="${suggests}" var="suggest">
									<tr>
										<td>${suggest.id}</td>
										<td>${suggest.nickName}</td>
										<td>${suggest.email }</td>
										<td>${suggest.info }</td>
										<td>${suggest.createTime }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="pagination">
						<ul>
							<li><a
								href="<%=request.getContextPath()%>/mchuser/tosuggest?currentPage=0">&#8249&#8249</a></li>
							<li><c:if test="${currentPage>0}">
									<a
										href="<%=request.getContextPath()%>/mchuser/tosuggest?currentPage=${currentPage-1}">&#8249</a>
								</c:if></li>
							<li><c:if test="${currentPage<allPages}">
									<a
										href="<%=request.getContextPath()%>/mchuser/tosuggest?currentPage=${currentPage+1}">&#8250</a>
								</c:if></li>
							<li><a
								href="<%=request.getContextPath()%>/mchuser/tosuggest?currentPage=${allPages}">&#8250&#8250</a></li>
						</ul>
					</div>
				</div>
				<!-- end table sample -->
			</div>
		</div>
	</div>
	<jsp:include page="./basic/pop.jsp" />
</body>
</html>