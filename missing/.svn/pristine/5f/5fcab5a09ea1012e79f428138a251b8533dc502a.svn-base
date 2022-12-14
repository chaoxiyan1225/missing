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
	<!-- end sidebar  class="btn btn-primary" -->
	<!-- main container -->
	<div class="content">
		<div class="container-fluid">
			<div id="pad-wrapper">
				<!-- table sample -->
				<!-- the script for the toggle all checkboxes from header is located in js/theme.js -->
				<div class="table-products section">
					<div class="row-fluid head">
						<div class="span12">
							<h4>共检索到<font color="red">${allPages}</font>个员工</h4>
							<a style="float: right;"  href="./tosinglestaff" ><strong>添加员工</strong></a>
						</div>
					</div>
					<div class="row-fluid">
						<table class="table table-hover">
							<thead>
								<tr>
									<th class="span3">员工姓名</th>
									<th class="span3"><span class="line"></span>昵称</th>
									<th class="span3"><span class="line"></span>手机号</th>
									<th class="span3"><span class="line"></span>状态</th>
									<th class="span3"><span class="line"></span>是否注销</th>
									<th class="span3"><span class="line"></span>微信号</th>
									<th class="span3"><span class="line"></span>创建时间</th>
									<th class="span3"><span class="line"></span>操作</th>
								</tr>
							</thead>
							<tbody>
								<!-- row -->
								<c:forEach items="${staffs}" var="staff">
									<tr>
										<td >${staff.name}</td>
									    <td >${staff.nickName}</td>
										<td>${staff.phoneNum}</td>
										<td>${staff.status}</td>
										<td>
										  <c:if test="${staff.isDelete==0}">
										     <font color="blue">否</font>
										  </c:if>
										
						                  <c:if test="${staff.isDelete==1}">
										     <font color="red">是</font>
										  </c:if>
										</td>
										<td>${staff.fkOpenId}</td>
									    <td>${staff.createTime}</td>
										<th>
										    <input type="button" value="编辑"
												class="btn_modify"
												style="background: url(../staticfile/images/modification.png) no-repeat left center; border: 0px; margin-left: 3px; width: 55px;"
												onclick="editStaff(${staff.id},-1)" />
												
								                <c:if test="${staff.isDelete==0}">
										           <input type="button" value="注销" class="btn_modify"
												   style="background: url(../staticfile/images/delete.png) no-repeat left center; border: 0px; margin-left: 3px; width: 55px;"
												   onclick="editStaff(${staff.id},1)" />
										        </c:if>
										
										</th>
										
									</tr>
									<!-- 商家下面的所有商品 列表 开始 符号 -->
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="pagination">
						<ul>
							<li><a
								href="<%=request.getContextPath()%>/mchuser/tostafflist?currentPage=0">&#8249&#8249</a></li>
							<li><c:if test="${currentPage>0}">
									<a
										href="<%=request.getContextPath()%>/mchuser/tostafflist?currentPage=${currentPage-1}">&#8249</a>
								</c:if></li>
							<li><c:if test="${currentPage<allPages}">
									<a
										href="<%=request.getContextPath()%>/mchuser/tostafflist?currentPage=${currentPage+1}">&#8250</a>
								</c:if></li>
							<li><a
								href="<%=request.getContextPath()%>/mchuser/tostafflist?currentPage=${allPages}">&#8250&#8250</a></li>
						</ul>
					</div>
				</div>
				<!-- end table sample -->
			</div>
		</div>
	</div>
	<jsp:include page="../basic/pop.jsp" />
	
	 <script type="text/javascript">
        function editStaff(id,type){
        	if(id == ""){
        		alert("ID为空不能提交！");
        		return;
        	}
        	
        	//编辑，需要跳转到tosinglestaff
        	if(type == -1){
               window.location.href="<%=request.getContextPath()%>/mchuser/tosinglestaff?staffId="+id;
        	}else if(type==1){
        		//
        		alert("确定注销?");
        		$.post("<%=request.getContextPath()%>/mchuser/deletestaff",{staffId:id},function(data){
        			if (data.isResultOk) {
        				window.location.href="<%=request.getContextPath()%>/mchuser/tostafflist";
        			} else {
        				alert("注销失败，请重试");
        			}
        	    });
        		
           }
       
        }
    </script>
</body>
</html>