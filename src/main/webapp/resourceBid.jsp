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
			.form-control {
			    display: block;
			    width: 100%;
			    height: 34px;
			    padding: 6px 12px;
			    font-size: 14px;
			    line-height: 1.42857143;
			    color: #555;
			    background-color: #fff;
			    background-image: none;
			    border: 1px solid #ccc;
			   
			    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
			    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
			    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
			    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
			    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
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
						<div class="col-md-12"><a href="http://storage.cstcloud.cn/contract/contract.pdf">  <span style="cursor: pointer;color:red;font-size: 15px;"  >*云存储服务合同模板及相应的权利义务下载</span></a></div>
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
						                	<div class="item col-xs-12">
						                        <span class="intelligent-label f-fl"><b class="ftx04">*</b>资源类型：</span>    
						                        <div class="f-fl item-ifo">
						                        	<select class="form-control" data-valid="isNonEmpty" data-error="资源类型"   id="res_name"  style="   "> 
						                           		<option value="1">文件存储</option>
						                            </select>
						                            <label class="icon-sucessfill blank hide"></label>
						                          
						                            <label class="focus valid"></label>
						                        </div>
						                    </div>
						                    <div class="item col-xs-12">
						                        <span class="intelligent-label f-fl"><b class="ftx04">*</b>存储容量：</span>    
						                        <div class="f-fl item-ifo">
						                            <input type="number"  class="txt03" tabindex="1" data-valid="isNonEmpty" data-error="存储容量不能为空" id="params" />                            <span class="ie8 icon-close close hide"></span>
					                           
						                            <label style="margin-left: 10px;" class="focus valid"></label>
						                        </div>
						                        <label >GB</label>
						                    </div>
						                    <div class=" col-xs-12">
						                        <!-- <span class="intelligent-label f-fl"><b class="ftx04">*</b>启用时间：</span>    
						                        <div class="f-fl item-ifo">
												    <input type="text" style="height: 30px;width: 200px;width: 120px;" class="txt03  m-ctrl-medium date-picker datetimepicker" tabindex="1" data-valid="isNonEmpty" data-error="启用时间不能为空"  id="dt_start"type="text" data-date-format="yyyy-mm-dd" data-date-viewmode="days" readonly="readonly" />
													
						                            <label id="startTime" class="focus valid"></label>
						                        </div> -->
						                         <span class="intelligent-label f-fl"><b class="ftx04">*</b>启用时间：</span>    
						                        <div class="f-fl item-ifo">
						                            <div class="form-group" style="    width: 45%;">
										            <div class="input-group date" id='dt_start'>
										                <input type="text" class="form-control" >
										                <span class="input-group-addon">
										                    <i class="glyphicon glyphicon-calendar"></i>
										                </span>
										            </div>
										        </div>
						                    </div>
						                    </div>
						                    <div class=" col-xs-12">
						                        <span class="intelligent-label f-fl"><b class="ftx04">*</b>过期时间：</span>    
						                         <div class="f-fl item-ifo">
						                            <div class="form-group" style="    width: 45%;">
										            <div class="input-group date" id='dt_expired'>
										                <input type="text" class="form-control" >
										                <span class="input-group-addon">
										                    <i class="glyphicon glyphicon-calendar"></i>
										                </span>
										            </div>
										        </div>
						                       <!--  <div class="f-fl item-ifo">
													<input type="text" style="height: 30px;width: 200px;width: 120px;"class="txt03 " tabindex="1" data-valid="isNonEmpty" data-error="过期时间不能为空"id="dt_expired" class="m-ctrl-medium date-picker datetimepicker" type="text" data-date-format="yyyy-mm-dd" data-date-viewmode="days" readonly="readonly" />
						                            <label id="timestart" class="focus valid"></label>
						                        </div>   -->
						                         </div>
						                    </div>
						                    <div class="item col-xs-12">
						                        <span class="intelligent-label f-fl"><b class="ftx04">*</b>申请理由：</span>    
						                        <div class="f-fl item-ifo">
						                            <input type="text" maxlength="20" class="txt03 " tabindex="1" data-valid="isNonEmpty" data-error="申请理由不能为空" id="applyReason" />                            <span class="ie8 icon-close close hide"></span>
						                           
						                            <label class="focus valid"></label>
						                        </div>
						                    </div>
						                    
						                    <div class="item col-xs-12" style="    padding-top: 50px;">
						                        <span class="intelligent-label f-fl">&nbsp;</span>    
						                        <div class="f-fl item-ifo">
						                         <a style="width: 58%;"  href="javascript:;" class="btn btn-blue f-r3" id="btn_part2_back">上一步</a> 
						                                              
						                        </div>
						                        <div class="f-fl item-ifo">
						                           <a style="width: 58%;" href="javascript:;" class="btn btn-blue f-r3" id="btn_part2">下一步</a>     
						                                              
						                        </div>
						                        <div style="clear:both"></div>
						                    </div> 
						                   
						                </div>
						               <div class="part3" style="display:none">
						              
					                	<div style="height: 35px;" class="item col-xs-12">
					                       <span class="intelligent-label f-fl">课题组名称：</span><span id="aorgInfo">1213：</span>    
					                       
					                    </div>
					                    <div style="height: 35px;" class="item col-xs-12">
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
					                    </div>
					                   <div class="item col-xs-12" style="    padding-top: 50px;">
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
						<div style="width: 50%;margin: auto;padding-top: 83px;" class="modal fade" id="update" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top: 100px;">
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
												<input type="text" style="height: 40px;width: 78%;font-size: 18px;" id="description"/>
											</div>
											<div style="margin-top: 10px;">
												<span>依托单位：</span>&nbsp;&nbsp;&nbsp;
												<input type="text" style="height: 40px;width: 78%;font-size: 18px;" id="supportUnit"/>
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
		 $(document).ready(function() {
		    	var user_name=window.localStorage.getItem("user_name");
				$("#name").html(user_name);
				/*  $('.datepicker').datepicker();  */
			    	$('#dt_start').datetimepicker({
			    		 format: 'YYYY-MM-DD',
			    	     locale: moment.locale('zh-cn')
			        })
			      $('#dt_expired').datetimepicker({
			    	     format: 'YYYY-MM-DD',
			    	     locale: moment.locale('zh-cn')
					}); 
					/* var dt_start=$("#dt_start").val();
					if(dt_start!=""&&dt_start!=null){
						
						$("#startTime").hide()
					} */
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
				//第二页的确定按钮
				$("#btn_part2").click(function(){
					var orgInfo=$("#orgInfo").val();
					var res_name=$("#res_name").val();
					var params=$("#params").val();
					var dt_start=$("#dt_start input").val();
					var dt_expired=$("#dt_expired input").val();
					var apply_reason=$("#applyReason").val();
					if(params==""||params==null){
						alert("存储容量不能为空");
						return;
					}
					if(dt_start==""||dt_start==null){
						alert("启用时间不能为空");
						return;
					}
					if(dt_expired==""||dt_expired==null){
						alert("过期时间不能为空");
						return;
					}
					if(apply_reason==""||apply_reason==null){
						alert("不能为空申请理由");
						return;
					}
					 var now = new Date;
					 var d = new Date(dt_start);
					 if(now>d){
						alert("启用时间不能小于当前日期")
						return;
					}
					if(dt_start>dt_expired){
						alert("启用时间不能大于过期时间")
						return;
					}
					$("#aorgInfo").html($("#orgInfo option:selected").text())
					$("#ares_name").html("文件存储")
					$("#aparams").html($("#params").val())
					$("#adata").html($("#dt_start input").val()+"到"+$("#dt_expired input").val());
					$("#aapply_reaapply").html($("#applyReason").val())
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
					/* if(!verifyCheck._click()) return; */
					var orgInfo=$("#orgInfo").val();
					var res_name=$("#res_name").val();
					var params=$("#params").val();
					var dt_start=$("#dt_start input").val();
					var dt_expired=$("#dt_expired input").val();
					var apply_reason=$("#applyReason").val();
					
				    var orgInfoName=$("#orgInfo option:selected").text()
					if(params==""||params==null){
						alert("存储容量不能为空");
						return;
					}
					if(dt_start==""||dt_start==null){
						alert("启用时间不能为空");
						return;
					}
					if(dt_expired==""||dt_expired==null){
						alert("过期时间不能为空");
						return;
					}
					if(apply_reason==""||apply_reason==null){
						alert("不能为空申请理由");
						return;
					}
					
					var mm=$("#dt_expired").val();
					if(!verifyCheck._click()) return;
				    $.ajax({
			        	type: "post",
		                dataType:"json",
		                url: "${pageContext.request.contextPath}/addResource.do",
		                data:{umtId:umtId,orgInfo:orgInfo,res_name:res_name,params:params,dt_start:dt_start,dt_expired:dt_expired,apply_reason:apply_reason,orgInfoName:orgInfoName},
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
					/* $(".part3").hide();
					$(".part4").show();
					$(".step li").eq(2).addClass("on");
					countdown({
						maxTime:10,
						ing:function(c){
							$("#times").text(c);
						},
						after:function(){
							window.location.href="my.html";		
						}
					});		 */
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
   	 	    var description=$("#description").val();
   	 	    var supportUnit=$("#supportUnit").val();
	   	 	if(orgName==""||orgName==null){
		    	alert("课题组名称不能为空");
		    	return;
		    }
	   	 	if(description==""||description==null){
		    	alert("课题组描述不能为空");
		    	return;
		    }
		   	if(supportUnit==""||supportUnit==null){
		    	alert("依托单位不能为空");
		    	return;
		    }
	        $.ajax({
	        	type: "post",
                dataType:"json",
                url: "${pageContext.request.contextPath}/addOrgInfo.do",
                data:{umtId:umtId,orgName:orgName,description:description,supportUnit:supportUnit},
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
	 </script>
	</body>
</html>