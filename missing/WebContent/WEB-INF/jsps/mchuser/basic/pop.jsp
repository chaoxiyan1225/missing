<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div id="popDiv" class="mydiv" style="display: none;">
	<h1
		style="color: white; font-family: 黑体; margin-top: 10px; margin-bottom: 30px;">修改密码</h1>
	<div class="contact-form">
		<div class="signin">
			<div id="pwd1">
				<input id="oldpwd" type="password" placeholder="请输入原密码"
					onblur="validate(this)" />
			</div>
			<div id="wrongpwd"></div>
			<div id="pwd2">
				<input id="newpwd1" type="password" placeholder="请输入新密码(3-15位英文及数字)" />
			</div>
			<div id="pwd3">
				<input id="newpwd2" type="password" placeholder="请再次输入原密码" />
			</div>
			<div id="pwd4">
				<input id="edit" type="button" value="修改" onclick="subForm();" /><input
					id="cancel" type="button" onclick="closeDiv()" value="取消">
			</div>
		</div>
	</div>

</div>
<div id="bg" class="bg" style="display: none;"></div>
<iframe id='popIframe' class='popIframe' frameborder='0'></iframe>