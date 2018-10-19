<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>首页</title>
		<link rel="icon" href="images/yunji.ico" type="image/x-icon" />
		<link rel="shortcut icon" href="images/yunji.ico" type="image/x-icon" />
		<link rel="bookmark" href="images/yunji.ico" type="image/x-icon" />
		<style>
			body {
				font-family: "微软雅黑";
				 
				background: url(images/index1-bg.jpg) no-repeat;background-size:100% 100% ;
			}
			.shenpishow {
				width: 13%;
			    border: 1px solid white 1px so;
			    position: relative;
			    top: -35%;
    			left: 57%;
			    color: wheat;
			    border: 2px solid white;
			    border-radius: 56%;
			
			}
			.tongzhi {
				width: 13%;
			    border: 1px solid white 1px so;
			    position: relative;
			    top: -36%;
    			left: 60%;
			    color: wheat;
			    border: 2px solid white;
			    border-radius: 56%;
			
			}
			
			
		</style>
		<link href="css/bootstrap1.css" rel="stylesheet" type="text/css" />
        <script src="js/jquery-3.2.1.min.js"></script>
   		<script src="bootstrap/js/bootstrap.min.js"></script>
	</head>
	<body>
		<jsp:include page="common/header.jsp"></jsp:include>
		<div style="">
	
		<div class="container" style="padding: 0 6%; ">
			<div class="row" style="margin: 0px 0 6% 0;">
			
				<!-- <div class="col-md-10" style="color: #4D5567;font-size: 13px;padding: 0;line-height: 25px;">
					<img src="images/icon-pie.png" style="margin-top: -2px;margin-right: 5px;width: 25px;"/>
					<span  >系统可用资源：<span id="usewei" style="color:red"></span>TB</span>
					<span style="margin-left: 20px;" >已用资源：<span id="useyi" style="color:red"></span>TB</span>
					
					
				</div> -->
				<!-- <div class="col-md-2" style="color: #4D5567;font-size: 13px;padding: 0;line-height: 25px;    padding-left: 8%;">
					<img src="images/zip.jpg" style="margin-top: -2px;width: 16px;"/>
					<a href="http://storage.cstcloud.cn/tools/ftpclient.zip"><span style=" color:red" >工具下载</span></a>
				</div> -->
			</div>
			<div class="row" id="orgManger">
			
				<div class="col-md-3 text-center">
				
					<img src="images/zysq.jpg" style="width: 100%;"/>
					<div style="position: relative;top: -32%;">
						<a href="yunResourceBid.jsp"><img src="images/zysqico.png" width="22%"/></a>
						<a href="yunResourceBid.jsp"><p style="color: #FFFFFF;font-size: 14px;margin: 20px 0 10px 0;">资源申请</p></a>
						<!-- <p style="color: #FFFFFF;font-size: 12px;">申请总量：<span>104</span></p> -->
					</div>
				
				</div>
				
				<div class="col-md-3 text-center">
					<img src="images/yhgl.jpg" style="width: 100%;"/>
					<div style="position: relative;top: -32%;">
						<a  href="yunUserMange.jsp"><img src="images/yhglico.png" width="22%"/></a>
						<a  href="yunUserMange.jsp"><p style="color: #FFFFFF;font-size: 14px;margin: 20px 0 10px 0;">成员管理</p></a>
<!-- 						<p style="color: #FFFFFF;font-size: 12px;">用户总数：<span>3025</span></p>
 -->					</div>
				</div>
				<div class="col-md-3 text-center">
					<img src="images/zyjk.jpg" style="width: 100%;"/>
					<div style="position: relative;top: -32%;">
						<a  href="yunResourceMonitor.jsp"><img src="images/zyjkico.png" width="22%"/></a>
						<a  href="yunResourceMonitor.jsp"><p style="color: #FFFFFF;font-size: 14px;margin: 20px 0 10px 0;">我的VPC/云主机</p></a>
<!-- 						<p style="color: #FFFFFF;font-size: 12px;">故障处理：<span>5</span></p>
 -->					</div>
				</div>
				<div class="col-md-3 text-center">
					<img src="images/xttz.jpg" style="width: 100%;"/>
					<div class="tongzhi"></div>
					<div style="position: relative;top: -38%;">
						<a  href="yunMessageTell.jsp"><img src="images/xttzico.png" width="22%"/></a>
						<a  href="yunMessageTell.jsp"><p style="color: #FFFFFF;font-size: 14px;margin: 20px 0 10px 0;">我的通知</p></a>
<!-- 						<p style="color: #FFFFFF;font-size: 12px;">开设账号：<span>200</span></p>
 -->					</div>
				</div>
			</div>
			<div class="row" id="adminManger">
			
				<div class="col-md-3 text-center">
				
					<img src="images/zysp.jpg" style="width: 100%;"/>
					<div class="shenpishow"></div>
					<div style="position: relative;top: -36%;">
					
						<a href="yunResExamine.jsp"><img src="images/zyspico.png" width="18%"/></a>
						<a href="yunResExamine.jsp"><p style="color: #FFFFFF;font-size: 14px;margin: 20px 0 10px 0;">资源审批</p></a>
<!-- 						<p style="color: #FFFFFF;font-size: 12px;">审批总量：<span>104</span></p>
 -->					</div>
				
				</div>
				
				<div class="col-md-3 text-center">
					<img src="images/zzgl.jpg" style="width: 100%;"/>
					<div style="position: relative;top: -32%;">
						<a  href="yunAdminMange.jsp"><img src="images/zhglico.png" width="22%"/></a>
						<a  href="yunAdminMange.jsp"><p style="color: #FFFFFF;font-size: 14px;margin: 20px 0 10px 0;">课题组管理</p></a>
<!-- 						<p style="color: #FFFFFF;font-size: 12px;">组织总数：<span>3025</span></p>
 -->					</div>
				</div>
				<div class="col-md-3 text-center">
					<img src="images/zyjk.jpg" style="width: 100%;"/>
					<div style="position: relative;top: -32%;">
						<a  href="yunResourceMonitor.jsp"><img src="images/zyjkico.png" width="22%"/></a>
						<a  href="yunResourceMonitor.jsp"><p style="color: #FFFFFF;font-size: 14px;margin: 20px 0 10px 0;">资源监控</p></a>
<!-- 						<p style="color: #FFFFFF;font-size: 12px;">故障处理：<span>5</span></p>
 -->					</div>
				</div>
				<div class="col-md-3 text-center">
					<img src="images/xttz.jpg" style="width: 100%;"/>
					<div class="tongzhi"></div>
					<div style="position: relative;top: -38%;">
						<a  href="yunMessageTell.jsp"><img src="images/xttzico.png" width="22%"/></a>
						<a  href="yunMessageTell.jsp"><p style="color: #FFFFFF;font-size: 14px;margin: 20px 0 10px 0;">我的通知</p></a>
<!-- 						<p style="color: #FFFFFF;font-size: 12px;">开设账号：<span>200</span></p>
 -->					</div>
				</div>
			</div>
			<!-- <p style="color: #FFFFFF;font-size: 13px;margin-bottom: 30px;text-align: center;">
    			1996-2018中国科学院计算机网络信息中心 版权所有京ICP备09112257号-94 京公安网备11010802017084号  
    		</p> -->
		</div>
		</div>
		<div style="color: white;font-size: 16px;text-align: center;line-height: 55px ; background-color: #456882;position: fixed;left:0;bottom:0;right:0" >
			1996-2018中国科学院计算机网络信息中心 版权所有京ICP备09112257号-94 京公安网备11010802017084号  
		</div>
		<input type="hidden" id="user_name" value="${userInfo}"/>
		<input style="color:red" type="hidden" id="umtId" value="${umtId}"/>
		<input style="color:red" type="hidden" id="cstnetId" value="${cstnetId}"/>
	</body>
	<script type="text/javascript"> 
			
			
			$(document).ready(function() {
				var userInfo=$("#user_name").val();
				var umtId=$("#umtId").val();
				var cstnetId=$("#cstnetId").val();
				if(userInfo!=""){
					localStorage.setItem("user_name",userInfo);
					localStorage.setItem("umtId",umtId);
					localStorage.setItem("cstnetId",cstnetId);
					var user_name=window.localStorage.getItem("user_name");
					
				}else{
					var user_name=window.localStorage.getItem("user_name");
					var user_id=window.localStorage.getItem("umtId");
					
					umtId=user_id;
					$("#name").html(user_name);
					
				}
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
	                			 if(data[i].valid=="待审核"){
	                				 a=a+1;
	                			 }
	                        	}
	                			$(".shenpishow").html(a)
	                		}else{
	                			$(".shenpishow").html("0")
	                		}
	            	 },
	            	
	            }); 
				$.ajax({ 
	                type: "post",
	                dataType:"json",
	                url: "${pageContext.request.contextPath}/showMessageInfo.do",
	                data:{umtId:umtId,uid:""},
	                success: function(response){
	                		var html="";
	                		var data=response.data;
	                		if(data.length>0){
	                			var a=0;
	                			for(var i=0;i<data.length;i++){
	                			 if(data[i].identify=="0"){
	                				 a=a+1;
	                			 }
	                        	}
	                			$(".tongzhi").html(a)
	                		}else{
	                			$(".tongzhi").html("0")
	                		}
	            	 },
	            	
	            });
					
				initProgramList(umtId)
				initNumber()
				//empId = window.localStorage.getItem("AE_Number");
				
			});
			function initProgramList(umtId){
				
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
			                			$("#orgManger").hide()
			                			$("#adminManger").show()
			                		}else{
			                			$("#orgManger").show()
			                			$("#adminManger").hide()
			                		}   
	                        	}
	                			
	                		}else{
	                			  $("#orgManger").show()
	                			$("#adminManger").hide()  
	                		}
	            	 },
	            	
	            });
			}
			
			function initNumber(){
				
				$.ajax({ 
	                type: "post",
	                dataType:"json",
	                url: "${pageContext.request.contextPath}/selectNumberAllInfo.do",
	                data:{},
	                success: function(response){
	                		var html="";
	                		var data=response.data;
	                		if(data.length>0){
	                			for(var i=0;i<data.length;i++){
	                			 var num_mb =data[i].num_mb
	                			 $("#useyi").html(num_mb.toFixed(2));
	                			 $("#usewei").html((900-num_mb).toFixed(2));
	                			 
	                        	}
	                		}
	            	 },
	            	
	            });
			}
		</script>
</html>
