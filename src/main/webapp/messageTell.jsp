<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>我的通知</title>
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
			#fixHead tr td,
			#tableBodys tr td {
				border: 1px solid #d6d8c7;
				text-align: center;
				font-size: 14px;
				height: 30px;
				padding: 0px;
				margin: 0px;
			}
			.selProNum {
				cursor: pointer;
			}
			#fixHead {
				position: absolute;;
				z-index: 999;
				background: #EBEDF1;
			}
			#tableBodys,
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
    		<img src="images/banner2.jpg" style="width: 116%;margin-left: -8%;"/>
    	</div>
		<!--END TOP-->
		<div class="container">
			<div class="row" style="padding-bottom: 5%;">
				<div class="col-md-12 border" style="margin-top: -6%;background-color: #FFFFFF;">
					<div class="row" style="padding: 2% 5% 1% 5%;">
						<div class="col-md-6">
							<!-- <input id="searchKey" type="text" placeholder="请输入搜索关键词" style="width: 240px;height: 35px;border: 1px solid #E4E4E4;" />
							<button onclick="search()" style="width: 60px;height: 35px;border: none;background-color: #0771DB;color: #FFFFFF;">检索</button>
							 -->
							 <button id="ishide" data-toggle="modal" data-target="#update"  style="width: 100px;height: 35px;border: none;background-color: #0771DB;color: #FFFFFF;">发布通知</button>
							 
						</div>
						<div class="col-md-6 text-right">
							<button onclick="freshen()" style="width: 60px;height: 35px;border: none;background-color: #0771DB;color: #FFFFFF;">刷新</button>

							
						</div>
					</div>
					<div class="row" style="padding: 0 5%;">
						<div class="col-md-12">
							<div style="border: 1px solid #EDEEED;"></div>
						</div>
					</div>
					<div class="row" style="padding: 2% 5%;">
						<div class="col-md-12">
							<ul id="myTab" class="nav nav-tabs">
								<li class="active">
									<a href="#home" data-toggle="tab">
										 订单通知
									</a>
								</li>
								<li><a href="#ios" data-toggle="tab">系统通知</a></li>
								
							</ul>
						</div>
						<div id="myTabContent" class="tab-content">
							<div class="tab-pane fade in active" id="home">
								 <div class="col-md-12">
									<div class="row" style=";height: 470px;overflow: scroll; padding-left: 14px;">
										<table id="fixHead">
											<thead>
												<tr>
													<td style="width: 10%;">序号</td>
													<td style="width: 60%;">通知标题</td>
													<td style="width: 15%;">通知时间</td>
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
							<div class="tab-pane fade" id="ios">
								<div class="col-md-12">
									<div class="row" style=";height: 470px;overflow: scroll; padding-left: 14px;">
										<table id="fixHead">
											<thead>
												<tr>
													<td style="width: 10%;">序号</td>
													<td style="width: 60%;">通知标题</td>
													<td style="width: 15%;">通知时间</td>
													<td>操作</td> 
												</tr>
											</thead>
										</table>
										<table style="margin-top: 31px;" id="tableBodys">
											<tbody>
		
											</tbody>
										</table>
									</div>
								</div> 
							</div>
						
						</div>
						
						
					</div>

				</div>
			</div>
		</div>
		<div style="width: 50%;margin: auto;padding-top: 63px;" class="modal fade" id="update" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top: 100px;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel" style="font-family: '微软雅黑';">
						发布系统通知
						</h4>
					</div>
					<div class="modal-body">
						<form>
							
							<div style="margin-top: 10px;">
								<textarea placeholder="请填写通知内容" id="message" rows="10" cols="78"></textarea>
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
		<jsp:include page="common/footer.jsp"></jsp:include>
		<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
		<script type="text/javascript">
		var umtId=window.localStorage.getItem("umtId");
		
		$(document).ready(function() {
		    var user_name=window.localStorage.getItem("user_name");
			$("#name").html(user_name);
			initProgramList()
			initMessageList()	
			initSystemList(umtId)
		 })
	
		function initProgramList(){
			
				$.ajax({ 
	                type: "post",
	                dataType:"json",
	                url: "${pageContext.request.contextPath}/showMessageInfo.do",
	                data:{umtId:umtId,uid:""},
	                success: function(response){
	                		var html="";
	                		var data=response.data;
	                		if(data.length>0){
	                			for(var i=0;i<data.length;i++){
	               	             html += '<tr>';
							     html += '<td style="width: 10%;">' +(i+1) + '</td>';	
							     html += '<td style="width: 60%;">' + data[i].message + '</td>';	
							     html += '<td style="width: 15%;">' + data[i].dt_created + '</td>';
							     if(data[i].identify=='0'){
								     html += '<td ><span style="color:red" class="selProNum" onclick="messageDetail(this)" uid="' + data[i].uid + '"    >查看详情</span></td>';	
 
							     }else{
								     html += '<td ><span style="color:blue" class="selProNum" onclick="messageDetail(this)" uid="' + data[i].uid + '"    >查看详情</span></td>';	
							     }
							     html +='</tr>';
	                        	}
	                			$("#tableBody tbody").html(html);
	                		}else{
	                			$("#tableBody tbody").html("<tr><td >暂无数据</td></tr>");
	                		}
	            	 },
	            	
	            });
			}
		function initMessageList(){
			
			$.ajax({ 
                type: "post",
                dataType:"json",
                url: "${pageContext.request.contextPath}/showXiTongMessageInfo.do",
                data:{uid:""},
                success: function(response){
                		var html="";
                		var data=response.data;
                		if(data.length>0){
                			for(var i=0;i<data.length;i++){
               	             html += '<tr>';
						     html += '<td style="width: 10%;">' +(i+1) + '</td>';	
						     html += '<td style="width: 60%;">【系统通知】系统升级通知:请点击详情查看具体信息</td>';	
						     html += '<td style="width: 15%;">' + data[i].dt_created + '</td>';
						    
							 html += '<td ><span style="" class="selProNum" onclick="messageSystemDetail(this)" uid="' + data[i].uid + '"    >查看详情</span></td>';	
						    
						     html +='</tr>';
                        	}
                			$("#tableBodys tbody").html(html);
                		}else{
                			$("#tableBodys tbody").html("<tr><td >暂无数据</td></tr>");
                		}
            	 },
            	
            });
		}
		   function messageDetail(e) {
				var uid = $(e).attr("uid");
				$.ajax({ 
	                type: "post",
	                dataType:"json",
	                url: "${pageContext.request.contextPath}/updateMessageIdentify.do",
	                data:{uid:uid},
	                success: function(response){
	                	window.location.href =encodeURI('messageTellDetail.jsp?uid='+uid);
	            	 },
	            });

			} 
		   function messageSystemDetail(e) {
				var uid = $(e).attr("uid");
				window.location.href =encodeURI('messageSystemDetail.jsp?uid='+uid);

			} 
			function freshen(){
				initProgramList()
				initMessageList()
			}
			function submit(){ 
		   	 	
	   	 		
	   	 		var message=$("#message").val();
	   	 	    
		   	 	if(message==""||message==null){
			    	alert("通知内容不能为空");
			    	return;
			    }
		   	 	
		        $.ajax({
		        	type: "post",
	                dataType:"json",
	                url: "${pageContext.request.contextPath}/addSystemMessage.do",
	                data:{message:message,umtId:umtId},
	                success: function(response){           
	                	window.location.reload()
	                	//$("#update").modal("hide");
		            }  
		        });   
	   		}
			
			function initSystemList(umtId){
				
				$.ajax({ 
	                type: "post",
	                dataType:"json",
	                url: "${pageContext.request.contextPath}/selectRoleInfo.do",
	                data:{umtId:umtId},
	                success: function(response){
	                		var html="";
	                		var data=response.data;
	                	
	                		if(data.length>0){
	                			for(var i=0;i<data.length;i++){
	                			 var role =data[i].role
			                	
	                			
	                			  if(role=="0"){
			                			$("#ishide").show()
			                		}else{
			                			
			                			$("#ishide").hide()
			                		}   
	                        	}
	                			
	                		}else{
	                			$("#ishide").hide()
	                		}
	            	 },
	            	
	            });
			}
		</script>
	</body>
</html>