<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@taglib uri="/struts-tags" prefix="s" %> --%>
<html lang="en">
<head>
    <meta charset="utf-8">
   	<title>首页</title>
		<link rel="stylesheet" href="css/iconfont.css" />
		<link href="css/metro.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap.css" rel="stylesheet">
		<link rel="stylesheet" href="css/mui.min.css" />
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.js" ></script>
		<script type="text/javascript" src="js/common.js" ></script>
		
		<style>
			* {
				font-family: '微软雅黑';
			}
			
			html,
			body {
				height: 100%;
			}
			
			body {
				background: url(images/bg8.jpg) no-repeat;
				/*position: absolute;*/
				background-attachment: fixed;
				background-size: 100% 100%;
				margin: 0;
				overflow-x: hidden;
				padding: 0;
				font-size: 12px;
				
			}
			.footer_box{
				width:100%;
				position:fixed;
				bottom:0;left:0;
			}
			.footer_text{
				/*padding:15px 0;*/
				color:#fff;
				font-family: '微软雅黑' ;
				text-align:center;
				font-size:14px;
				text-shadow: 1px 1px 1px rgba(255,255,255, .22);
			}
			
			.font_white {
				color: #777;
				font-size: 18px;
				right: 2%;
				position: absolute;
				top: 2%;
			}
			#logout{
				color: #777;
			}
			.top {
				margin-left: 20px;
				font-size: 21px;
			}
			
			.logo {
				position: absolute;
				left: 5%;
				width: 100%;
				top: 1%;
			}
		
			a,a:hover{
				color: #fff;
				text-decoration: none;
			}
			.tubiao{
				width: 20%;
    			margin: 53px auto;
			}
			.font{
				font-size: 18px;
    			margin-top: -10px;
			}
			.col-md-1{
				width: 5%;
			}
			.shadow{
				box-shadow: 6px 6px 12px #888;
			}
			/*.big:hover{
				height: 210px;
			}*/
			.edit:hover,#logout:hover{
				cursor:pointer;
			}
		</style>
	</head>

	<body>
		<div class="font_white">
			<span>您好，</span>
			<span id="name">${userInfo}</span>
			<span>，欢迎登陆</span>
			<span class="mui-icon iconfont icon-suo top"></span>
			<span class="edit" data-toggle="modal" data-target="#update">修改密码</span>
			<span class="mui-icon iconfont icon-close top"></span>
			<a href="https://passport.escience.cn/logout?WebServerURL=http://159.226.188.120:8080/spbdemo/login.html"><span id="logout">退出登录</span></a>
		</div>
		<div class="logo" style="width: inherit;">
			<img src="images/logo.png" />
		</div>
		<div class="container" style="padding-top: 120px;">
			<div class="col-md-12" style="">
					<div class="col-md-1"></div>
				<div class="col-md-3 shadow box5" style="background: rgb(44, 114, 158);height: 200px;border-radius: 10px;">
					<a style="background: #B4D475;" href="accountNumber.jsp">
						<div class="tubiao">
							<span class="mui-icon iconfont icon-youxiutuandui" style="font-size: 50px"></span>
						</div>
						<div class="font">
							<span>系统通知</span>
						</div>
					</a>
				</div>
				<div class="col-md-1"></div>
				<div class="col-md-3 shadow box1" style="background: rgb(44, 114, 158);height: 200px;border-radius: 10px;">
					<a style="background: #B4D475;" href="adminMange.jsp">
						<div class="tubiao">
							<span class="mui-icon iconfont icon-youxiutuandui" style="font-size: 50px"></span>
						</div>
						<div class="font">
							<span>组织管理</span>
						</div>
					</a>
				</div>
				<div class="col-md-1"></div>
				<div class="col-md-3 shadow box1" style="background: rgb(44, 114, 158);height: 200px;border-radius: 10px;">
					<a style="background: #B4D475;" href="resourceBid.jsp">
						<div class="tubiao">
							<span class="mui-icon iconfont icon-youxiutuandui" style="font-size: 50px"></span>
						</div>
						<div class="font">
							<span>资源申请</span>
						</div>
					</a>
				</div>
			</div>
			<div class="col-md-12" style="padding-top: 30px;">
					<div class="col-md-1"></div>
				<div class="col-md-3 shadow box5" style="background: rgb(44, 114, 158);height: 200px;border-radius: 10px;">
					<a style="background: #B4D475;" href="userMange.jsp">
						<div class="tubiao">
							<span class="mui-icon iconfont icon-youxiutuandui" style="font-size: 50px"></span>
						</div>
						<div class="font">
							<span>用户管理</span>
						</div>
					</a>
				</div>
				<div class="col-md-1"></div>
				<div class="col-md-3 shadow box5" style="background: rgb(44, 114, 158);height: 200px;border-radius: 10px;">
					<a style="background: #B4D475;" href="resExamine.jsp">
						<div class="tubiao">
							<span class="mui-icon iconfont icon-youxiutuandui" style="font-size: 50px"></span>
						</div>
						<div class="font">
							<span>资源审批</span>
						</div>
					</a>
				</div>
				<div class="col-md-1"></div>
				<div class="col-md-3 shadow box5" style="background: rgb(44, 114, 158);height: 200px;border-radius: 10px;">
					<a style="background: #B4D475;" href="resourceMonitor.jsp">
						<div class="tubiao">
							<span class="mui-icon iconfont icon-youxiutuandui" style="font-size: 50px"></span>
						</div>
						<div class="font">
							<span>资源监控</span>
						</div>
					</a>
				</div>
			
			</div>
		
		
		</div>
		<div class="modal fade" id="update" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top: 100px;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel" style="font-family: '微软雅黑';">
							修改密码
						</h4>
					</div>
					<div class="modal-body">
						<form>
							<div>
								<span>姓名：</span>
								<input type="text" style="height: 40px;width: 80%;font-size: 18px;" id="account" readonly="readonly"/>
							</div>
							<div style="margin-top: 10px;">
								<span>密码：</span>
								<input type="password" style="height: 40px;width: 80%;font-size: 18px;" id="psd"/>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
						<button type="button" class="btn btn-primary" onclick="submit()">
							确认
						</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
		<input type="hidden" id="user_name" value="${userInfo}"/>
		<input style="color:red" type="hidden" id="umtId" value="${umtId}"/>
		
	</body><script type="text/javascript"> 
			
			$(document).ready(function() {
				var userInfo=$("#user_name").val();
				var umtId=$("#umtId").val();
				if(userInfo!=""){
					localStorage.setItem("user_name",userInfo);
					localStorage.setItem("umtId",umtId);
					var user_name=window.localStorage.getItem("user_name");
				}else{
					var user_name=window.localStorage.getItem("user_name");
					$("#name").html(user_name);
				}
				//empId = window.localStorage.getItem("AE_Number");
				
			});
			
		</script>
</html>


