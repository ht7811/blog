<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/taglib.jsp"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>咦，我怎么在这里</title>
<link rel="shortcut icon" type="image/x-icon" href="${basePath}/static/images/favicon.ico" media="screen" />
<link rel="stylesheet" type="text/css" href="${basePath}/static/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="${basePath}/static/css/demo.css" />
<!--必要样式-->
<link rel="stylesheet" type="text/css" href="${basePath}/static/css/component.css" />
<!--[if IE]>
<script src="${basePath}/static/js/html5.js"></script>
<![endif]-->
</head>
<body style="padding-top: 0;padding-bottom: 0;">
        <!-- 登录窗口 -->
      <div class="container demo-1">
			<div class="content">
				<div id="large-header" class="large-header">
					<canvas id="demo-canvas"></canvas>
					<div class="logo_box">
						<h3>欢迎你</h3>
							<div class="input_outer">
								<span class="u_user"></span>
								<input name="username" id="username" class="text" style="color: #FFFFFF !important" type="text" placeholder="请输入账户">
							</div>
							<div class="input_outer">
								<span class="us_uer"></span>
								<input name="password" id="password" class="text" style="color: #FFFFFF !important; position:absolute; z-index:100;"value="" type="password" placeholder="请输入密码">
							</div>
							<div class="mb2 text-center"><button class="act-but button" onclick="login();" style="padding: 8px 0;width: 100%;color: #FFFFFF;border: none;">登录</button></div>
					</div>
				</div>
			</div>
		</div><!-- /container -->
		<script src="${basePath}/static/js/TweenLite.min.js"></script>
		<script src="${basePath}/static/js/EasePack.min.js"></script>
		<script src="${basePath}/static/js/rAF.js"></script>
		<script src="${basePath}/static/js/demo-1.js"></script>
		<script type="text/javascript" src="${basePath}/static/js/jquery.min.js"></script>
		<script>
			function login(){
				var username = $('#username').val();
				var password = $('#password').val();
				$.ajax({
					type: "post",
					url: "${basePath}/controller/loginController.jsp",
					data: {
						"username": username,
						"password": password
					},
					error: function(){
						alert("登录出错！");
					},
					success: function(data){
						if(data == -1){
							alert("用户名和密码不能为空!");
						}else if(data == -2){
							alert("用户名不存在!");
						}else if(data == -3){
							alert("用户名或密码错误！");
						}else{
							//登录成功后返回首页
							window.location.href = "${basePath}/index.jsp"
						}
					}
				});
			}
		</script>
</body>
</html>