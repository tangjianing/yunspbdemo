<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>账号管理</title>
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
			.selProNum {
				cursor: pointer;
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
    		<img src="images/banner5.jpg" style="width: 116%;margin-left: -8%;"/>
    	</div>
		<!--END TOP-->
		<div class="container">
			<div class="row" style="padding-bottom: 5%;">
				<div class="col-md-12 border" style="margin-top: -6%;background-color: #FFFFFF;">
					<div class="row" style="padding: 2% 5% 1% 5%;">
						<div class="col-md-6">	
							
							<button style="width: 125px;height: 35px;background: #24B81C;border-radius: 5px;color: #FFFFFF;border: none;" data-toggle="modal" data-target="#update">+添加成员</button>
						共计<span style="color:red" id="allnumber"></span>人
						</div>
						<div class="col-md-6 text-right">
														<input id="searchKey" type="text" placeholder="请输入搜索关键词" style="width: 240px;height: 35px;border: 1px solid #E4E4E4;" />
							
						<!-- 	<input type="text" style="width: 240px;height: 35px;border: 1px solid #E4E4E4;" /> -->
							<button onclick="javascript:history.back(-1);" style="width: 102px;height: 35px;border: none;background-color: #ebedf1;color: #2c2c88;    margin-top: 0px;">返回上一页</button>
						</div>
					</div>
					<div class="row" style="padding: 0 5%;">
						<div class="col-md-12">
							<div style="border: 1px solid #EDEEED;"></div>
						</div>
					</div>
					<div class="row" style="padding: 2% 5%;">
						<div class="col-md-12">
							<div class="row" style=";    min-height: 470px;overflow: scroll;    padding-left: 14px;">
								<table id="fixHead">
									<thead>
										<tr>
											<td style="width: 5%;">序号</td>
											<td style="width: 14.7%;">用户名</td>
											<td style="width: 14.7%;">单位</td>
											<td style="width: 12.1%;">配额(GB)</td>
											<td style="width: 20.5%;">ftp账号</td>
											<td style="width: 21%;">科技云通行证(邮箱)</td>
											<td>操作</td>
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
						<div class="modal fade" id="update" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top: 47px;">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
										<h4 class="modal-title" id="myModalLabel" style="font-family: '微软雅黑';">
							新增用户
						</h4>
									</div>
									<div class="modal-body">
										<form>
											<div class="row">
												<div class="col-md-4">
													<div style="height: 44px;">用户名： </div>
													<div style="height: 44px;">单位： </div>
													<div style="height: 46px;">ftp账号： </div>
													<div style="height: 46px;">密码： </div>
													<div style="height: 44px;">配额： </div>
													
													<div style="height: 46px;">科技云通行证： </div>
												</div>
												<div class="col-md-8">
													<div style="padding-bottom: 5px;">
														<input type="text" style="height: 40px;width: 80%;font-size: 18px;" id="account_name" />
													</div>
													<div style="padding-bottom: 5px;">
														<input type="text" style="height: 40px;width: 80%;font-size: 18px;" id="dep_org" />
													</div>
													<div style="padding-bottom: 5px;">
														<input type="text" style="height: 40px;width: 80%;font-size: 18px;" id="account_id" />
													</div>
													<div style="padding-bottom: 5px;">
														<input type="password" style="height: 40px;width: 80%;font-size: 18px;" id="password" />
													</div>
													<div style="padding-bottom: 5px;">
														<input type="number" style="height: 40px;width: 80%;font-size: 18px;" id="params" />GB
													</div>
												
													<div style="padding-bottom: 5px;">
														<input type="text" style="height: 40px;width: 80%;font-size: 18px;" id="email" />
													</div>
												</div>
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
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal -->
						</div>

						<div class="modal fade" id="updates" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top: 47px;">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
										<h4 class="modal-title" id="myModalLabel" style="font-family: '微软雅黑';">
							修改用户
						</h4>
									</div>
									<div class="modal-body">
										<form>
											<div class="row">
												<div class="col-md-4">
													<div style="height: 44px;">用户名： </div>
													<div style="height: 44px;">单位： </div>
													<div style="height: 44px;">配额： </div>
													<div style="height: 46px;">ftp账号： </div>
													<div style="height: 46px;">科技云通行证(邮箱)： </div>
												</div>
												<div class="col-md-8">
													<div style="padding-bottom: 5px;">
														<input type="text" style="height: 40px;width: 80%;font-size: 18px;" id="account_names" />
													</div>
													<div style="padding-bottom: 5px;">
														<input type="text" style="height: 40px;width: 80%;font-size: 18px;" id="dep_orgs" />
													</div>
													<div style="padding-bottom: 5px;">
														<input type="number"disabled="disabled"   style="height: 40px;width: 80%;font-size: 18px;" id="paramss" />GB
													</div>
													<div style="padding-bottom: 5px;">
														<input type="text" disabled="disabled" style="height: 40px;width: 80%;font-size: 18px;" id="account_ids" />
													</div>
													<div style="padding-bottom: 5px;">
														<input type="text"  style="height: 40px;width: 80%;font-size: 18px;" id="emails" />
													</div>
												</div>
											</div>
										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">关闭
										</button>
										<button type="button" class="btn btn-primary" onclick="submitUpdate()">
										确认
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
		
		<jsp:include page="common/footer.jsp"></jsp:include>
		<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
		<script type="text/javascript">
		
		var url = location.search; //获取url中"?"符后的字串
		var orgId;
		var reduid;
		if(url!=""&&url!=null){
			orgId = getUrlParam('orgId');
			orgId=decodeURI(orgId)
			reduid = getUrlParam('reduid');
			reduid=decodeURI(reduid)
			
		}
		var cstnetId=window.localStorage.getItem("cstnetId");
		 $(document).ready(function() {
	    	var user_name=window.localStorage.getItem("user_name");
			$("#name").html(user_name);
			//initProgramList()
			initProgramList(1,limit,$("#searchKey").val());
			$("#searchKey").keydown(function(event){
				if(event.which == 13){
					cpage = 1;
					initProgramList(1,limit,$("#searchKey").val());
				}
			});
			
		 })
		 //当前页数
			var cpage = 1;
			//每页显示条数
			var limit = 10;
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
				
				initProgramList(start,end,$("#searchKey").val())
				//initChCar({start:(cpage-1)*limit+1, end:cpage*limit,jymc:jymc,aflb:aflb,searchKey:$("#searchInput").val()});
			 }  
		 function submit(){ 
   	 		var account_name=$("#account_name").val();
   	 	    var dep_org=$("#dep_org").val();
   	 	    var params=$("#params").val();
   	 	    var password=$("#password").val();
   	 	    var account_id=$("#account_id").val();
   	 	    var email=$("#email").val();
   	 	    if(account_name==""||account_name==null){
   	 	    	alert("用户名不能为空");
   	 	    	return;
   	 	    }
   	 	    if(dep_org==""||dep_org==null){
	 	    	alert("单位不能为空");
	 	    	return;
	 	    }
   	 		if(account_id==""||account_id==null){
	 	    	alert("ftp账号不能为空");
	 	    	return;
	 	    }
	   	 	if(password==""||password==null){
	 	    	alert("密码不能为空");
	 	    	return;
	 	    }
	   		if(params==""||params==null){
		    	alert("配额不能为空");
		    	return;
		    }
	   		if(email==""||email==null){
		    	alert("科技云通行证不能为空");
		    	return;
		    } 
	   	  $.ajax({
	         type: "post",
             dataType:"json",
             url: "${pageContext.request.contextPath}/ExiteAccountInfo.do",
             data:{account_id:account_id},
             success: function(response){           
            	var data=response.data;
         		if(data.length>0){
         			alert("ftp账号已存在，请重新输入")
         		}else{
         			 $.ajax({
         	        	type: "post",
                         dataType:"json",
                         url: "${pageContext.request.contextPath}/addAccountInfo.do",
                         data:{orgId:orgId,account_name:account_name,params:params,reduid:reduid,password:password,account_id:account_id,email:email,dep_org:dep_org},
                         success: function(response){           
                         	window.location.reload()
         	            }  
         	        });  
         		}
	         }  
	        });   
	   		
	        
   		}
		 function submitUpdate(){ 
   	 		
   	 	    var account_ids=$("#account_ids").val();
   	 		var account_names=$("#account_names").val();
   	 		var dep_orgs=$("#dep_orgs").val();
   	 		var paramss=$("#paramss").val();
   			var emails=$("#emails").val();
   	 	
	        $.ajax({
	        	type: "post",
                dataType:"json",
                url: "${pageContext.request.contextPath}/updataAccountInfo.do",
                data:{account_names:account_names,account_ids:account_ids,dep_orgs:dep_orgs,paramss:paramss,emails:emails},
                success: function(response){           
                	window.location.reload()
	            }  
	        });   
   		}
		 
		 
		 function getUrlParam(param){
			if(location.search.indexOf(param) == -1){
				return "";
			}
			var s=location.search.substr(location.search.indexOf(param)+param.length+1);
			if(s.indexOf("&")!=-1){return s.substring(0,s.indexOf("&"));}
			else{return s;}
		}
		 function initProgramList(start,end,searchKey){
			$.ajax({ 
                type: "post",
                dataType:"json",
                url: "${pageContext.request.contextPath}/showOrgAccountList.do",
                data:{reduid:reduid,uid:"",start:start,end:end,searchKey:searchKey},
                success: function(response){
                		var html="";
                		var data=response.data;
                		
                		if(data.length>0){
                			for(var i=0;i<data.length;i++){
               	             html += '<tr>';
               	          html += '<td style="width: 5%;">' + data[i].rn + '</td>';
						     html += '<td style="width: 14.7%;">' + data[i].name + '</td>';
						     if(data[i].dep_org==""||data[i].dep_org==null){
						    	 html += '<td style="width: 14.7%;"></td>';
						     }else{
						    	 html += '<td style="width: 14.7%;">' + data[i].dep_org + '</td>';
						     }
						     html += '<td style="width: 12.1%;">' + data[i].params + '</td>';
						     html += '<td style="width: 20.5%">' + data[i].account_id + '</td>';
						     html += '<td style="width: 21%;">' + data[i].email + '</td>';
						     html += '<td ><span class="selProNum" style="color: #2c2c88;" onclick="fileDetail(this)" uid="' + data[i].uid + '"   data-toggle="modal"  >修改</span>&nbsp;&nbsp;|<span class="selProNum"  style="color: #2c2c88;"  onclick="delAccount(this)" style="margin-left:10px"   uid="' + data[i].uid + '"  account_id="' + data[i].account_id + '">删除</span></td>';	
							 html +='</tr>';
                        	}
                			$("#tableBody tbody").html(html);
                			$("#allnumber").html(response.totalCount)
                			// 分页按钮构造
	            			pageButtonCst(response.totalCount);
                		}
            	 },
            	
            });
		}
		 function fileDetail(e)  {
			 
			var uid=$(e).attr("uid")
			$.ajax({ 
                type: "post",
                dataType:"json",
                url: "${pageContext.request.contextPath}/showOrgAccountList.do",
                data:{reduid:reduid,uid:uid,start:"",end:"",searchKey:""},
                success: function(response){
                		var html="";
                		var data=response.data;
                		if(data.length>0){
                			for(var i=0;i<data.length;i++){
                				$("#account_names").val(data[i].name)
                				$("#dep_orgs").val(data[i].dep_org)
                				$("#paramss").val(data[i].params)
                				$("#account_ids").val(data[i].account_id)
                				$("#emails").val(data[i].email)
                        	}
                			$(e).attr("data-target","#updates")
                		}
            	 },
            	
            });
			
			$(e).attr("data-target","#updates")
		}
		 function delAccount(e)  {
			
			 var msg = "您真的确定要删除吗？\n\n请确认！";
			 if (confirm(msg)==true){
				 var uid=$(e).attr("uid")
				   var account_id=$(e).attr("account_id")
				   $.ajax({
			           type: "post",
		               dataType:"json",
		               url: "${pageContext.request.contextPath}/delAccountInfo.do",
		               data:{orgId:orgId,account_id:account_id,uid:uid},
		               success: function(response){           
		               	alert("账号删除成功")
		               	cpage = 1;
						initProgramList(1,limit,$("#searchKey").val());
			           }  
			        });
			 }else{
			 return false;
			 }
		   
		 }
		</script>
	</body>
</html>