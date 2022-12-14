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
        
        <!-- settings changer 
        <div class="skins-nav">
            <a href="#" class="skin first_nav selected">
                <span class="icon"></span><span class="text">Default</span>
            </a>
            <a href="#" class="skin second_nav" data-file="css/skins/dark.css">
                <span class="icon"></span><span class="text">Dark skin</span>
            </a>
        </div>
        
        -->
        
        <div class="container-fluid">
            <div id="pad-wrapper" class="users-list">
                <div class="row-fluid header">
                    <h3>商户列表</h3>
                    <div class="span10 pull-right">
                        <input type="text" class="span5 search" placeholder="Type a user's name..." />
                        
                        <!-- custom popup filter -->
                        <!-- styles are located in css/elements.css -->
                        <!-- script that enables this dropdown is located in js/theme.js -->
                        <div class="ui-dropdown">
                            <div class="head" data-toggle="tooltip" title="Click me!">
                                                                                           过滤
                                <i class="arrow-down"></i>
                            </div>  
                            <div class="dialog">
                                <div class="pointer">
                                    <div class="arrow"></div>
                                    <div class="arrow_border"></div>
                                </div>
                                <div class="body">
                                    <p class="title">
                                        Show users where:
                                    </p>
                                    <div class="form">
                                        <select>
                                            <option />Name
                                            <option />Email
                                            <option />Number of orders
                                            <option />Signed up
                                            <option />Last seen
                                        </select>
                                        <select>
                                            <option />is equal to
                                            <option />is not equal to
                                            <option />is greater than
                                            <option />starts with
                                            <option />contains
                                        </select>
                                        <input type="text" />
                                        <a class="btn-flat small">Add filter</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <a href="./toaddmchuser" class="btn-flat success pull-right">
                            <span>&#43;</span>
                                                                               添加商户
                        </a>
                    </div>
                </div>

                <!-- Users table -->
                <div class="row-fluid table">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th class="span2 sortable">
                                                                                               商户名
                                </th>
                                <th class="span3 sortable"><span class="line"></span>店铺名</th>
                                <th class="span3 sortable"><span class="line"></span>商品地址</th>
                                <th class="span2 sortable"><span class="line"></span>总收入</th>
                                <th class="span2 sortable"><span class="line"></span>总交易次数</th>
                                <th class="span2 sortable"><span class="line"></span>注册时间</th>
                                <th class="span2 sortable"><span class="line"></span>级别/积分</th>
                                <th class="span2 sortable"><span class="line"></span>状态</th>
                                <th class="span2 sortable"><span class="line"></span>服务类型</th>
                                <th class="span2 sortable"><span class="line"></span>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                        <!-- row -->
                        <c:forEach items="${mchUsers}" var="mchUser">
                          <tr>
                            <td><a href="user-profile.html" class="name">${mchUser.mchName}</a></td>
                            <td>${mchUser.shopName}</td>
                            <td>${mchUser.shopAddress}</td>
                            <td>${mchUser.totalMoney}</td>
                            <td>${mchUser.totalSaleCount}</td>
                            <td>${mchUser.registerTime}</td>
                            <td>${mchUser.mchLelvel}级<font color="blue">/</font>${mchUser.points}分</td>
                            <td>${mchUser.mchStatus}</td>
                            <c:choose>  
                                <c:when test="${mchUser.serviceType == 0}">  
                                  <td>微信服务商</td>                                                                
                                </c:when>  
                                <c:when test="${mchUser.serviceType == 1}">  
                                  <td>折扣码</td>
                                </c:when>
                            </c:choose>
                            <td><span class="label label-info">注销</span></td>
                          </tr>
                         </c:forEach>
                        </tbody>
                    </table>
                </div>
					<div class="pagination">
						<ul>
							<li><a
								href="?currentPage=${currentPage-1}">&#8249&#8249</a></li>
							<li>
							<li><a
								href="?currentPage=${currentPage+1}">&#8250&#8250</a></li>
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