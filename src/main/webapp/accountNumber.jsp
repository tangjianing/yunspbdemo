<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>账号统计</title>
		<!--bootstrap-->
		<link rel="stylesheet" href="css/bootstrap.css" />
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="js/bootstrap.js"></script>
		<!--文字-->
		<link rel="stylesheet" href="css/iconfont.css" />
		<!--top样式-->
		<link rel="stylesheet" href="css/topPublic.css" />
		<!--own-->
		<link rel="stylesheet" href="css/attendance.css" />
		<link rel="stylesheet" href="css/datepicker.css" />
		<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css" />
		<style type="text/css">
			.bodystyle {
				filter: alpha(opacity=60);
				-moz-opacity: 0.6;
				-khtml-opacity: 0.6;
				opacity: 0.8;
				height: 100%;
				width: 100%;
				position: absolute;
				background: url(images/bg8.jpg) no-repeat;
				background-size: cover;
				z-index: -1;
			}
			
			.addClass {
				box-shadow: 6px 6px 12px #888;
			}
			
			#fixHead tr td,
			#tableBody tr td {
				border: 2px solid #939874;
				text-align: center;
				font-size: 10px;
				height: 30px;
				padding: 0px;
				margin: 0px;
			}
			
			#fixHead {
				position: fixed;
				z-index: 999;
				background: #75E1D6;
			}
			
			#tableBody,
			#fixHead {
				width: 1170px;
			}
			
			.num,
			.del,
			.delBT {
				cursor: pointer;
				color: #f10a36;
			}
			
			.search {
				background: #2be2b8;
				width: 70px;
				height: 30px;
				font-size: 16px;
				border-radius: 5px;
			}
			
			.bust {
				width: 105px;
				height: 35px;
				background: rgb(255, 195, 59);
				color: #fff;
				font-size: 16px;
				border-radius: 5px;
			}
			
			
			.addBack {
				background: rgb(73, 234, 220);
			}
			
			#littleTable tr td {
				border: 1px solid;
			}
			
			.selProNum {
				cursor: pointer;
			}
			
			#shink tr td {
				border: 1px solid;
			}
			
			.prev,
			.next {
				background: #a7c7f1;
			}
			
			table input {
				width: 100%;
				height: 100%;
			}
			
			.yearMonth {
				width: 63px
			}
			
			.start {
				width: 78px
			}
			
			.end {
				width: 78px
			}
			
			tr>:nth-child(1) {
				width: 90px
			}
		
			tr>:nth-child(2) {
				width: 75px
			}
		
			tr>:nth-child(3) {
				width: 65px
			}
			
			tr>:nth-child(4) {
				width: 130px
			}
			
			tr>:nth-child(5) {
				width: 60px
			}
			
			tr>:nth-child(6) {
				width: 80px
			}
			
			tr>:nth-child(7) {
				width: 80px
			}
			
		</style>
</head>
<body lang="zh-CN">
		<div class="bodystyle">
		</div>
		<!--TOP-->
		<div id="top" class="row">
			<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
				<img style="width: 40%; padding-top: 3%" src="images/logo.png" />
			</div>
			<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
				<span>您好!</span>
				<span id="name" style="color: white;"></span>
				<span>，欢迎登陆！</span>
				<span class="mui-icon iconfont icon-close top"></span>
				<a href="https://passport.escience.cn/logout?WebServerURL=http://159.226.188.120:8080/spbdemo/login.html"><span id="logout">退出登录</span></a>&nbsp;&nbsp;
				<span class="mui-icon iconfont icon-icon1460189584239"></span>
				<a href="index.jsp">返回主页</a>
			</div>
		</div>
		<!--END TOP-->
		<div class="container">
			<div class="row" style="height: 80px;margin-top: 1%;">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<div class="col-xs-11 col-sm-11 col-md-11 col-lg-11">
						<h1 style="color: #FFF;cursor: pointer;display: inline-block;">账号统计</h1>
						<!-- <span class="mui-icon iconfont icon-bi" style="font-size: 30px;color: #FFF;"></span>
						<span>时间</span>
						<input type="text" style="height: 30px;width: 200px;" id="bussinessTime" class="m-ctrl-medium date-picker datetimepicker" type="text" data-date-format="yyyy-mm-dd" data-date-viewmode="days" readonly="readonly" />
						<input type="text" style="height: 30px;width: 200px;" id="bussinessEndTime" class="m-ctrl-medium date-picker datetimepicker" type="text" data-date-format="yyyy-mm-dd" data-date-viewmode="days" readonly="readonly" />
						
						<button class="search" onclick="search()">查询</button>
						<button class="search" onclick="exports()" style="margin-left: 2%;">导出</button> -->
						</div>
					
				</div>
			</div>
			<div class="row" style="margin-top: 2%;height: 470px;overflow: scroll;">
				
				<table id="fixHead">
					<thead>
						<tr>
							<td colspan="7">用户账号信息统计</td>
						</tr>
						<tr>
							<td>用户账号</td>
							<td>所属用户</td>
							<td>总额度</td>
							<td>根目录</td>
							<td>当前时间</td>
							<td>当前容量</td>
							<td>文件总数</td>
							
						</tr>
					</thead>
				</table>
				<table style="margin-top: 62px;    color: white;" id="tableBody">
					<tbody>

					</tbody>
				</table>
			</div>
		</div>
		<script type="text/javascript">
			var empId=1;
			$(document).ready(function() {
				var user_name=window.localStorage.getItem("user_name");
				$("#name").html(user_name);
				//empId = window.localStorage.getItem("AE_Number");
				initProgramList();
			});
			function initProgramList(){
				
				$.ajax({ 
	                type: "post",
	                dataType:"json",
	                url: "${pageContext.request.contextPath}/showaccountNumber.do",
	                data:{empId:empId},
	                success: function(response){
	                		var html="";
	                		var data=response.data;
	                		if(data.length>0){
	                			for(var i=0;i<data.length;i++){
	               	             html += '<tr>';
							     html += '<td class="selProNum" onclick="fileDetail(this)" file-dir="' + data[i].root_dir + '">' + data[i].account_id + '</td>';	
							     html += '<td >' + data[i].user_name + '</td>';	
							     html += '<td >' + data[i].quota + '</td>';
							     html += '<td >' + data[i].root_dir + '</td>';	
							     html += '<td >' + data[i].dt + '</td>';	
							     html += '<td >' + data[i].bytes_num + '</td>';	
							     html += '<td >' + data[i].file_num + '</td>';	
								 html +='</tr>';
	                        	}
	                			$("#tableBody tbody").html(html);
	                			
	                		}
	            	 },
	            	
	            });
			}
			function fileDetail(e) {
				var fileDir = $(e).attr("file-dir");
				//window.open(encodeURI(fileDetail.jsp + "?userName=" + userName))
				window.location.href =encodeURI('fileDetail.jsp?fileDir='+fileDir);

			}
		</script>
	</body>
</html>