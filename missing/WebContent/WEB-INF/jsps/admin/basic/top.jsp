<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
	<!-- navbar -->
	<div class="navbar navbar-inverse">
		<div class="navbar-inner">
			<button type="button" class="btn btn-navbar visible-phone"
				id="menu-toggler">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>

			<a class="brand" href="#"><span
				style="font-size: 30px; font-family: microsoft YaHei;">GooHippo</span></a>

			<ul class="nav pull-right">
				<li class="hidden-phone"><input class="search" type="text" />
				</li>
				<li class="notification-dropdown hidden-phone"><a href="#"
					class="trigger"> <i class="icon-warning-sign"></i> <span
						class="count">0</span>
				</a>
					<div class="pop-dialog">
						<div class="pointer right">
							<div class="arrow"></div>
							<div class="arrow_border"></div>
						</div>
						<div class="body">
							<a href="#" class="close-icon"><i class="icon-remove-sign"></i></a>
							<div class="notifications">
								<h3>0条新信息</h3>
								<div class="footer">
									<a href="#" class="logout">查看所有信息</a>
								</div>
							</div>
						</div>
					</div></li>
				<li class="notification-dropdown hidden-phone"><a href="#"
					class="trigger"> <i class="icon-envelope-alt"></i>
				</a>
					<div class="pop-dialog">
						<div class="pointer right">
							<div class="arrow"></div>
							<div class="arrow_border"></div>
						</div>
						<div class="body">
							<a href="#" class="close-icon"><i class="icon-remove-sign"></i></a>
							<div class="messages">
								<div class="footer">
									<a href="#" class="logout">查看所有消息</a>
								</div>
							</div>
						</div>
					</div></li>
				<li class="dropdown"><a href="#"
					class="dropdown-toggle hidden-phone" data-toggle="dropdown">
						${name} <b class="caret"></b>
				</a>
					<ul class="dropdown-menu">
						<li><a href="#">个人信息</a></li>
						<li><a href="javascript:showDiv()">修改密码</a></li>
					</ul></li>
				<li class="settings hidden-phone"><a href="tomchuserinfo"
					role="button"> <i class="icon-cog"></i>
				</a></li>
				<li class="settings hidden-phone"><a
					href="<%=request.getContextPath()%>/admin/logout" role="button">
						<i class="icon-share-alt"></i>
				</a></li>
			</ul>
		</div>
		
	</div>
	<!-- end navbar -->