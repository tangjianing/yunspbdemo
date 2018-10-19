<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>系统通知详情</title>
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
				    padding-left: 10px;
				font-size: 16px;
				height: 30px;
				
			}
			.selProNum {
				cursor: pointer;
			}
			#fixHead {
				position: absolute;;
				z-index: 999;
				background: #EBEDF1;
			}
			
			#tableBody,
			#fixHead {
				width: 910px;
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
<!--     		<img src="images/banner2.jpg" style="width: 116%;margin-left: -8%;"/>
 -->    	</div>
		<!--END TOP-->
		<div class="container">
			<div class="row" style="padding-bottom: 3%;">
				<div class="col-md-12 border" style="margin-top: 2%;background-color: #FFFFFF;height: 760px;">
					
					<div class="row" style="padding: 2% 5%;">
						<div class="col-md-12" style="    ">
							<button onclick="javascript:history.back(-1);" style="width: 102px;height: 35px;border: none;background-color: #ebedf1;color: #2c2c88;    margin-top: 0px;">返回上一页</button>
						</div>		
						<div class="col-md-12" style="    ">
							<h4 style="text-align: center;color: black;" id="title"></h4>
						</div>							
						
						<div class="col-md-12" style="font-size:16px;padding-top: 15px;">
							<p>您好：</p>
							<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="nametitle"></span>&nbsp;&nbsp;&nbsp;&nbsp;详情如下</p>
						</div>
						<div class="col-md-12" style="    padding-left: 4.9%;">
			                    
			                    <div class="row" style="padding: 1% 4%;    min-height: 250px;">
			                    	<div class="col-md-12" style="    font-size: 16px;">
			                    		<div class="col-md-3">申请信息：</div>
			                    		
			                    	</div>	
			                    	
			                    	
			                    	<div class="col-md-12" style="    font-size: 16px;padding-top: 20px;">
			                    		<div class="col-md-4">用户名称：<span id="username"></span></div>
			                    		<div class="col-md-4">邮箱：<span id="email"></span></div>
			                    		<div class="col-md-4">课题组：<span id="orgName"></span></div>
			                    	</div>	
			                    	<div class="col-md-12" style="    font-size: 16px;padding-top: 20px;">
			                    		<div class="col-md-4">启用时间：<span id="dt_start"></span></div>
			                    		<div class="col-md-4">过期时间：<span id="dt_expired"></span></div>
			                    	</div>	
			                    	<div class="col-md-12" style="    font-size: 16px;padding-top: 20px;">
			                    		<div class="col-md-12">申请理由：<span id="comments"></span></div>
			                    	</div>	
			                    	<div class="col-md-12" style="    font-size: 16px;padding-top: 20px;">
			                    		<div class="col-md-4">CPU数量(核)：<span id="cores"></span></div>
			                    		<div class="col-md-4">云主机数量(个)：<span id="instances"></span></div>
			                    		<div class="col-md-4">内存容量(GB)：<span id="ram"></span></div>
			                    	</div>	
			                    	<div class="col-md-12" style="    font-size: 16px;padding-top: 20px;">
			                    		<div class="col-md-4">存储总容量(GB)：<span id="gigabytes"></span></div>
			                    		<div class="col-md-4">快照数量(个)：<span id="snapshorts"></span></div>
			                    		<div class="col-md-4">云硬盘数量(个)：<span id="volumes"></span></div>
			                    	</div>
			                    	<div class="col-md-12" style="    font-size: 16px;padding-top: 20px;">
			                    		<div class="col-md-4">路由器数量(个)：<span id="router"></span></div>
			                    		<div class="col-md-4">防火墙数量(个)：<span id="firewall"></span></div>
			                    		<div class="col-md-4">网络数量(个)：<span id="network"></span></div>
			                    	</div>	
			                    	<div class="col-md-12" style="    font-size: 16px;padding-top: 20px;">
			                    		<div class="col-md-4">负载均衡数量(个)：<span id="loadbalancer"></span></div>
			                    		<div class="col-md-4">网卡数量(个)：<span id="vnic"></span></div>
			                    		<div class="col-md-4">公网IP数量(个)：<span id="floatingip"></span></div>
			                    	</div>	
									<!-- <div class="col-md-12" style="    padding-left: 43px;padding-top: 20px;">
									 <div class="row" style="    min-height: 117px;;overflow: scroll;">
										<table id="fixHead" >
											<thead>
												<tr>
													<td style="width: 15%;">配额(GB)</td>
													<td style="width: 15%;">启用时间</td>
													<td style="width: 15%;">过期时间</td>
													<td style="width: 55%;">申请理由</td>
												</tr>
											</thead>
										</table>
										<table style="margin-top: 31px;position: absolute;" id="tableBody">
											<tbody>
												
											</tbody>
										</table>
									</div>
									</div> -->
									<div class="col-md-12" style="    font-size: 16px;">
			                    		<hr style=" height: 1px;background-color: #c8c6c6;    margin-top: 10px;width: 84%;margin-left: 2%;"/>
			                    		
			                    	</div>	
									<div class="col-md-12" style="    font-size: 16px;display: none" id="sply">
			                    		<div class="col-md-12">审批理由：</div>
			                    		<div class="col-md-12"  style="padding-top: 15px;"><span id="shenpicomments"></span></div>
			                    		
			                    	</div>	
								</div>
								<!-- <table style="margin-top: 14px;    width: 93%;" id="tableBody">
									<tbody>
										
										<tr>
										   <td style="    width: 28%;">用户名称</td>
										   <td id="nameuser"></td>
										</tr>
										<tr>
										   <td>邮箱</td>
										   <td id="email"></td>
										</tr>
										<tr>
										   <td>课题组</td>
										   <td id="orgName"></td>
										</tr>
										<tr>
										   <td>配额</td>
										   <td id="params"></td>
										</tr>
										<tr>
										   <td>启用时间</td>
										   <td id="dt_start"></td>
										</tr>
										<tr>
										   <td>过期时间</td>
										   <td id="dt_expired"></td>
										</tr>
										
									</tbody>
								</table>
							 -->
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
			var url = location.search; //获取url中"?"符后的字串
			var uid;
			if(url!=""&&url!=null){
				uid = getUrlParam('uid');
				uid=decodeURI(uid)
			}
			initProgramList(uid);
		});
		function getUrlParam(param){
			if(location.search.indexOf(param) == -1){
				return "";
			}
			var s=location.search.substr(location.search.indexOf(param)+param.length+1);
			if(s.indexOf("&")!=-1){return s.substring(0,s.indexOf("&"));}
			else{return s;}
		}
	
		function initProgramList(uid){
				$.ajax({ 
	                type: "post",
	                dataType:"json",
	                url: "${pageContext.request.contextPath}/showMessageInfoDetail.do",
	                data:{umtId:umtId,uid:uid},
	                success: function(response){
	                		var html="";
	                		var data=response.data;
	                		if(data.length>0){
	                			
	                			for(var i=0;i<data.length;i++){
	                				/* html += '<tr>';
	        				     	
	        				     	html += '<td style="width: 15%;">' + data[i].quota + '</td>';	
	        				     	html += '<td style="width: 15%;">' + data[i].dt_start + '</td>';
	        				     	html += '<td style="width: 15%;">' + data[i].dt_expired + '</td>';
	        				     	html += '<td style="width: 55%;">' + data[i].comments + '</td>';
	        					 	html +='</tr>'; */
	        					 	$("#username").html(data[i].name)
	                				$("#email").html(data[i].email)
	                				$("#orgName").html(data[i].orgName)
	                				$("#dt_start").html(data[i].dt_start)
	                				$("#dt_expired").html(data[i].dt_expired)
	                				$("#comments").html(data[i].comments)
	                				
	                				$("#cores").html(data[i].cores)
	                				$("#instances").html(data[i].instances)
	                				$("#ram").html(data[i].ram)
	                				$("#gigabytes").html(data[i].gigabytes)
	                				$("#snapshorts").html(data[i].snapshorts)
	                				$("#volumes").html(data[i].volumes)
	                				$("#router").html(data[i].router)
	                				$("#firewall").html(data[i].firewall)
	                				$("#network").html(data[i].network)
	                				$("#loadbalancer").html(data[i].loadbalancer)
	                				$("#vnic").html(data[i].vnic)
	                				$("#floatingip").html(data[i].floatingip)
	                				if(data[i].shenpicomments==""||data[i].shenpicomments==null){
	                					
	                				}else{
	                					$("#shenpicomments").html(data[i].shenpicomments)
	                					$("#sply").show()
	                				}
	                				/* $("#order").html(data[i].message.substring(14,16)) */
	                			/* 	$("#nameuser").html(data[i].name)
	                				$("#nametitle").html(data[i].name)
	                				$("#email").html(data[i].email)
	                				
	                				$("#orgName").html(data[i].orgName)
	                				$("#params").html(data[i].params)
	                				$("#dt_start").html(data[i].dt_start)
	                				$("#dt_expired").html(data[i].dt_expired)
	                				*/
	                				$("#title").html(data[i].message) 
	                				
	                        	}
	                			$("#tableBody tbody").html(html);
	                			
	                		}
	            	 },
	            	
	            });
			}
			
		</script>
	</body>
</html>