<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>系统帮助</title>
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
			p{ text-indent:2em;
			   line-height: 30px;
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
				<div class="col-md-12 border" style="margin-top: 2%;background-color: #FFFFFF;">
					
					<div class="row" style="padding: 2% 5%;">
							
						<div class="col-md-12" style="    ">
							<h3 style="text-align: center;color: black;" id="title">
								中国科技云-云计算服务平台帮助文档
							</h3>
						</div>							
						
						<div class="col-md-12" style="font-size:16px;padding-top: 15px;">
							<p>
								中国科技云云存储服务平台整合优化分布式云存储基础设施，面向中国科技界提供专有云存储服务，更加契合广大科技工作者和科研团队的海量科学数据存储与备份需求，提供高效、安全、稳定的高性能数据存储服务，具备PB级的数据存储能力，提供按需分配的云存储服务，满足多学科间的海量科研数据交叉与协作，有效支撑科研工作，为科研活动提供全方位的数据在线存储与灾备服务。
							</p>
							<p>
								用户云存储资源是根据课题组形式提供服务，课题组管理员创建课题组申请资源并通过审批后，即可添加课题组成员并分配相应存储空间，具体使用介绍如下。
							</p>
							<p>
								1、登录
							</p>
							<p>
								云存储服务平台登录目前支持两种路径，用户需使用科技云通行证进行登录访问。
							</p>
							<p>
								(1)中国科技云入口，http://www.cstcloud.cn/   "进入">"文件存储"
							</p>
							
							<p>
								(2)云存储服务平台入口，http://storage.cstcloud.cn/
							</p>
							<p>
								2、功能介绍
							</p>
							<p>
								(1)资源申请
							</p>
							<p>
								用户通过该功能创建课题组并申请在线存储资源。
								待平台管理员审核通过后，即成功创建课题组，且该课题组申请人成为该课题组管理员，可以通过“成员管理”、“资源
								监控”功能对课题组进行管理。
								目前平台采用线上申请，线下审批、签署协议的资源申请流程。
							</p>
							<p>
								(2)成员管理							
							</p>
							<p>
								课题组管理员可通过该功能添加课题组成员并分配相应存储空间，并对其进行管理。
							</p>
							<p>
                                (3)数据监控
							</p>
							<p>
								课题组管理员可通过“我管理的课题组”监控课题组存储空间使用量及课题组成员使用情况相关信息。普通课题组成员仅可通过“我加入的课题组”查看自己资源的使用信息情况
							</p>
							<p>
								(4)我的通知
							</p>
							<p>
								用于查阅资源审批状态通知、系统通知等相关信息。
							</p>
							<p>
								3、数据传输方式
							</p>
							<p>
								目前云存储平台支持FTP文件传输协议。用户可以通过功能首页的“工具下载”下载FileZilla工具或通过http的方式进行上传下载。FTP地址：159.226.245.253
							</p>
							<p>
								4、资费问题
							</p>
							<p>
								有关中国科技云云存储服务平台资费问题，需要根据用户具体情况进行核算，请联系客户经理：010-58812544 support@cnic.cn
							</p>
						</div>
						<div class="col-md-12" style="    padding-left: 4.9%;">
						</div> 
					</div>

				</div>
			</div>
		</div>
		<jsp:include page="common/footer.jsp"></jsp:include>
		<script type="text/javascript">
		var umtId=window.localStorage.getItem("umtId");
		
		$(document).ready(function() {
	    	var user_name=window.localStorage.getItem("user_name");
			$("#name").html(user_name);
			
		});
		</script>
	</body>
</html>