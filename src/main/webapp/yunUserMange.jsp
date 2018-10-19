<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>成员管理</title>
		<link rel="icon" href="images/yunji.ico" type="image/x-icon" />
		<link rel="shortcut icon" href="images/yunji.ico" type="image/x-icon" />
		<link rel="bookmark" href="images/yunji.ico" type="image/x-icon" />
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
			body {
   				font-family: "微软雅黑";
	   			background-color: #EBEDF1;
	   		}
			.selProNum {
				cursor: pointer;
			}
			.addClass {
				box-shadow: 6px 6px 12px #888;
			}
			
			#fixHead tr td,
			#tableBody tr td {
				border: 1px solid #d6d8c7;
				text-align: center;
				font-size: 16px;
				height: 30px;
				padding: 0px;
				margin: 0px;
			}
			
			#fixHead {
				position: absolute;;
				z-index: 999;
				background: #EBEDF1;
			}
			
			#tableBody,
			#fixHead {
				width: 1050px;
			}
			table input {
				width: 100%;
				height: 100%;
			}
			
			
			
		/* 	tr>:nth-child(1) {
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
			} */
		</style>
	</head>
	<body lang="zh-CN">
		<jsp:include page="common/header.jsp"></jsp:include>
    	<div style="overflow: hidden;">
    		<img src="images/banner5.jpg" style="width: 100%;"/>
    	</div>
		<!--END TOP-->
		<div class="container">
			<div class="row" style="padding-bottom: 5%;">
		    	<div class="col-md-12 border" style="margin-top: -6%;background-color: #FFFFFF;">
					<!-- <div class="row" style="padding: 2% 5% 1% 5%;">
						<div class="col-md-6">
							<button style="width: 125px;height: 35px;background: #24B81C;border-radius: 5px;color: #FFFFFF;border: none;">+添加用户</button>
						</div>
						<div class="col-md-6 text-right">
							<input type="text" style="width: 240px;height: 35px;border: 1px solid #E4E4E4;"/>
							<button style="width: 60px;height: 35px;border: none;background-color: #0771DB;color: #FFFFFF;">检索</button>
						</div>
					</div> -->
					<div class="row" style="padding: 0 5%;">
						<div class="col-md-12">
							<div style="border: 1px solid #EDEEED;"></div>
						</div>
					</div>
					<div class="row" style="padding: 2% 5%;">
						<div class="col-md-12">
							 <div class="row" style=";height: 470px;overflow: scroll;">
								<table id="fixHead">
									<thead>
										<tr>
											<td style="width: 22.5%;">课题组名称</td>
											<td style="width: 31%;">课题组描述</td>
											<td style="width: 14%;">审核状态</td>
											<td>操作</td>
										</tr>
									</thead>
								</table>
								<table style="margin-top: 31px;" id="tableBody">
									<tbody>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					
		    	</div>
			</div>
		</div>
		<jsp:include page="common/footer.jsp"></jsp:include>
		<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
		<script type="text/javascript">
		var umtId=window.localStorage.getItem("umtId");
		$(document).ready(function() {
		    	var user_name=window.localStorage.getItem("user_name");
				$("#name").html(user_name);
				initProgramList(umtId)
				
		 })
		function initProgramList(umtId){
				$.ajax({ 
	                type: "post",
	                dataType:"json",
	                url: "${pageContext.request.contextPath}/showOrgInfo.do",
	                data:{umtId:umtId},
	                success: function(response){
	                		var html="";
	                		var data=response.data;
	                		if(data.length>0){
	                			for(var i=0;i<data.length;i++){
	               	             html += '<tr>';
							    
							     html += '<td style="width: 22.5%;">' + data[i].name + '</td>';	
							     html += '<td style="width: 31%;">' + data[i].comments + '</td>';
							     html += '<td style="width: 14%;">' + data[i].validname + '</td>';
							     if(data[i].valid=="Y"){
								     html += '<td ><span style="color: #2929e0;" class="selProNum" onclick="userDetail(this)" reduid="' + data[i].reduid + '" org-id="' + data[i].uid + '">账号管理</span></td>';	

							     }else{
								     html += '<td >暂无操作</td>';	

							     }
								 html +='</tr>';
	                        	}
	                			$("#tableBody tbody").html(html);
	                			
	                		}
	            	 },
	            	
	            });
			}
			function userDetail(e) {
				var orgId = $(e).attr("org-id");
				var reduid = $(e).attr("reduid");
				
				//window.open(encodeURI(fileDetail.jsp + "?userName=" + userName))
				window.location.href =encodeURI('yunAccountMange.jsp?orgId='+orgId+'&reduid='+reduid);

			}
		</script>
	</body>
</html>