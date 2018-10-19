<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>资源申请</title>
		<!--bootstrap-->
		<link rel="stylesheet" href="css/bootstrap.css" />
<!-- 		<link rel="stylesheet" href="css/datepicker.css" />
 -->		
		
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="js/bootstrap.js"></script>
		<!--文字-->
		<link rel="stylesheet" href="css/iconfont.css" />
		<!--top样式-->
		<link rel="stylesheet" href="css/topPublic.css" />
		<!--own-->
		<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css" />
		<!-- <link href="css/bootstrap.min.css" rel="stylesheet"> -->
		<link href="css/gloab.css" rel="stylesheet">
		<link href="css/index.css" rel="stylesheet">
		<script src="js/jquery-1.11.1.min.js"></script>
		<script src="js/register.js"></script>
		<style type="text/css">
		
			.bodystyle {
				filter: alpha(opacity=60);
				-moz-opacity: 0.6;
				-khtml-opacity: 0.6;
				opacity: 0.8;
				height: 100%;
				width: 100%;
				position: absolute;
				background: url(images/bg8.jpg) no-repeat;
				background-size: cover;
				z-index: -1;
			}
			
			.f-pb50 {
			    padding-bottom: 0px;
			    margin-top: 0px; 
			  padding-top: 0px;
			}
			.f-mt10 {
			   margin-top: 0px; 
			}
			.reg-box .item {
			    height: 53px;
			    line-height: 34px;
			    position: relative;
			    z-index: 5;
			}
			.reg-box .intelligent-label {
			    width: 100px;
			    text-align: right;
			    font-size: 14px;
			    color: #666;
			    padding-right: 10px;
			    float: left;
			}
			.reg-box .item .item-ifo {
			    position: relative;
			    width: 270px;
			    float: left;
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
			#tableBodys tr td {
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
			#tableBodys,
			#fixHead {
				width: 846px;
			}
			.part2 ,.part3  {
			    padding-left: 37px !important;
			}
			 ::-webkit-scrollbar {
			            width: 0px;
			        } 
			       /*  .form-control{
			        z-index:100000
			        } */
			        .form-group {
			    margin-bottom: 0px !important;
			}
		</style>
	</head>
	<body lang="zh-CN" class="bgf4">
		<jsp:include page="common/header.jsp"></jsp:include>
    	<div style="overflow: hidden;">
    		<img src="images/banner4.jpg" style="width: 116%;margin-left: -8%;"/>
    	</div>
		<!--END TOP-->
		<div class="container" style="padding-top: 20px;">
			<div class="row" style="padding-bottom: 5%;">
		    	<div class="col-md-12 border" style="margin-top: -6%;background-color: #FFFFFF;">
					<div class="row" style="padding: 0 5%;">
						<div class="col-md-12">
							<div style="border: 1px solid #EDEEED;"></div>
						</div>
					</div>
					<div class="row" style="padding: 2% 5%;">
 						<div class="col-md-12"><a href="http://storage.cstcloud.cn/contract/contract.pdf">   <span style="cursor: pointer;color:red;font-size: 15px;"  >*云存储服务合同模板及相应的权利义务下载</span></a></div>
						
 						 <!--  <div class="col-md-12">
						     <form action="fileUpload" method="post" enctype="multipart/form-data">
						        <p style="float:left"><input type="file" name="fileName"/></p>
						        <p style="float:left"><input type="submit" value="提交"/></p>
						     </form>
 						   </div> -->
 						<div class="col-md-12">
							<div class="login-box f-mt10 f-pb50">
								<div class="main bgf">    
		    						<div class="reg-box-pan display-inline">  
		        						<div class="step">        	
		                					<ul>
						                    <li class="col-xs-4 on" style="width: 24.333333%;">
						                        <span class="num"><em class="f-r5"></em><i>1</i></span>                	
						                        <span class="line_bg lbg-r"></span>
						                        <p class="lbg-txt">填写课题组信息</p>
						                    </li>
						                    <li class="col-xs-4" style="width: 24.333333%;">
						                        <span class="num"><em class="f-r5"></em><i>2</i></span>
						                        <span class="line_bg lbg-l"></span>
						                        <span class="line_bg lbg-r"></span>
						                        <p class="lbg-txt">申请资源</p>
						                    </li>
						                     <li class="col-xs-4" style="width: 24.333333%;">
						                        <span class="num"><em class="f-r5"></em><i>3</i></span>
						                        <span class="line_bg lbg-l"></span>
						                        <span class="line_bg lbg-r"></span>
						                        <p class="lbg-txt">申请清单</p>
						                    </li>
						                    <li class="col-xs-4" style="width: 24.333333%;">
						                        <span class="num"><em class="f-r5"></em><i>4</i></span>
						                        <span class="line_bg lbg-l"></span>
						                        <p class="lbg-txt">申请成功，等待审核</p>
						                    </li>
						                </ul>
						            </div>
						        	<div class="reg-box" id="verifyCheck" style="margin-top:20px;">
						            	<div class="part1">                	
						                    <div class="item col-xs-12">
						                        <span style="    width: 20%;" class="intelligent-label f-fl"><b class="ftx04">*</b>课题组名称：</span>    
						                        <div class="f-fl item-ifo">
						                           <select   id="orgInfo"  style="    width: 60%;height: 37px;background-color: #20b2b7c2;color: white;"> 
											  
											 </select>
											 <span data-toggle="modal" data-target="#update" style=" cursor:pointer;   font-size: 20px;">+</span>  
						                        </div>
						                      
						                    </div>
						                 
						                  
						                    <div class="item col-xs-12" >
						                           
						                        <div class="f-fl item-ifo" style="padding-top: 75px;padding-left: 15%;">
						                           <a  href="javascript:;" class="btn btn-blue f-r3" id="btn_part1">下一步</a>     
						                                              
						                        </div>
						                      
						                    </div> 
						                </div>
						                <div class="part2" style="display:none">
						                	
						                	<div class="row" style="padding: 2% 5%;    min-height: 250px;">
												<div class="col-md-12">
												 <div class="row" style=";height: 170px;overflow: scroll;">
													<table id="fixHead" >
														<thead>
															<tr>
																<td style="width: 13%;">资源类型</td>
																<td style="width: 13%;">存储容量(GB)</td>
																<td style="width: 18%;">启用时间</td>
																<td style="width: 18%;">过期时间</td>
																<td style="width: 34%;">申请理由</td>
																<td>操作</td>
															</tr>
														</thead>
													</table>
													<table style="margin-top: 31px;position: absolute;" id="tableBody">
														<tbody>
															<tr class="owns">
															
																<td style="width: 13%;">
																	<select id="res_name" class="form-control" style=" ">
																		<option value="1">文件存储</option>
																	</select>
																
																</td>
																<td style="width: 13%;">
																	<input type="text" id="params" style="height: 35px;border-radius: 4px;width:100%"/>
																</td>
																<td style="width: 18%;">
																   
											                        <div class="f-fl item-ifo">
											                            <div class="form-group">
															            <div class="input-group date" id='dt_start'>
															                <input type="text" class="form-control " >
															                <span class="input-group-addon times">
															                    <i class="glyphicon glyphicon-calendar "></i>
															                </span>
															            </div>
															        </div>
																</td>
																<td style="width: 18%;">
																	 
											                         <div class="f-fl item-ifo">
											                            <div class="form-group">
																            <div class="input-group date" id='dt_expired'>
																                <input type="text" class="form-control" >
																                <span class="input-group-addon times">
																                    <i class="glyphicon glyphicon-calendar"></i>
																                </span>
																            </div>
															       		</div>
											                         </div>
																</td>
																<td style="width: 34%;">
																	<input type="text" id="applyReason" style="height: 35px;border-radius: 4px;width:100%"/>
																</td>
																<td style="cursor: pointer;" onclick="addInfo(this)">添加</td>
															</tr>
															
														</tbody>
													</table>
												</div>
												</div>
											</div>
						                
						                    
						                    <div class="item col-xs-12" style="    padding-top: 50px;    padding-left: 14%;">
						                        <span class="intelligent-label f-fl">&nbsp;</span>    
						                        <div class="f-fl item-ifo">
						                         <a style="width: 58%;"  href="javascript:;" class="btn btn-blue f-r3" id="btn_part2_back">上一步</a> 
						                                              
						                        </div>
						                        <div class="f-fl item-ifo">
						                           <a style="width: 58%;" href="javascript:;" class="btn btn-blue f-r3" id="btn_part2">下一步</a>     
						                                              
						                        </div>
						                       
						                    </div> 
						                </div>
						               <div class="part3" style="display:none">
						              
					                	<div style="height: 35px;    margin-bottom: 10px;padding-left: 25px;" class="item col-xs-12">
					                       <span class="intelligent-label f-fl">课题组名称：</span><span id="aorgInfo">1213：</span>    
					                       
					                    </div>
					                    
					                    <div class="row" style="padding: 2% 5%;    min-height: 250px;">
												<div class="col-md-12">
												 <div class="row" style=";height: 170px;overflow: scroll;">
													<table id="fixHead" >
														<thead>
															<tr>
																<td style="width: 13%;">资源类型</td>
																<td style="width: 13%;">存储容量(GB)</td>
																<td style="width: 18%;">启用时间</td>
																<td style="width: 18%;">过期时间</td>
																<td style="width: 34%;">申请理由</td>
															</tr>
														</thead>
													</table>
													<table style="margin-top: 31px;position: absolute;" id="tableBodys">
														<tbody>
															
														</tbody>
													</table>
												</div>
												</div>
											</div>
					                    <!-- <div style="height: 35px;" class="item col-xs-12">
					                       	 <span class="intelligent-label f-fl">资源类型：</span><span id="ares_name" >1213：</span>        
					                    </div>
					                     <div style="height: 35px;" class="item col-xs-12">
					                       	 <span class="intelligent-label f-fl">存储容量：</span><span id="aparams">1213：</span>GB        
					                    </div>
					                     <div style="height: 35px;" class="item col-xs-12">
					                       	 <span class="intelligent-label f-fl">使用期限：</span><span  id="adata">1213：</span>        
					                    </div>
					                     <div style="height: 35px;" class="item col-xs-12">
					                       	 <span class="intelligent-label f-fl">申请理由：</span><span id="aapply_reaapply" >1213：</span>        
					                    </div> -->
					                   <div class="item col-xs-12" style="    padding-top: 50px;    margin-left: 10%;">
					                        <span class="intelligent-label f-fl">&nbsp;</span>    
					                        <div class="f-fl item-ifo">
					                           <a style="width: 58%;" href="javascript:;" class="btn btn-blue f-r3" id="btn_part3">确定</a>     
					                                              
					                        </div>
					                        <div class="f-fl item-ifo">
					                         <a style="width: 58%;"  href="javascript:;" class="btn btn-blue f-r3" id="btn_part3_back">上一步</a> 
					                                              
					                        </div>
					                    </div> 
				               		 </div>  
						                <div class="part4 text-center" style="display:none">
						                	<h3>恭喜，您已成功提交申请，我们会为您尽快处理，请耐心等待申请结果！</h3>
						                    <p class="c-666 f-mt30 f-mb50">页面将在 <strong id="times" class="f-size18">10</strong> 秒钟后，跳转到 <a href="index1.jsp" class="c-blue">用户首页</a></p>
				 		                </div>          
						            </div>
						        </div>
						    </div>
						</div>
						<div class="m-sPopBg" style="z-index:998;"></div>
							
						</div>
						<div style="width: 50%;margin: auto;padding-top: 63px;" class="modal fade" id="update" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top: 100px;">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
											&times;
										</button>
										<h4 class="modal-title" id="myModalLabel" style="font-family: '微软雅黑';">
										创建课题组
										</h4>
									</div>
									<div class="modal-body">
										<form>
											
											<div style="margin-top: 10px;">
												<span>课题组名称：</span>
												<input type="text" style="height: 40px;width: 78%;font-size: 18px;" id="orgName"/>
											</div>
											<div style="margin-top: 10px;">
												<span>课题组描述：</span>
												<input type="text" style="height: 40px;width: 78%;font-size: 18px;" id="comments"/>
											</div>
											<div style="margin-top: 10px;">
												<span>依托单位：</span>&nbsp;&nbsp;&nbsp;
												<input type="text" style="height: 40px;width: 78%;font-size: 18px;" id="supportUnit"/>
											</div>
											<div style="margin-top: 10px;">
												<span>联系人：</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="text" style="height: 40px;width: 78%;font-size: 18px;" id="contact_person"/>
											</div>
											<div style="margin-top: 10px;">
												<span>联系电话：</span>&nbsp;&nbsp;&nbsp;
												<input type="text" style="height: 40px;width: 78%;font-size: 18px;" id="contact_phone"/>
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
					</div>
					
		    	</div>
			</div>
		</div>	
		<jsp:include page="common/footer.jsp"></jsp:include>
		<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<script src="js/bootstrap.min.js"></script>
		<script src="js/moment-with-locales.min.js"></script>
		<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet">
		<script src="js/bootstrap-datetimepicker.js"></script>

		<script type="text/javascript">
		var umtId=window.localStorage.getItem("umtId");
		var cstnetId=window.localStorage.getItem("cstnetId");
		 $(document).ready(function() {
		    	var user_name=window.localStorage.getItem("user_name");
		    	
				$("#name").html(user_name);
				/*  $('.datepicker').datepicker();  */
				
				
				$(".times").click(function(){
					$(this).parent().datetimepicker({
			    		 format: 'YYYY-MM-DD',
			    	     locale: moment.locale('zh-cn')
			        })
					
				})
				getOrgInfo(umtId);
				//第一页的确定按钮
				$("#btn_part1").click(function(){						
					
					var orgInfo=$("#orgInfo").val();
					if(orgInfo==""||orgInfo==null){
						alert("课题组名称不能为空，若没有请先创建课题组信息");
						return;
					}
					$(".part1").hide();
					$(".part2").show();
					$(".step li").eq(1).addClass("on");
				});
				var	arr ;
				//第二页的确定按钮
				$("#btn_part2").click(function(){
					var flag=true;
					arr = [];
					var	html='';
					$("#tableBody tr").each(function() {
						var obj = {};
						var res_name=$(this).children().eq(0).find("select option:selected").val();
						var params=$(this).children().eq(1).find("input").val();
						var arrays = [];
						var objs = {};
						objs.params=params
						arrays.push(objs);
						var dt_start=$(this).children().eq(2).find("input").val();
						var dt_expired=$(this).children().eq(3).find("input").val();
						var apply_reason=$(this).children().eq(4).find("input").val();
						if(params==""||params==null){
							flag=false;
							alert("存储容量不能为空");
							return false;
						}
						if(dt_start==""||dt_start==null){
							flag=false;
							alert("启用时间不能为空");
							return false;
						}
						if(dt_expired==""||dt_expired==null){
							flag=false;
							alert("过期时间不能为空");
							return false;
						}
						if(apply_reason==""||apply_reason==null){
							flag=false;
							alert("不能为空申请理由");
							return false;
						}
						 var now = new Date;
						 var d = new Date(dt_start);
						 if(now>d){
							 flag=false;
							alert("启用时间不能小于当前日期")
							return false;
						}
						if(dt_start>dt_expired){
							flag=false;
							alert("启用时间不能大于过期时间")
							return false;
						}
						
						obj.res_name=res_name
						obj.params=JSON.stringify(arrays)
						obj.dt_start=dt_start
						obj.dt_expired=dt_expired
						obj.apply_reason=apply_reason
						arr.push(obj);
						if(res_name=="1"){
							res_name="文件存储";
						}
					 	html += '<tr>';
				     	html += '<td style="width: 13%;">' + res_name + '</td>';	
				     	html += '<td style="width: 13%;">' + params + '</td>';	
				    	html += '<td style="width: 18%;">' + dt_start + '</td>';
				     	html += '<td style="width: 18%;">' + dt_expired + '</td>';	
				     	html += '<td style="width: 34%;">' + apply_reason + '</td>';	
					 	html +='</tr>';
					})
					if(!flag){
						return;
					}
					$("#aorgInfo").html($("#orgInfo option:selected").text())
					$("#tableBodys tbody").html(html);
					$(".step li").eq(2).addClass("on");
					$(".part2").hide();
					$(".part3").show();		
					
				});	
				$("#btn_part2_back").click(function(){
					$(".step li").eq(1).removeClass("on");
					$(".part1").show();
					$(".part2").hide();		
					
				});
				$("#btn_part3_back").click(function(){
					$(".step li").eq(2).removeClass("on");
					$(".part2").show();
					$(".part3").hide();		
					
				});
				//第三页的确定按钮
				$("#btn_part3").click(function(){			
					 var orgInfoName=$("#orgInfo option:selected").text()
					 var allInfo=JSON.stringify(arr);
					 var orgInfo=$("#orgInfo").val();
					 if(!verifyCheck._click()) return;
					 $.ajax({
				        	type: "post",
			                dataType:"json",
			                url: "${pageContext.request.contextPath}/addResource.do",
			                data:{umtId:umtId,orgInfo:orgInfo,orgInfoName:orgInfoName,allInfo:allInfo,cstnetId:cstnetId},
			                success: function(response){           
			                	
								$(".part3").hide();
								$(".part4").show();
								$(".step li").eq(2).addClass("on");
								countdown({
									maxTime:10,
									ing:function(c){
										$("#times").text(c);
									},
									after:function(){
										window.location.href="index1.jsp";		
									}
								});	 
				            }  
				        });   
					
			});	
		 })
		 function showoutc(){$(".m-sPopBg,.m-sPopCon").show();}
		 function closeClause(){
			$(".m-sPopBg,.m-sPopCon").hide();		
		 }
		 function getOrgInfo(umtId){  
	        $.ajax({
	        	type: "post",
                dataType:"json",
                url: "${pageContext.request.contextPath}/getOrgInfo.do",
                data:{umtId:umtId},
                success: function(response){           
	            	var html="";
            		var data=response.data;
            		if(data.length>0){                 
	                    for(var i=0; i<data.length; i++){
	                    	html+="<option value='" + data[i].uid + "'>" + data[i].name + "</option>";
	                    }  
	                    $("#orgInfo").html(html);
			    		//loadColumeDataOne(0);
	                }  
	            }  
	        });  
   		}
   	 	function submit(){ 
   	 	
   	 		
   	 		var orgName=$("#orgName").val();
   	 	    var comments=$("#comments").val();
   	 	    var supportUnit=$("#supportUnit").val();
   	 	    var contact_person=$("#contact_person").val();
   	        var contact_phone=$("#contact_phone").val();
	   	 	if(orgName==""||orgName==null){
		    	alert("课题组名称不能为空");
		    	return;
		    }
	   	 	if(comments==""||comments==null){
		    	alert("课题组描述不能为空");
		    	return;
		    }
		   	if(supportUnit==""||supportUnit==null){
		    	alert("依托单位不能为空");
		    	return;
		    }
		   	if(contact_person==""||contact_person==null){
		    	alert("联系人不能为空");
		    	return;
		    }
		   	if(contact_phone==""||contact_phone==null){
		    	alert("联系电话不能为空");
		    	return;
		    }
	        $.ajax({
	        	type: "post",
                dataType:"json",
                url: "${pageContext.request.contextPath}/addOrgInfo.do",
                data:{umtId:umtId,orgName:orgName,comments:comments,supportUnit:supportUnit,contact_person:contact_person,contact_phone:contact_phone},
                success: function(response){           
                	window.location.reload()
                	//$("#update").modal("hide");
	            }  
	        });   
   		}
   	 	function htFileDowload(){
   	 		
   	 	 
   	 	    var b="云存储服务合同模板及相应的权利义务.pdf";
   	 		var path="C:\\Users\\Administrator\\Desktop\\"+b;
   	 		var url = "http://storage.cstcloud.cn/spbdemo/fileDownload.do?path="+path;
	      
	        var form = $("<form></form>").attr("action", url).attr("method", "post");
	        form.append($("<input></input>").attr("type", "hidden").attr("path", "path").attr("value", path));
	        form.appendTo('body').submit().remove();
   	 	}
   	 	function addInfo(ele){
   	 		if($("#tableBody tr").length>=5){
   	 			alert("每次最多申请5个资源");
   	 			return;
   	 		}
			    var html="";
				html += 	
						'<tr class="owns">'+
							'<td style="width: 13%;">'+
								'<select id="res_name" class="form-control" style=" ">'+
									'<option value="1">文件存储</option>'+
								'</select>'+
							'</td>'+
							'<td style="width: 13%;">'+
								'<input type="text" id="params" style="height: 35px;border-radius: 4px;width:100%"/>'+
							'</td>'+
							'<td style="width: 15%;">'+
		                        '<div class="f-fl item-ifo">'+
		                            '<div class="form-group">'+
						            '<div class="input-group date" id="dt_start">'+
						                '<input type="text" class="form-control " >'+
						                '<span class="input-group-addon times">'+
						                    '<i class="glyphicon glyphicon-calendar "></i>'+
						                '</span>'+
						            '</div>'+
						        '</div>'+
							'</td>'+
							'<td style="width: 15%;">'+
		                         '<div class="f-fl item-ifo">'+
		                            '<div class="form-group">'+
							            '<div class="input-group date" id="dt_expired">'+
							                '<input type="text" class="form-control" >'+
							                '<span class="input-group-addon times">'+
							                    '<i class="glyphicon glyphicon-calendar"></i>'+
							                '</span>'+
							            '</div>'+
						       		'</div>'+
		                         '</div>'+
							'</td>'+
							'<td style="width: 34%;">'+
								'<input type="text" id="applyReason" style="height: 35px;border-radius: 4px;width:100%"/>'+
							'</td>'+
							'<td style="cursor: pointer;" class="del" id="delInfo">删除</td>'+
						'</tr>';
			
				$("#tableBody tbody").append(html);
				$('.times').parent().datetimepicker({
		    		 format: 'YYYY-MM-DD',
		    	     locale: moment.locale('zh-cn')
		        })
			
				}
   	 	$("#tableBody").delegate(".del","click",function(i,e){
			$(this).parent().remove();
		});	
	 </script>
	</body>
</html>