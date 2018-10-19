<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>资源审批</title>
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
			#tableBodys tr td,
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
			
			#tableBody,
			#fixHead {
				width: 1030px;
			}
			#tableBodys{
				width: 848px;
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
				width: 92px
			}
		
			tr>:nth-child(2) {
				width: 75px
			}
		
			tr>:nth-child(3) {
				width: 65px
			}
			
			tr>:nth-child(4) {
				width: 129px
			}
			
			tr>:nth-child(5) {
				width: 66px
			}
			
			tr>:nth-child(6) {
				width: 83px
			}
			
			 .modal-footer {
			    padding: 15px;
			    text-align: center;
			    border-top: 1px solid #e5e5e5;
			} 
			
		</style>
	</head>
	<body lang="zh-CN">
		<jsp:include page="common/header.jsp"></jsp:include>
		<div style="overflow: hidden;">
			<img src="images/banner1.jpg" style="width: 116%;margin-left: -8%;" />
		</div>
		<!--END TOP-->
		<div class="container">
			<div class="row" style="padding-bottom: 5%;">
				<div class="col-md-12 border" style="margin-top: -6%;background-color: #FFFFFF;">
					<div class="row" style="padding: 2% 5% 1% 5%;">
						<div class="col-md-6">
							<span style="    font-size: 18px;color: black;">待审批订单：</span><span id="shenpidan" style="color:red">7</span>
						</div>
						
					</div>
					<div class="row" style="padding: 0 5%;">
						<div class="col-md-12">
							<div style="border: 1px solid #EDEEED;"></div>
						</div>
					</div>
					<div class="row" style="padding: 2% 5%;">
						<div class="col-md-12">
							<div class="row" style="height: 470px;overflow: scroll; padding-left: 14px;"">

								<table id="fixHead">
									<thead>
										<tr>
											<td style="width: 30%;">订单编号</td>
											<td style="width: 12%;">申请人</td>
											<td style="width: 12%;">申请时间</td>
											<td style="width: 12%;">审核状态</td>
											<td style="width: 22%;">审核说明</td>
											<td style="width: 12%;">操作</td>
										</tr>
									</thead>
								</table>
								<table style=" margin-top: 32px;" id="tableBody">
									<tbody>

									</tbody>
								</table>
							</div>
						</div>
						<div class="modal fade" id="update" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top: 17px;    margin-left: -24%;">
							<div class="modal-dialog">
								<div class="modal-content"style="width:900px !important">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
											&times;
										</button>
										<h4 class="modal-title" id="myModalLabel" style="font-family: '微软雅黑';">
											订单详情
										</h4>
									</div>
									<div class="modal-body">
										<form>
											<div class="row">
												<div class="col-md-3" style="padding-left:27px">
													<div  style="line-height: 30px;height: 36px; float:left">申请人： </div>
													<input type="hidden" style="height: 30px;width: 65%;font-size: 18px; float:left" id="orderId" disabled="disabled" />
													<input type="hidden" style="height: 30px;width: 65%;font-size: 18px; float:left" id="applyId" disabled="disabled" />
													<input type="hidden" style="height: 30px;width: 65%;font-size: 18px; float:left" id="email" disabled="disabled" />
													<input type="text" style="height: 27px;width: 65%;font-size: 16px; float:left;border: none; background-color: white" id="userName" disabled="disabled" />
												</div>
												<div class="col-md-3" style="padding-left:27px">
													<div style="line-height: 30px;height: 36px; float:left">课题组： </div>
													<input type="text" style="height: 27px;width: 65%;font-size: 16px;float:left;border: none; background-color: white" id="ktzname" disabled="disabled" />
												</div>
												<div class="col-md-3" style="padding-left:27px">
													<div style="line-height: 30px;height: 36px;float:left">申请日期： </div>
													<input type="text" style="height: 27px;width: 61%;font-size: 16px;float:left;border: none; background-color: white" id="dt_created" disabled="disabled" />
												</div>
												<div class="col-md-3" style="padding-left:27px">
													<div style="line-height: 30px;height: 36px;float:left">申请状态： </div>
													<input type="text" style="height: 27px;width: 57%;font-size: 16px;float:left;border: none; background-color: white" id="valid" disabled="disabled" />
												</div>
												<div class="col-md-3" style="padding-left:27px">
													<div style="line-height: 30px;height: 36px;float:left">联系人： </div>
													<input type="text" style="height: 27px;width: 57%;font-size: 16px;float:left;border: none; background-color: white" id="contact_person" disabled="disabled" />
												</div>
												<div class="col-md-3" style="padding-left:27px">
													<div style="line-height: 30px;height: 36px;float:left">联系方式： </div>
													<input type="text" style="height: 27px;width: 57%;font-size: 16px;float:left;border: none; background-color: white" id="contact_phone" disabled="disabled" />
												</div>
											</div>
											<div class="row" style="height: 174px;overflow: scroll; padding-top: 20px;padding-left: 27px;">
												<table id="fixHead" style="width:848px !important">
													<thead>
														<tr>
															<td style="width: 15%;">资源类型</td>
															<td style="width: 15%;">存储容量(GB)</td>
															<td style="width: 15%;">启用时间</td>
															<td style="width: 15%;">过期时间</td>
															<td>申请理由</td>
														</tr>
													</thead>
												</table>
												<table style=" margin-top: 32px;" id="tableBodys">
													<tbody>
				
													</tbody>
												</table>
											</div>
										
										
											<!-- <div class="row">
												<div class="col-md-4" style="padding-left:27px">
													<div style="height: 36px;">申请人： </div>
													<div style="height: 36px;">申请课题组： </div>
													<div style="height: 36px;">资源类型： </div>
													<div style="height: 36px;">存储容量： </div>
													<div style="height: 36px;">申请日期： </div>
													<div style="height: 36px;">资源起用日期： </div>
													<div style="height: 36px;">资源过束日期： </div>
													<div style="height: 36px;">申请理由： </div>
													<div style="height: 36px;">申请状态： </div>

												</div>
												<div class="col-md-8">
													<div style="padding-bottom: 5px;">
														<input type="hidden" style="height: 30px;width: 80%;font-size: 18px;" id="orderId" disabled="disabled" />
														<input type="hidden" style="height: 30px;width: 80%;font-size: 18px;" id="applyId" disabled="disabled" />
													
														<input type="text" style="height: 30px;width: 80%;font-size: 18px;" id="userName" disabled="disabled" />
													</div>
													<div style="padding-bottom: 5px;">
														<input type="text" style="height: 30px;width: 80%;font-size: 18px;" id="ktzname" disabled="disabled" />
													</div>
													<div style="padding-bottom: 5px;">
														<input type="text" style="height: 30px;width: 80%;font-size: 18px;" id="res_name" disabled="disabled" />
													</div>
													<div style="padding-bottom: 5px;">
														<input type="text" style="height: 30px;width: 80%;font-size: 18px;" id="params" disabled="disabled" />
													</div>
													<div style="padding-bottom: 5px;">
														<input type="text" style="height: 30px;width: 80%;font-size: 18px;" id="dt_created" disabled="disabled" />
													</div>
													<div style="padding-bottom: 5px;">
														<input type="text" style="height: 30px;width: 80%;font-size: 18px;" id="dt_start" disabled="disabled" />
													</div>

													<div style="padding-bottom: 5px;">
														<input type="text" style="height: 30px;width: 80%;font-size: 18px;" id="dt_expired" disabled="disabled" />
													</div>
													<div style="padding-bottom: 5px;">
														<input type="text" style="height: 30px;width: 80%;font-size: 18px;" id="apply_reason" disabled="disabled" />
													</div>
													<div style="padding-bottom: 5px;">
														<input type="text" style="height: 30px;width: 80%;font-size: 18px;" id="valid" disabled="disabled" />
													</div>

												</div>
											</div> -->

										</form>
									</div>
									<div class="modal-footer" id="footer">
										<div style="    text-align: left;padding-left: 1%;padding-bottom: 10px;font-size: 15px;">审核意见</div>
										<div>
											<textarea id="comments" rows="7" cols="115"></textarea>
										</div>
										<button style="background-color: red; color: white;margin-top: 10px;margin-right: 10%;" type="button" class="btn btn-default" onclick="submitYes()">同意
										</button>
										<button style="margin-top: 10px" type="button" class="btn btn-primary" onclick="submitNo()">
										拒绝
										</button>
									</div>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal -->
						</div>
					</div>
</div>
				</div>
			</div>
		</div>
		<jsp:include page="common/footer.jsp"></jsp:include>
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
	                url: "${pageContext.request.contextPath}/checkInfo.do",
	                data:{uid:""},
	                success: function(response){
	                		var html="";
	                		var data=response.data;
	                		if(data.length>0){
	                			var a=0;
	                			for(var i=0;i<data.length;i++){
	                			 var comments =data[i].comments
	                			 if(comments==""||comments==null){
	                				 comments="暂无"
	                			 }
	                			 if(data[i].valid=="待审核"){
	                				 a=a+1;
	                			 }
	               	             html += '<tr>';
							     html += '<td style="width: 30%;" class="selProNum"  >' + data[i].id + '</td>';	
							     html += '<td style="width: 12%;">' + data[i].name + '</td>';	
							     html += '<td style="width: 12%;">' + data[i].dt_created + '</td>';
							     html += '<td style="width: 12%;">' + data[i].valid + '</td>';	
							     html += '<td style="width: 22%;">' + comments + '</td>';	
							    /*  html += '<td >' + data[i].contact_person + '</td>';
							     html += '<td >' + data[i].contact_phone + '</td>'; */
							     html += '<td style="width: 12%;"><span class="selProNum" style="    color: #689BE4;" uid="' + data[i].id + '"  onclick="orderDetail(this)"   data-toggle="modal" >查看详情</span></td>';
								 html +='</tr>';
	                        	}
	                			$("#tableBody tbody").html(html);
	                			$("#shenpidan").html(a)
	                		}
	            	 },
	            	
	            });
			}
			/* function fileDetail(e) {
				var fileDir = $(e).attr("file-dir");
				//window.open(encodeURI(fileDetail.jsp + "?userName=" + userName))
				window.location.href =encodeURI('fileDetail.jsp?fileDir='+fileDir);

			} */
			var uid = "";
			var res_ids = "";
			function orderDetail(e)  {
				uid = $(e).attr("uid");
				$.ajax({ 
	                type: "post",
	                dataType:"json",
	                url: "${pageContext.request.contextPath}/checkInfoDetail.do",
	                data:{uid:uid},
	                success: function(response){
	                		var html="";
	                		var data=response.data;
	                		if(data.length>0){
	                			for(var i=0;i<data.length;i++){
	                				
	                				html += '<tr>';
	        				     	html += '<td style="width: 15%;">' + data[i].resName + '</td>';	
	        				     	html += '<td style="width: 15%;">' + data[i].quota + '</td>';	
	        				    	html += '<td style="width: 15%;">' + data[i].dt_start + '</td>';
	        				     	html += '<td style="width: 15%;">' + data[i].dt_expired + '</td>';	
	        				     	html += '<td >' + data[i].apply_reason + '</td>';	
	        					 	html +='</tr>';
	        					 	var orderId=data[i].id
		                			var applyId=data[i].applyId
		                			var email=data[i].email
		                			$("#applyId").val(applyId)
		                			$("#orderId").val(orderId)
		                			$("#email").val(email)
	        					 	var valid =data[i].valid
	        					 	$("#valid").val(valid)
	        					 	var userName =data[i].name
	        					 	$("#userName").val(userName)
	        					 	var name =data[i].orgName
	                			    $("#ktzname").val(name)
	                			    var dt_created =data[i].dt_created
	                			    $("#dt_created").val(dt_created)
	                			    var contact_person =data[i].contact_person
	                			    $("#contact_person").val(contact_person)
	                			    var contact_phone =data[i].contact_phone
	                			    $("#contact_phone").val(contact_phone)
	                			  
	                			 /* var userName =data[i].userName
	                			 var name =data[i].name
	                			 var res_name =data[i].res_name
	                			 var params =data[i].params
	                			 var dt_created =data[i].dt_created
	                			 var dt_start =data[i].dt_start
	                			 var dt_expired =data[i].dt_expired
	                			 var valid =data[i].valid
	                			 var apply_reason =data[i].apply_reason
	                			 
	                			 var orderId=data[i].res_ids
	                			 var applyId=data[i].applyId
	                			 
	                			 $("#applyId").val(applyId)
	                			 $("#orderId").val(orderId)
	                			 $("#userName").val(userName)
	                			  $("#ktzname").val(name)
	                			 
	                			 $("#res_name").val(res_name)
	                			 $("#params").val(params)
	                			 $("#dt_created").val(dt_created)
	                			 $("#dt_start").val(dt_start)
	                			 $("#dt_expired").val(dt_expired)
	                			  $("#apply_reason").val(apply_reason)
	                			 $("#valid").val(valid) */
	                			 if(valid!="待审核"){
	                				 $("#footer").hide()
	                			 }else{
	                				 $("#footer").show()
	                			 }
	                        	}
	                			$("#tableBodys tbody").html(html);
	                		}
	            	 },
	            	
	            });
				$(e).attr("data-target","#update")
			}
			function submitYes(){
				var comments = $("#comments").val();
				var applyId = $("#applyId").val();
				var orderId = $("#orderId").val();
				var email = $("#email").val();
			  $.ajax({
		        	type: "post",
	                dataType:"json",
	                url: "${pageContext.request.contextPath}/checkIsYes.do",
	                data:{uid:uid,res_ids:res_ids,comments:comments,valid:"Y",applyId:applyId,orderId:orderId,email:email},
	                success: function(response){           
	                	window.location.reload()
	                	
		            }  
		        });    
			}
			function submitNo(){
				var comments = $("#comments").val();
				var applyId = $("#applyId").val();
				var orderId = $("#orderId").val();
				var email = $("#email").val();
				 $.ajax({
		        	type: "post",
	                dataType:"json",
	                url: "${pageContext.request.contextPath}/checkIsYes.do",
	                data:{uid:uid,res_ids:res_ids,comments:comments,valid:"N",applyId:applyId,orderId:orderId,email:email},
	                success: function(response){           
	                	window.location.reload()
	                	
		            }  
		        });   
			}
		</script>
	</body>
</html>