<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
	</head>
    <body >
    	<div class="container-fluid" style="width:100%;background-color: #FFFFFF;">
			<div class="container">
			<div class="row" style="height: 80px;">
		    	<div class="col-md-6">
					<img src="images/logo.png" style="margin-top: 18px;    width: 55%;"/>
				</div>
				<div class="col-md-6 text-right" style="font-size:15px;line-height: 80px;">
					<span style="color: #6d6565;">您好@<span id="name">${userInfo}</span>,欢迎登陆</span>
					<a href="https://passport.escience.cn/logout?WebServerURL=http://ecs.cstcloud.cn/yunspbdemo/login.html"><span style="margin-left: 10px;color: #2769c3;cursor: pointer;">退出登录</span></a>
					
					
					<a href="yunIndex.jsp"><span style="margin-left: 10px;color: #2769c3;cursor: pointer;">返回主页</span></a>
					<a href="help.jsp" style="text-decoration: none"><span style="margin-left: 10px;color: #ce4747;cursor: pointer;">帮助</span></a>
				</div>
			</div>
		</div>
		</div>
 	</body>
</html>