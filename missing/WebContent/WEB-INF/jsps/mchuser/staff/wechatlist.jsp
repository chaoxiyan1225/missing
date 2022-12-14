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
							<h4>共检索到<font color="red">${allCount}</font>个关注</h4>
						</div>
						                    
					</div>
					 <form action="<%=request.getContextPath()%>/mchuser/towechatusers" method="post"  name="searchwechat" onsubmit="return checkForm();"> 
					   <div class="row-fluid filter-block">
						<div class="pull-right">
						   <div class="ui-select">
                              <input type="text" class="search" placeholder="请输入昵称" id="nickName"  name="nickName"  value="${nickName}"/> 
							</div>
								<input type="submit" value="搜索" id="querya" 	class="btn-flat new-product"/>
						</div>
					   </div>
					 </form> 
					<div class="row-fluid">
						<table class="table table-hover">
							<thead>
								<tr>
									<th class="span3">微信昵称</th>
									<th class="span3"><span class="line"></span>性别</th>
									<th class="span3"><span class="line"></span>手机号</th>
									<th class="span3"><span class="line"></span>头像</th>
									<th class="span3"><span class="line"></span>微信openId</th>
									<th class="span3"><span class="line"></span>注册时间</th>
								</tr>
							</thead>
							<tbody>
								<!-- row -->
								<c:forEach items="${cacheWechat}" var="wechat">
									<tr>
										<td >${wechat.userNickName}</td>
									    <td >
									    <c:if test="${wechat.userSex == true}">
									               男
									    </c:if>
									    <c:if test="${wechat.userSex == false}">
									               女
									    </c:if>
									    
									    </td>
										<td>${wechat.userTelNum}</td>
										<td>
										   <img src="${wechat.userHeadPath}"/>
										</td>
										<td>${wechat.userOpenid}</td>
									    <td>${wechat.userRegisterTime}</td>
									</tr>
									<!-- 商家下面的所有商品 列表 开始 符号 -->
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="pagination">
						<ul>
							<li><a
								href="<%=request.getContextPath()%>/mchuser/towechatusers?currentPage=0">&#8249&#8249</a></li>
							<li><c:if test="${currentPage>0}">
									<a
										href="<%=request.getContextPath()%>/mchuser/towechatusers?currentPage=${currentPage-1}">&#8249</a>
								</c:if></li>
							<li><c:if test="${currentPage<allPages}">
									<a
										href="<%=request.getContextPath()%>/mchuser/towechatusers?currentPage=${currentPage+1}">&#8250</a>
								</c:if></li>
							<li><a
								href="<%=request.getContextPath()%>/mchuser/towechatusers?currentPage=${allPages}">&#8250&#8250</a></li>
						</ul>
					</div>
				</div>
				<!-- end table sample -->
			</div>
		</div>
	</div>
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
		    $('body').append(str);
		    setTimeout(function () {
		        $('.'+type+'-message').remove()
		    },time);
		};
	 
	  function checkForm(){
      	var temElement = searchwechat.nickName;
      	var nickName = temElement.value;
      	
        return true ;
      	
      };

    </script>
</body>
</html>