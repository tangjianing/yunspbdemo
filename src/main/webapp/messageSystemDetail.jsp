<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>系统通知详情</title>
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
				font-size: 14px;
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
				<div class="col-md-12 border" style="margin-top: 2%;background-color: #FFFFFF;height: 500px;">
					
					<div class="row" style="padding: 2% 5%;">
						<div class="col-md-12" style="    ">
							<button onclick="javascript:history.back(-1);" style="width: 102px;height: 35px;border: none;background-color: #ebedf1;color: #2c2c88;    margin-top: 0px;">返回上一页</button>
						</div>		
						<div class="col-md-12" style="    ">
							<h4 style="text-align: center;color: black;" id="title">【系统通知】系统升级通知</h4>
						</div>							
						
						<div class="col-md-12" style="font-size:16px;padding-top: 15px;">
							<p>您好：</p>
							<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="nametitle"></span>&nbsp;&nbsp;&nbsp;&nbsp;详情如下</p>
						</div>
						<div class="col-md-12" style="    padding-left: 4.9%;">
			                    
			                    <div class="row" style="padding: 2% 4%;    min-height: 250px;">
										<div class="col-md-12" id="message" style="font-size: 17px;line-height: 30px;">
											
										</div>
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
	                url: "${pageContext.request.contextPath}/showXiTongMessageInfo.do",
	                data:{uid:uid},
	                success: function(response){
	                		var html="";
	                		var data=response.data;
	                		if(data.length>0){
	                			
	                			for(var i=0;i<data.length;i++){
	                				$("#message").html(data[i].message)
	                				
	                				
	                        	}
	                		
	                			
	                		}
	            	 },
	            	
	            });
			}
			
		</script>
	</body>
</html>