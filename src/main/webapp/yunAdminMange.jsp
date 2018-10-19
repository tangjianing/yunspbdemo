<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>课题组管理</title>
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
			
			.addClass {
				box-shadow: 6px 6px 12px #888;
			}
			
			#fixHead tr td,
			#tableBody tr td {
				border: 1px solid #d6d8c7;
				text-align: center;
				font-size: 14px;
				height: 30px;
				padding: 0px;
				margin: 0px;
			}
			
			#fixHead {
				position: absolute;;
				z-index: 999;
				background: #EBEDF1;
			}
			.selProNum {
				cursor: pointer;
			}
			#tableBody,
			#fixHead {
				width: 1030px;
			}
			
			table input {
				width: 100%;
				height: 100%;
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
			.search {
				background: #2be2b8;
				width: 70px;
				height: 30px;
				font-size: 16px;
				border-radius: 5px;
			}
		</style>
	</head>
	<body lang="zh-CN">
		<jsp:include page="common/header.jsp"></jsp:include>
    	<div style="overflow: hidden;">
    		<img src="images/ktz.jpg" style="width: 100%"/>
    	</div>
		<!--END TOP-->
		<div class="container">
			<!-- <div class="row" style="height: 80px;margin-top: 1%;    margin-left: -4%;">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<h1 style="color: #FFF;cursor: pointer;display: inline-block;">组织管理</h1>
					<span class="mui-icon iconfont icon-bi" style="font-size: 30px;color: #FFF;"></span>
						<span style="color:white">课题组名称</span>
						<input type="text" style="height: 30px;width: 200px;" id="orgName" />
						<span style="color:white">管理员</span>
						<input type="text" style="height: 30px;width: 200px;" id="adminName" />
						
						<button class="search" onclick="search()">查询</button>
					
					</div>
					
				</div>
			</div> -->
			<div class="row" style="padding-bottom: 5%;">
				<div class="col-md-12 border" style="margin-top: -6%;background-color: #FFFFFF;">
					<div class="row" style="padding: 2% 5% 1% 5%;">
						<div class="col-md-6">
							<span style="    font-size: 18px;color: black;">课题组数量：</span><span id="ktzsl" style="color:red"></span>
							<!-- <span style="    font-size: 18px;color: black; margin-left: 5%;">已分配总额：</span><span id="yfpze" style="color:red"></span>GB -->
						</div>
						<div class="col-md-6 text-right">
							<span style="">课题组名称</span>
							<input type="text" style="width: 120px;height: 33px;border: 1px solid #E4E4E4;" id="orgName" />
							<span style="">管理员</span>
							<input type="text" style="width: 120px;height: 33px;border: 1px solid #E4E4E4;"id="adminName"  />
							<button onclick="search()" style="width: 60px;height: 35px;border: none;background-color: #0771DB;color: #FFFFFF;">检索</button>
							<button onclick="exports()" style="width: 60px;height: 35px;border: none;background-color: #0771DB;color: #FFFFFF;">导出</button>
						</div>
					</div>
					<div class="row" style="padding: 0 5%;">
						<div class="col-md-12">
							<div style="border: 1px solid #EDEEED;"></div>
						</div>
					</div>
					<div class="row" style="padding: 2% 5%;">
						<div class="col-md-12">
							<div class="row" style=";height: 470px;overflow: scroll; padding-left: 14px;">
								<table id="fixHead">
									<thead>
										<tr>
											<td style="width: 15%;">课题组名称</td>
											<td style="width: 15%;">管理员</td>
											<td style="width: 13%;">启用时间</td>
											<td style="width: 13%;">过期时间</td>
											<td style="width: 10%;"> CPU已使用(核)</td>
											<td style="width: 10%;">内存已使用(GB)</td>
											<td style="width: 12%;">云主机已使用(个)</td>
											<td style="width: 8%;">状态</td>
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
			initProgramList("","")
				
		 })
		function search(){
			var orgName=$("#orgName").val();
			var adminName=$("#adminName").val();
			initProgramList(orgName,adminName)
		}
		function initProgramList(orgName,adminName){
				$.ajax({ 
	                type: "post",
	                dataType:"json",
	                url: "${pageContext.request.contextPath}/showAdminAllInfo.do",
	                data:{orgName:orgName,adminName:adminName},
	                success: function(response){
	                		var html="";
	                		var data=response.data;
	                		$("#ktzsl").html(data.length)
	                		var yfpze=0;
	                		if(data.length>0){
	                			for(var i=0;i<data.length;i++){
	               	             html += '<tr>';
							     html += '<td style="width: 15%;">' + data[i].orgName + '</td>';	
							     html += '<td style="width: 15%;">' + data[i].adminName + '</td>';	
							    if(data[i].params==""||data[i].params=="null"){
							    	html += '<td colspan="6" style="width: 65.6%;">暂未申请资源</td>';
							    }else{
							    	/*  if(data[i].valid=="通过"){
							    		 yfpze+=parseInt(data[i].quota);
							    	 } */
							    	 /* var quota=data[i].quota;
								    	if(quota.length>10){
								    		quota=quota.substring(0,10)+"..."
								    	} */
							    	/*  html += '<td class="selProNum" style="width: 16%;" title="'+data[i].quota +'">' + quota + '</td>'; */
								     html += '<td style="width: 13%;">' + data[i].dt_start + '</td>';
								     html += '<td style="width: 13%;">' + data[i].dt_expired + '</td>';
								     if(data[i].valid=="通过"){
								    	 html += '<td style="width: 10%;">' + data[i].totalCoresUsed + '</td>';
									     html += '<td style="width: 10%;">' + data[i].totalRAMUsed + '</td>';
									     html += '<td style="width: 12%;">' + data[i].totallnstancesUsed + '</td>';	
								     }else {
								    	 html += '<td colspan="3" style="">暂无资源</td>';	
								     }
								     
								     html += '<td style="width: 8%;">' + data[i].valid + '</td>';	
							    }
							     /* if(data[i].valid=="通过"){
							    	 html += '<td ><button class="btn btn-large btn-primary" >停用</button></td>';	
							     }else {
							    	 html += '<td ><button class="btn btn-large btn-primary" >启用</button></td>';	
							     } */
							     if(data[i].params==""||data[i].params=="null"){
								     html += '<td ><span class="selProNum"  style="color:red;"  onclick="delOrgInfo(this)" style="margin-left:10px"   orgId="' + data[i].orgId + '" >删除</span></td>';	
							     }else{
								     html += '<td ><span   style="color: #2c2c88;">暂无</span></td>';	
							     }
								 html +='</tr>';
	                        	}
	                			$("#tableBody tbody").html(html);
	                		/* 	$("#yfpze").html(yfpze); */
	                			
	                		}else{
	                			$("#tableBody tbody").html("<tr><td >暂无数据</td></tr>");
	                		}
	            	 },
	            	
	            });
			}
			/* function userDetail(e) {
				var orgId = $(e).attr("org-id");
				var reduid = $(e).attr("reduid");
				
				window.location.href =encodeURI('accountMange.jsp?orgId='+orgId+'&reduid='+reduid);

			} */
			function delOrgInfo(e)  {
				
				 var msg = "您真的确定要删除吗？\n\n请确认！";
				 if (confirm(msg)==true){
				   var orgId=$(e).attr("orgId")
				   $.ajax({
			           type: "post",
		               dataType:"json",
		               url: "${pageContext.request.contextPath}/delOrgInfoNouse.do",
		               data:{orgId:orgId},
		               success: function(response){           
		               	alert("课题组删除成功")
		               	search()
			           }  
			        });
				 }else{
				 return false;
				 }
			   
			 }
			function exports() {
				//var searchKey = $("#searchKey").val();
				//alert(${pageContext.request.contextPath}/)
				 var url = '${pageContext.request.contextPath}/' + 'exportOrgData.do?';
				 window.location.href = url
				 /* 170	169	tangjianing-ceshi113		Y */

			}
		</script>
	</body>
</html>