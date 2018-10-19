<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>账号统计</title>
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
			
			#tableBody,
			#fixHead {
				width: 1030px;
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
			.page{width:100%;text-align:center; margin:35px 0px;margin: 0 auto; float:left}
			.page a{text-decoration: none;min-width:25px; height:25px;    color: #333333d6; display:inline-block; text-align:center;line-height:28px; margin-right:12px; font-size:16px;}
			.page a:hover{ background:#59ebe8; color:#fff;    border-radius: 50%;}
			.list_document_page_span{color:#98a5b5; font-size:16px;}
			.page a.active {
			    background: #59ebe8;
			    color: #fff;
			    cursor: text;
			        border-radius: 50%;
			}
		</style>
	</head>
	<body lang="zh-CN">
		<jsp:include page="common/header.jsp"></jsp:include>
		<div style="overflow: hidden;">
			<img src="images/544518852714682623.jpg" style="width: 116%;margin-left: -8%;" />
		</div>
		<!--END TOP-->
		<div class="container">
			<div class="row" style="padding-bottom: 5%;">
				<div class="col-md-12 border" style="margin-top: -6%;background-color: #FFFFFF;">
					<div class="row" style="padding: 2% 5% 1% 5%;">
						<div class="col-md-6">
							<span style="    font-size: 17px;">课题组账号信息统计</span>
							共计<span style="color:red" id="allnumber"></span>人
						</div>
						<div class="col-md-6 text-right">
							<input id="searchKey" type="text" placeholder="请输入搜索关键词" style="width: 240px;height: 35px;border: 1px solid #E4E4E4;" />
							<button onclick="exports()" style="width: 102px;height: 35px;border: none;background-color: #ebedf1;color: #2c2c88;    margin-top: -9px;">导出</button>
							<button onclick="javascript:history.back(-1);" style="width: 102px;height: 35px;border: none;background-color: #ebedf1;color: #2c2c88;    margin-top: -9px;">返回上一页</button>
						</div>
					</div>
					<div class="row" style="padding: 0 5%;">
						<div class="col-md-12">
							<div style="border: 1px solid #EDEEED;"></div>
						</div>
					</div>
					<div class="row" style="padding: 2% 5%;">
						<div class="row" style="margin-top: 0%;height: 470px;overflow: scroll;    padding-left: 28px;">
							<table id="fixHead">
								<thead>
									
									<tr>
										<td style="width: 5%;">序号</td>
										<td class="selProNum"  onclick="nameSort()" style="width: 21.4%;">用户账号</td>
										<td style="width: 7.4%;">用户名</td>
										<td style="width: 11%;">所属用户</td>
										<td style="width: 29.6%;">依托单位</td>
										<td style="width: 19%;" class="selProNum" onclick="usedSort()">当前使用量(GB)</td>
										<td class="selProNum"  onclick="fileSort()">文件总数</td>
									</tr>
								</thead>
							</table>
							<table style="margin-top: 31px;" id="tableBody">
								<tbody>

								</tbody>
							</table>
							 <table width="100%" class="" style="    margin-top: 36px;">
								<tr>
									<td colspan="10">
										<div class="page">
											<a href="#">首页</a><a href="#"><</a> <a href="#">1</a>  <a href="#">></a> <a href="#">尾页</a>
										</div>
									</td>
								</tr>
							</table> 
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
				initProgramList(1,limit,$("#searchKey").val(),type,"","");
				/* pageButtonCst(10); */
				//initProgramList("","");
				$("#searchKey").keydown(function(event){
					if(event.which == 13){
						cpage = 1;
						if(type==1&&fileType==1&&nameType==1){
							fileType="";
							nameType="";
						}
						initProgramList(1,limit,$("#searchKey").val(),type,fileType,nameType);
					}
				});
			});
			var url = location.search; //获取url中"?"符后的字串
			var uid;
			if(url!=""&&url!=null){
				uid = getUrlParam('uid');
				uid=decodeURI(uid)
			}
			
			//当前页数
			var cpage = 1;
			//每页显示条数
			var limit = 12;
			//总页数
			var totalPage = 0;
			//分页按钮构造
			var pageButtonCst = function(totalCount){
				totalPage = Math.ceil(totalCount/limit);
				var pageStr = '<a href="javascript:cpage=1;gotoPage();">首页</a><a href="javascript:cpage--;gotoPage();">上一页</a>';
				var buttonStr = '';
				for(var i = cpage-2; i <= cpage+2; i++){
					if(i > 0 && i <= totalPage){
						buttonStr += '<a ';
						if(i == cpage){
							buttonStr += ' class="active" href="javascript:;" ';
						}else{
							buttonStr += ' href="javascript:cpage='+i+';gotoPage();"';
						}
						buttonStr += '>'+i+'</a>';
					}
				}
				pageStr += buttonStr + '<a href="javascript:cpage++;gotoPage();">下一页</a> <a href="javascript:cpage='+totalPage+';gotoPage();">尾页</a>';
				$("div.page").html(pageStr);
			} 
			//分页按钮事件
			var gotoPage = function(){
				if(cpage < 1){
					cpage = 1;
					return;
				}else if(cpage > totalPage){
					cpage = totalPage;
					return;
				}
				var start=(cpage-1)*limit+1;
				var end=cpage*limit; 
				if(type==1&&fileType==1&&nameType==1){
					fileType="";
					nameType="";
				}
				initProgramList(start,end,$("#searchKey").val(),type,fileType,nameType)
				//initChCar({start:(cpage-1)*limit+1, end:cpage*limit,jymc:jymc,aflb:aflb,searchKey:$("#searchInput").val()});
			 }  
			function getUrlParam(param){
				if(location.search.indexOf(param) == -1){
					return "";
				}
				var s=location.search.substr(location.search.indexOf(param)+param.length+1);
				if(s.indexOf("&")!=-1){return s.substring(0,s.indexOf("&"));}
				else{return s;}
			}
			function exports() {
				var searchKey = $("#searchKey").val();
				//alert(${pageContext.request.contextPath}/)
				 var url = '${pageContext.request.contextPath}/' + 'exportUserData.do?uid=' + uid + '&searchKey=' + searchKey;
                 url = encodeURI(encodeURI(url));
				 window.location.href = url
			}
			var type=1
			function usedSort(){
				if(type==""){
					type=1
				}
				fileType="";
				nameType=""
				type=-type;
				cpage = 1;
				initProgramList(1,limit,$("#searchKey").val(),type,fileType,nameType);
			}
			
			var fileType=1
			function fileSort(){
				if(fileType==""){
					fileType=1
				}
				type=""
				nameType=""
				fileType=-fileType;
				cpage = 1;
				initProgramList(1,limit,$("#searchKey").val(),type,fileType,nameType);
			}
			var nameType=1
			function nameSort(){
				if(nameType==""){
					nameType=1
				}
				type=""
				fileType=""
				nameType=-nameType;
				cpage = 1;
				initProgramList(1,limit,$("#searchKey").val(),type,fileType,nameType);
			}
			function initProgramList(start,end,searchKey,type,fileType,nameType){
				
				$.ajax({ 
	                type: "post",
	                dataType:"json",
	                url: "${pageContext.request.contextPath}/showAccountInfo.do",
	                data:{uid:uid,start:start,end:end,searchKey:searchKey,type:type,fileType:fileType,nameType:nameType},
	                success: function(response){
	                		var html="";
	                		var data=response.data;
	                		if(data.length>0){
	                			for(var i=0;i<data.length;i++){
	               	             html += '<tr>';
							     html += '<td class="selProNum" onclick="accountInfoDetail(this)"  account_id="' + data[i].account_id + '" style="width: 5%;">' + data[i].rn + '</td>';

							     html += '<td style="width: 21.4%;">' + data[i].account_id + '</td>';	
							     html += '<td style="width: 7.4%;">' + data[i].truename + '</td>';
							     html += '<td style="width: 11%;">' + data[i].username + '</td>';	
							     if(data[i].dep_org==""||data[i].dep_org==null){
							    	  html += '<td style="width: 29.6%;">暂无</td>';
							     }else{
							    	  html += '<td style="width: 29.6%;">' + data[i].dep_org + '</td>';
							     }
							   
							     var num_mb=data[i].num_mb
							     html += '<td  style="width: 19%;">' + num_mb + '</td>';	
							     var num_files=data[i].num_files
							     
							     html += '<td >' + num_files + '</td>';	
								 html +='</tr>';
	                        	}
	                			$("#tableBody tbody").html(html);
	                			
	                		}else{
	                			$("#tableBody tbody").html("<tr><td >尚未创建账号，暂无账号信息</td></tr>");
	                		}
	                		$("#allnumber").html(response.totalCount)
	                		// 分页按钮构造
	            			pageButtonCst(response.totalCount);
	            	 },
	            	
	            });
			}
			function accountInfoDetail(ele){
				var  account_id=$(ele).attr("account_id")
	    		window.location.href =encodeURI('accountDetail.jsp?account_id='+account_id);
	    	}
			/* function fileDetail(e) {
				var account_id = $(e).attr("account_id");
			    window.location.href =encodeURI('fileDetail.jsp?account_id='+account_id);
			}  */
		</script>
	</body>
</html>