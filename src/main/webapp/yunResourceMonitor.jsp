<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>资源监控</title>
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
		<link rel="stylesheet" href="css/myProgress.css" />
		<link rel='stylesheet prefetch' href='css/reset.css'>
		<link rel="stylesheet" type="text/css" href="css/default.css">
		<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900|Material+Icons'>
		<link rel="stylesheet" type="text/css" href="css/styles.css">
		<style type="text/css">
			body {
				font-family: "微软雅黑";
				background-color: #EBEDF1;
			}
			
			
			.addClass {
				box-shadow: 6px 6px 12px #888;
			}
			.footer-container {
			    display: flex;
			    align-items: center;
			    justify-content: center;
			    flex-direction: column;
			    background-color: #1A152C;
			    height: 80px;
			    margin-top: 483px;
			}
			#fixHead tr td,
			#tableBody tr td {
				border: 2px solid #939874;
				text-align: center;
				font-size: 15px;
				height: 30px;
				padding: 0px;
				margin: 0px;
			}
			#orgTableBody tr td {
				border: 2px solid #939874;
				text-align: center;
				font-size: 15px;
				height: 30px;
				padding: 0px;
				margin: 0px;
			}
			#myTableBody tr td {
				border: 2px solid #939874;
				text-align: center;
				font-size: 15px;
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
			#orgTableBody,
			#myTableBody,
			#fixHead {
				width: 1126px;
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
				font-size: 15px;
				border-radius: 5px;
			}
			
			.bust {
				width: 105px;
				height: 35px;
				background: rgb(255, 195, 59);
				color: #fff;
				font-size: 15px;
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
			.tabs-header {
			    position: relative;
			  
			    overflow: hidden;
			        font-size: 16px;
			}
			 a:hover .btn1{
				background-color:#02acff !important;
				}
			#goyun:hover {
				background-color:#02acff !important;
				}
				
		</style>
	</head>
	<body lang="zh-CN">
		
		<!--TOP-->
		<jsp:include page="common/header.jsp"></jsp:include>
    	<div style="overflow: hidden;">
    		<img src="images/banner6.jpg" style="width: 100%;"/>
    	</div>
		<!--END TOP-->
		<div class="container">
			<div>
				<div class="htmleaf-container" style="position: absolute;margin-top: -4%;background-color: #FFFFFF;    padding-left: 34px; padding-right: 34px;margin-left:-3%">
				<div class="tabs" style="margin-top: 2%;">
				  <div class="tabs-header">
				    <div class="border"></div>
				    <ul>
				      <li  class="active"><a href="#tab-1" tab-id="1" ripple="ripple" ripple-color="#FFF">我管理的课题组</a></li>
				      <li><a href="#tab-2" tab-id="2" ripple="ripple" ripple-color="#FFF">我加入的课题组</a></li>
				      
				    </ul>
				    <nav class="tabs-nav selProNum" id="joinContor" onclick="joinAdmin()" style="display:none">进入控制台</nav>
				  </div>
				  <div class="tabs-content" style="    min-height: 430px;">
				    <div tab-id="2" class="tab " >
						<div class="row" style="height: 410px;overflow: scroll;">
							<table id="fixHead">
								<thead>
									
									<tr>
										<td style="width: 30%;">课题组名称</td>
										<td style=" width: 25%;">启用时间</td>
										<td style=" width: 25%;">过期时间</td>
										<td>操作</td>
										<!-- <td style="width: 16.7%;">我的配额(GB)</td>
										<td style="width: 14.6%;">我的使用量(GB)</td> -->
										<!-- <td>用量进度展示</td> -->
										
									</tr>
								</thead>
							</table>
							<table style="margin-top: 31px;    " id="myTableBody">
								<tbody>
			
								</tbody>
							</table>
							 </div>
				    </div>
				    <div tab-id="1" class="tab active">
				    	<div class="row" style="height: 410px;overflow: scroll;">
				
							<table id="fixHead" class="orgTableBodyHide" >
								<thead>
									<tr>
										<td style=" width: 30%;">课题组名称</td>
										<td style=" width: 10%;">用户数(个)</td>
										<td style=" width: 25%;">启用时间</td>
										<td style=" width: 25%;">过期时间</td>
										<td style=" width: 10%;">操作</td>
										
									</tr>
								</thead>
							</table>
							<table style="margin-top: 31px;   " id="orgTableBody" >
								<tbody>
			
								</tbody>
							</table>
							<div style="display:none" id="orgTableBodyShow">
								<p style="    margin-top: -20px;font-size: 16px;margin-left: 1%;">尊敬的用户，您好</p>
								<br>
								<p style="   font-size: 16px;margin-left: 3%;">您尚未申请资源，可选择以下操作:</p>
								<div class="row" style="padding-left: 3%;padding-top: 40px;font-size: 18px">
									<div class="col-md-4" ><a href="yunResourceBid.jsp"><button class="btn1" style="width: 75%;height: 48px;background-color: #6dbfff;color: white;border: none;border-radius: 4px;">创建课题组，申请资源<img src="images/add.png" style="width: 18px;margin-left: 15px;"/></button></a></div>
									<div class="col-md-4" ><button id="goyun" class="btn1" style="width: 53%;height: 48px;background-color: #6dbfff;color: white;border: none;border-radius: 4px;" onclick="joinUser()">前往云计算平台<img src="images/jump.png" style="width: 18px;margin-left: 15px;"/></button></div>
									<div class="col-md-4"style="    margin-left: -6%;" ><a href="yunIndex.jsp"><button class="btn1" style="width: 48%;height: 48px;background-color: #6dbfff;color: white;border: none;border-radius: 4px;">返回首页<img src="images/home.png" style="width: 18px;margin-left: 15px;"/></button></a></div>	 	
								</div>
							</div>
						</div> 
				    </div>
				    
				   </div>
				</div>
			</div>
			</div>
			
		</div>
		<div style="clear: both;"></div>
		<jsp:include page="common/footer.jsp"></jsp:include>
		<script src='js/stopExecutionOnTimeout.js?t=1'></script>
		<script src='js/jquery.myProgress.js'></script>
		<script type="text/javascript">
			var empId=1;
			var umtId=window.localStorage.getItem("umtId");
			var cstnetId=window.localStorage.getItem("cstnetId");
			
			$(document).ready(function() {
				
				
				var user_name=window.localStorage.getItem("user_name");
				$("#name").html(user_name);
				/* var m=60;
				$("#div1").myProgress({speed: 4000, percent: m,width: "500px"});  */
				
			/* 	initJoinOrgInfoList() */
				initProgramRoleList()
				
				
				
				//empId = window.localStorage.getItem("AE_Number");
				var activePos = $('.tabs-header .active').position();
			    function changePos() {
			        activePos = $('.tabs-header .active').position();
			        $('.border').stop().css({
			            left: activePos.left,
			            width: $('.tabs-header .active').width()
			        });
			    }
			    changePos();
			    var tabHeight = $('.tab.active').height();
			    function animateTabHeight() {
			        tabHeight = $('.tab.active').height();
			        $('.tabs-content').stop().css({ height: tabHeight + 'px' });
			    }
			    animateTabHeight();
			    function changeTab() {
			        var getTabId = $('.tabs-header .active a').attr('tab-id');
			        $('.tab').stop().fadeOut(300, function () {
			            $(this).removeClass('active');
			        }).hide();
			        $('.tab[tab-id=' + getTabId + ']').stop().fadeIn(300, function () {
			            $(this).addClass('active');
			            animateTabHeight();
			        });
			    }
			    $('.tabs-header a').on('click', function (e) {
			        e.preventDefault();
			        var tabId = $(this).attr('tab-id');
			        $('.tabs-header a').stop().parent().removeClass('active');
			        $(this).stop().parent().addClass('active');
			        changePos();
			        tabCurrentItem = tabItems.filter('.active');
			        $('.tab').stop().fadeOut(300, function () {
			            $(this).removeClass('active');
			        }).hide();
			        $('.tab[tab-id="' + tabId + '"]').stop().fadeIn(300, function () {
			            $(this).addClass('active');
			            animateTabHeight();
			        });
			    });
			    var tabItems = $('.tabs-header ul li');
			    var tabCurrentItem = tabItems.filter('.active');
			    $('#next').on('click', function (e) {
			        e.preventDefault();
			        var nextItem = tabCurrentItem.next();
			        tabCurrentItem.removeClass('active');
			        if (nextItem.length) {
			            tabCurrentItem = nextItem.addClass('active');
			        } else {
			            tabCurrentItem = tabItems.first().addClass('active');
			        }
			        changePos();
			        changeTab();
			    });
			    $('#prev').on('click', function (e) {
			        e.preventDefault();
			        var prevItem = tabCurrentItem.prev();
			        tabCurrentItem.removeClass('active');
			        if (prevItem.length) {
			            tabCurrentItem = prevItem.addClass('active');
			        } else {
			            tabCurrentItem = tabItems.last().addClass('active');
			        }
			        changePos();
			        changeTab();
			    });
			    $('[ripple]').on('click', function (e) {
			        var rippleDiv = $('<div class="ripple" />'), rippleOffset = $(this).offset(), rippleY = e.pageY - rippleOffset.top, rippleX = e.pageX - rippleOffset.left, ripple = $('.ripple');
			        rippleDiv.css({
			            top: rippleY - ripple.height() / 2,
			            left: rippleX - ripple.width() / 2,
			            background: $(this).attr('ripple-color')
			        }).appendTo($(this));
			        window.setTimeout(function () {
			            rippleDiv.remove();
			        }, 1500);
			    });
			   
			});
			var flag=true;
			var myMange=true;
			var myMjoin=true;
			function initProgramRoleList(){
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
	                				 umtId="";
	                				 $("#joinContor").show()
	                				 $("#orgTableBodyShow").hide()
	                				 flag=false;
	                				 
	                			 }
	                			 initOrgInfoList()
	                        	}
	                			
	                		}else{
	                			 initOrgInfoList()
	                			 
	                		}
	            	 },
	            	
	            });
			}
			 function initOrgInfoList(){
					$.ajax({ 
		                type: "post",
		                dataType:"json",
		                url: "${pageContext.request.contextPath}/mangeOrgInfo.do",
		                data:{umtId:umtId},
		                success: function(response){
		                		var html="";
		                		var data=response.data;
		                		if(data.length>0){
		                			for(var i=0;i<data.length;i++){
		                				if(data[i].res_name=="其他"){
		                					html += '<tr>';
										     html += '<td >' + data[i].name + '</td>';	
										     html += '<td colspan="5">暂未申请资源</td>';	
										    
											 html +='</tr>';
		                				}else{
		                					
		                					var acccount=data[i].acccount;
		                					if (acccount==null||acccount==""){
		                						acccount="暂未分配"
		                					}
		                					var usernumber=data[i].usernumber;
		                					if(usernumber==""||usernumber==null){
		                						usernumber=0;
		                					}
		                					
		                					html += '<tr>';
										     html += '<td style=" width: 30%;">' + data[i].name + '</td>';	
										    
										     html += '<td style=" width: 10%;">' + usernumber + '</td>';
										     html += '<td style=" width: 25%;">' + data[i].dt_start + '</td>';	
										     html += '<td style=" width: 25%;">' + data[i].dt_expired + '</td>';
										     html += '<td style="width: 10%;color:red;" class="selProNum" onclick="dataDetail(this)" orgId="' + data[i].orgId + '" uid="' + data[i].uid + '">点击进入</td>';

											 html +='</tr>';
		                				}
		               	             
		                        	}
		                		 	$("#orgTableBody tbody").html(html); 
		                			
		                		}else{
			                		$("#orgTableBody tbody").html("<tr><td >暂无信息</td></tr>");
			                		myMange=false;
		                			//$("#tableBody tbody").html("<tr><td >尚未创建账号，暂无账号信息</td></tr>");
		                		}
		                		initJoinOrgInfoList()
		            	 },
		            	
		            });
				}
			 function dataDetail(e) {
				var orgId = $(e).attr("orgId");
				$.ajax({ 
	                type: "post",
	                dataType:"json",
	                url: "${pageContext.request.contextPath}/joinOrgMange.do",
	                data:{orgId:orgId},
	                success: function(response){
	                	var url=response.url;
	                	window.open(url,"_blank");
	            	},
	            }); 
	            //window.location.href ="http://storage.cstcloud.cn/spbdemo/joinOrgMange.do?orgId="+orgId;
			/* 	window.location.href =encodeURI('accountGraphicStatistics.jsp?uid='+uid); */
			 }
			 function joinAdmin() {
				$.ajax({ 
	                type: "post",
	                dataType:"json",
	                url: "${pageContext.request.contextPath}/joinOrgMange.do",
	                data:{orgId:""},
	                success: function(response){
	                	var url=response.url;
	                	window.open(url,"_blank");
	            	},
	            }); 
		            //window.location.href ="http://storage.cstcloud.cn/spbdemo/joinOrgMange.do?orgId="+orgId;
				/* 	window.location.href =encodeURI('accountGraphicStatistics.jsp?uid='+uid); */
			 }
			 function joinUser() {
					$.ajax({ 
		                type: "post",
		                dataType:"json",
		                url: "${pageContext.request.contextPath}/joinOrgMange.do",
		                data:{orgId:"joinuser"},
		                success: function(response){
		                	var url=response.url;
		                	window.open(url,"_blank");
		            	},
		            }); 
			            //window.location.href ="http://storage.cstcloud.cn/spbdemo/joinOrgMange.do?orgId="+orgId;
					/* 	window.location.href =encodeURI('accountGraphicStatistics.jsp?uid='+uid); */
				 }
			 
			 function myJoinDetail(e) {
				var account_id = $(e).attr("account_id");
				var name = $(e).attr("name");
				$.ajax({ 
	                type: "post",
	                dataType:"json",
	                url: "${pageContext.request.contextPath}/myJoinOrgMange.do",
	                data:{account_id:account_id,name:name},
	                success: function(response){
	                	var url=response.url;
	                	window.open(url,"_blank");
	            	},
	            }); 
	           
			 }
			 function initJoinOrgInfoList(){
					$.ajax({ 
		                type: "post",
		                dataType:"json",
		                url: "${pageContext.request.contextPath}/myjoinOrgInfo.do",
		                data:{uid:cstnetId},
		                success: function(response){
		                		var html="";
		                		var data=response.data;
		                		if(data.length>0){
		                			
		                			for(var i=0;i<data.length;i++){
	                					 html += '<tr>';
									     html += '<td style=" width: 30%;">' + data[i].name + '</td>';	
									    /*  html += '<td >' + data[i].params + '</td>';	
									    if(data[i].num_mb==""||data[i].num_mb==null){
									    	 html += '<td >0</td>';
 										     html += '<td style="    width: 49%;"> <div style="margin-left: 5%;width:400px !important;margin-top: 4px;" class="progress-out" w="0"> <div class="percent-show"><span>50</span>%</div><div class="progress-in"></div></div></td>';
									     }else{
									    	 html += '<td >' + data[i].num_mb + '</td>';
 									    	 html += '<td style="    width: 49%;"> <div style="margin-left: 5%;width:400px !important;margin-top: 4px;" class="progress-out" w="'+data[i].quota/data[i].num_mb +'"> <div class="percent-show"><span>50</span>%</div><div class="progress-in"></div></div></td>';
									     }  */
									     html += '<td style=" width: 25%;">' + data[i].dt_start + '</td>';	
									     html += '<td style=" width: 25%;">' + data[i].dt_expired + '</td>';
									     html += '<td style="color:red;" class="selProNum" onclick="myJoinDetail(this)" account_id="' + data[i].account_id + '" name="' + data[i].name + '">点击进入</td>';

										 html +='</tr>';
		                        	}
		                			/* $("#myTableBody tbody").html("<tr><td>暂无数据</td></tr>"); */
		                			 $("#myTableBody tbody").html(html); 
		                			/* var div=$(".progress-out");//进度条要插入的地方
		            				
		        					div.each(function(){
		        						var width=$(this).attr('w');
		        						$(this).myProgress({speed: 4000, percent:width,width: "500px"}); 
		        					}) */
		                		}else{
		                			$("#myTableBody tbody").html("<tr><td >暂无信息</td></tr>");
		                			myMjoin=false;
		                			/* $(".orgTableBodyHide").hide() */
		                			if(flag){
		                				if((!myMjoin)&&(!myMange)){
		                					$("#orgTableBodyShow").show()
			                				$(".orgTableBodyHide").hide()
			                				$("#orgTableBody tbody").hide()
		                				}
		                				
		                			}
		                		}
		            	 },
		            	
		            });
				}
		</script>
	</body>
</html>