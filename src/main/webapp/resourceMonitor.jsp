<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>资源监控</title>
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
				font-size: 14px;
				height: 30px;
				padding: 0px;
				margin: 0px;
			}
			#orgTableBody tr td {
				border: 2px solid #939874;
				text-align: center;
				font-size: 14px;
				height: 30px;
				padding: 0px;
				margin: 0px;
			}
			#myTableBody tr td {
				border: 2px solid #939874;
				text-align: center;
				font-size: 10px;
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
		
		<!--TOP-->
		<jsp:include page="common/header.jsp"></jsp:include>
    	<div style="overflow: hidden;">
    		<img src="images/banner6.jpg" style="width: 116%;margin-left: -8%;"/>
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
				    <nav class="tabs-nav"><i id="prev" ripple="ripple" ripple-color="#FFF" class="material-icons">&#xE314;</i><i id="next" ripple="ripple" ripple-color="#FFF" class="material-icons">&#xE315;</i></nav>
				  </div>
				  <div class="tabs-content" style="    min-height: 430px;">
				    <div tab-id="2" class="tab " >
						<div class="row" style="height: 410px;overflow: scroll;">
							<table id="fixHead">
								<thead>
									
									<tr>
										<td style="width: 20%;">课题组名称</td>
										<td style="width: 16.7%;">我的配额(GB)</td>
										<td style="width: 14.6%;">我的使用量(GB)</td>
										<td>用量进度展示</td>
										
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
				
							<table id="fixHead">
								<thead>
									
									<tr>
										<td style=" width: 15.3%;">课题组名称</td>
										<td style=" width: 12.7%">总配额(TB)</td>
										<td style=" width: 12.9%;">使用量(GB)</td>
										<td style=" width: 21.9%;">用户数(个)</td>
										<td>启用时间</td>
										<td>过期时间</td>
										<td>操作</td>
										
									</tr>
								</thead>
							</table>
							<table style="margin-top: 31px;    " id="orgTableBody">
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
				
				initJoinOrgInfoList()
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
			   // initOrgInfoList()
			});
			
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
										     html += '<td style=" width: 15.3%;">' + data[i].name + '</td>';	
										     html += '<td style=" width: 12.7%">' + data[i].quota/1000 + '</td>';
										     if(data[i].usage_gb==""||data[i].usage_gb==null){
										    	 html += '<td style=" width: 12.9%;">暂未使用</td>';
										     }else{
										    	 html += '<td style=" width: 12.9%;">' + (data[i].usage_gb).toFixed(2) + '</td>';
										     }
										     html += '<td style=" width: 21.9%;">' + usernumber + '</td>';
										     html += '<td >' + data[i].dt_start + '</td>';	
										     html += '<td >' + data[i].dt_expired + '</td>';
										     html += '<td style="color:red;" class="selProNum" onclick="dataDetail(this)" uid="' + data[i].uid + '">数据监控</td>';

											 html +='</tr>';
		                				}
		               	             
		                        	}
		                			$("#orgTableBody tbody").html(html);
		                			
		                		}else{
		                			//$("#tableBody tbody").html("<tr><td >尚未创建账号，暂无账号信息</td></tr>");
		                		}
		            	 },
		            	
		            });
				}
			 function dataDetail(e) {
				var uid = $(e).attr("uid");
				window.location.href =encodeURI('accountGraphicStatistics.jsp?uid='+uid);
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
									     html += '<td >' + data[i].name + '</td>';	
									     html += '<td >' + data[i].params + '</td>';	
									    
									     if(data[i].num_mb==""||data[i].num_mb==null){
									    	 html += '<td >0</td>';
										     html += '<td style="    width: 49%;"> <div style="margin-left: 5%;width:400px !important;margin-top: 4px;" class="progress-out" w="0"> <div class="percent-show"><span>50</span>%</div><div class="progress-in"></div></div></td>';


									     }else{
									    	 html += '<td >' + data[i].num_mb + '</td>';

									    	 html += '<td style="    width: 49%;"> <div style="margin-left: 5%;width:400px !important;margin-top: 4px;" class="progress-out" w="'+data[i].quota/data[i].num_mb +'"> <div class="percent-show"><span>50</span>%</div><div class="progress-in"></div></div></td>';

									     }
									    
										 html +='</tr>';
		                        	}
		                			/* $("#myTableBody tbody").html("<tr><td>暂无数据</td></tr>"); */
		                			 $("#myTableBody tbody").html(html); 
		                			var div=$(".progress-out");//进度条要插入的地方
		            				
		        					div.each(function(){
		        						var width=$(this).attr('w');
		        						$(this).myProgress({speed: 4000, percent:width,width: "500px"}); 
		        					})
		                		}else{
		                			$("#tableBody tbody").html("<tr><td >尚未创建账号，暂无账号信息</td></tr>");
		                		}
		            	 },
		            	
		            });
				}
		</script>
	</body>
</html>