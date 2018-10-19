<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>资源申请</title>
		<link rel="icon" href="images/yunji.ico" type="image/x-icon" />
		<link rel="shortcut icon" href="images/yunji.ico" type="image/x-icon" />
		<link rel="bookmark" href="images/yunji.ico" type="image/x-icon" />
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
		<link rel="stylesheet" type="text/css" href="css/jquery.my-modal.1.1.winStyle.css" />
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
			.step .lbg-txt {
			    position: relative;
			    color: #b6c6ce;
			    font-size: 16px;
			}
			.yiwen{
				border: 1px solid black;
			    width: 22px;
			    height: 22px;
			    text-align: center;
			    border-radius: 50%;
			    line-height: 20px;
			    margin-top: 6px;
			        cursor: pointer;			
			}
			#tableBody tr td {
				
				text-align: center;
				font-size: 14px;
				height: 30px;
				padding: 0px;
				margin: 0px;
			}
			#tableBodys tr td {
				
				text-align: center;
				font-size: 14px;
				height: 30px;
				padding: 0px;
				margin: 0px;
			}
		</style>
	</head>
	<body lang="zh-CN" class="bgf4">
		<jsp:include page="common/header.jsp"></jsp:include>
    	<div style="overflow: hidden;">
    		<img src="images/banner4.jpg" style="width: 100%"/>
    		
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
 						<div class="col-md-12"> <a href="http://storage.cstcloud.cn/contract/contract.pdf"> <span style="cursor: pointer;color:red;font-size: 15px;"  >*云计算服务合同模板及相应的权利义务下载</span></a> </div>
						
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
						                	
						                	<div class="row" style="padding: 2% 2%;    min-height: 250px;font-size: 15px;">
												<div class="col-md-12">
												 	<div class="col-md-2" style="font-size: 16px;font-weight: 600;width: 113px;"><span>--</span> 基本信息</div>
												 	<div class="col-md-10" ><hr style=" height: 1px;background-color: #c8c6c6;    margin-top: 10px;"/></div>
												 	
												</div>
												<div class="col-md-12" style="    line-height: 28px;padding-top: 15px;">
												 	<div class="col-md-2" style="width: 15%;" >启用时间</div>
												 	<div class="col-md-4" >
												 		<div class="f-fl item-ifo">
									                        <div class="form-group" style="    width: 55%;">
													            <div class="input-group date" id='dt_start'>
													                <input type="text" class="form-control" >
													                <span class="input-group-addon">
													                    <i class="glyphicon glyphicon-calendar"></i>
													                </span>
													            </div>
													        </div>
									                    </div>
												 	
												 	</div>
												 	
												 	<div class="col-md-2" style="width: 16%;" >过期时间</div>
												 	<div class="col-md-4" >
												 		<div class="f-fl item-ifo">
								                            <div class="form-group" style="    width: 55%;">
													            <div class="input-group date" id='dt_expired'>
													                <input type="text" class="form-control" >
													                <span class="input-group-addon">
													                    <i class="glyphicon glyphicon-calendar"></i>
													                </span>
													            </div>
												        	</div>
								                         </div>
												 	</div>
												 	
												</div>
												<div class="col-md-12" style="    line-height: 28px;padding-top: 20px;">
												 	<div class="col-md-2" style="width: 15%;" >申请理由</div>
												 	<div class="col-md-8" ><input style="width: 100%;" type="text"  id="applyReason"></div>
												 	
												 	
												</div>
												
												<div class="col-md-12" style="padding-top: 25px;">
												 	<div class="col-md-2" style="font-size: 16px;font-weight: 600;width: 113px;"><span>--</span> 计算配额</div>
												 	<div class="col-md-10" ><hr style=" height: 1px;background-color: #c8c6c6;    margin-top: 10px;"/></div>
												 	
												</div>
												<div class="col-md-12" style="    line-height: 28px;padding-top: 15px;">
												 	<div class="col-md-2" style="width: 15%;" >CPU数量(核)</div>
												 	<div class="col-md-2" ><input style="width: 100%;" type="number"  min = 0 value="0" id="cores"></div>
												 	<div class="col-md-1" style="    width: 6%;"><div class="yiwen" title="有效范围为[0,999999894]">?</div></div>
												 	<!-- <div class="col-md-1" style="width: 3%;" ><input type="checkbox" onclick="checkboxOnclick(this)" typeName="cores" cores="999999894" style="width: 22px;height: 22px;" ></div>
												 	<div class="col-md-1" ><span>最大值</span></div> -->
												 	<div class="col-md-2" style="width: 16%;" >云主机数量(个)</div>
												 	<div class="col-md-2" ><input style="width: 100%;" type="number"  min = 0 value="0" id="instances"></div>
												 	<div class="col-md-1" style="    width: 6%;"><div class="yiwen" title="有效范围为[0,999999897]">?</div></div>
												 	<!-- <div class="col-md-1" style="width: 3%;" ><input type="checkbox" onclick="checkboxOnclick(this)" typeName="instances" instances="999999897" style="width: 22px;height: 22px;" ></div>
												 	<div class="col-md-1" ><span>最大值</span></div> -->
												</div>
												<div class="col-md-12" style="    line-height: 28px;padding-top: 20px;">
												 	<div class="col-md-2" style="width: 15%;" >内存容量(GB)</div>
												 	<div class="col-md-2" ><input style="width: 100%;" type="number"  min = 0 value="0" id="ram"></div>
												 	<div class="col-md-1" style="    width: 6%;"><div class="yiwen" title="有效范围为[0,999884]">?</div></div>
												 	<!-- <div class="col-md-1" style="width: 3%;" ><input type="checkbox" onclick="checkboxOnclick(this)" typeName="ram" ram="999884"  style="width: 22px;height: 22px;" ></div>
												 	<div class="col-md-1" ><span>最大值</span></div> -->
												 	
												</div>
												<div class="col-md-12" style="padding-top: 25px;">
												 	<div class="col-md-2" style="font-size: 16px;font-weight: 600;width: 113px;"><span>--</span> 存储配额</div>
												 	<div class="col-md-10" ><hr style=" height: 1px;background-color: #c8c6c6;    margin-top: 10px;"/></div>
												 	
												</div>
												<div class="col-md-12" style="    line-height: 28px;padding-top: 15px;">
												 	<div class="col-md-2" style="width: 15%;" >存储总容量(GB)</div>
												 	<div class="col-md-2" ><input style="width: 100%;" type="number"  min = 0 value="0" id="gigabytes"></div>
												 	<div class="col-md-1" style="    width: 6%;"><div class="yiwen" title="有效范围为[0,999999900]">?</div></div>
												 	<!-- <div class="col-md-1" style="width: 3%;" ><input type="checkbox" onclick="checkboxOnclick(this)" typeName="gigabytes" gigabytes="999999900" style="width: 22px;height: 22px;"></div>
												 	<div class="col-md-1" ><span>最大值</span></div> -->
												 	<div class="col-md-2" style="width: 16%;" >快照数量(个)</div>
												 	<div class="col-md-2" ><input style="width: 100%;" type="number"  min = 0 value="0" id="snapshorts"></div>
												 	<div class="col-md-1" style="    width: 6%;"><div class="yiwen"title="有效范围为[0,999999900]">?</div></div>
												 	<!-- <div class="col-md-1" style="width: 3%;" ><input type="checkbox" onclick="checkboxOnclick(this)" typeName="snapshorts" snapshorts="999999900" style="width: 22px;height: 22px;"></div>
												 	<div class="col-md-1" ><span>最大值</span></div> -->
												</div>
												<div class="col-md-12" style="    line-height: 28px;padding-top: 20px;">
												 	<div class="col-md-2" style="width: 15%;" >云硬盘数量(个)</div>
												 	<div class="col-md-2" ><input style="width: 100%;" type="number"  min = 0 value="0" id="volumes"></div>
												 	<div class="col-md-1" style="    width: 6%;"><div class="yiwen" title="有效范围为[0,999999900]">?</div></div>
												 	<!-- <div class="col-md-1" style="width: 3%;" ><input type="checkbox" onclick="checkboxOnclick(this)" typeName="volumes" volumes="999999900" style="width: 22px;height: 22px;"></div>
												 	<div class="col-md-1" ><span>最大值</span></div> -->
												 	
												</div>
												 <div class="col-md-12" style="padding-top: 25px;">
												 	<div class="col-md-2" style="font-size: 16px;font-weight: 600;width: 113px;"><span>--</span> 网络配额</div>
												 	<div class="col-md-10" ><hr style=" height: 1px;background-color: #c8c6c6;    margin-top: 10px;" /></div>
												 	
												</div>
												<div class="col-md-12" style="    line-height: 28px;padding-top: 15px;">
												 	<div class="col-md-2" style="width: 15%;" >路由器数量(个)</div>
												 	<div class="col-md-2" ><input style="width: 100%;" type="number"  min = 0 value="0" id="router"></div>
												 	<div class="col-md-1" style="    width: 6%;"><div class="yiwen" title="有效范围为[0,999999899]">?</div></div>
												 	<!-- <div class="col-md-1" style="width: 3%;" ><input type="checkbox" onclick="checkboxOnclick(this)" typeName="router" router="999999899" style="width: 22px;height: 22px;"></div>
												 	<div class="col-md-1" ><span>最大值</span></div> -->
												 	<div class="col-md-2" style="width: 16%;" >防火墙数量(个)</div>
												 	<div class="col-md-2" ><input style="width: 100%;" type="number"  min = 0 value="0" id="firewall"></div>
												 	<div class="col-md-1" style="    width: 6%;"><div class="yiwen" title="有效范围为[0,1000000000]">?</div></div>
												 	<!-- <div class="col-md-1" style="width: 3%;" ><input type="checkbox" onclick="checkboxOnclick(this)" typeName="firewall" firewall="1000000000" style="width: 22px;height: 22px;"></div>
												 	<div class="col-md-1" ><span>最大值</span></div> -->
												</div>
												<div class="col-md-12" style="    line-height: 28px;padding-top: 15px;">
												 	<div class="col-md-2" style="width: 15%;" >网络数量(个)</div>
												 	<div class="col-md-2" ><input style="width: 100%;" type="number"  min = 0 value="0" id="network"></div>
												 	<div class="col-md-1" style="    width: 6%;"><div class="yiwen" title="有效范围为[0,999999896]">?</div></div>
												 	<!-- <div class="col-md-1" style="width: 3%;" ><input type="checkbox" onclick="checkboxOnclick(this)" typeName="network" network="999999896" style="width: 22px;height: 22px;"></div>
												 	<div class="col-md-1" ><span>最大值</span></div> -->
												 	<div class="col-md-2" style="width: 16%;" >负载均衡数量(个)</div>
												 	<div class="col-md-2" ><input style="width: 100%;" type="number"  min = 0 value="0" id="loadbalancer"></div>
												 	<div class="col-md-1" style="    width: 6%;"><div class="yiwen" title="有效范围为[0,1000000000]">?</div></div>
												 	<!-- <div class="col-md-1" style="width: 3%;" ><input type="checkbox" onclick="checkboxOnclick(this)" typeName="loadbalancer" loadbalancer="1000000000" style="width: 22px;height: 22px;"></div>
												 	<div class="col-md-1" ><span>最大值</span></div> -->
												</div>
												<div class="col-md-12" style="    line-height: 28px;padding-top: 20px;">
												 	<div class="col-md-2" style="width: 15%;" >网卡数量(个)</div>
												 	<div class="col-md-2" ><input style="width: 100%;" type="number"  min = 0 value="0"id="vnic" ></div>
												 	<div class="col-md-1" style="    width: 6%;"><div class="yiwen" title="有效范围为[0,999999898]">?</div></div>
												 	<!-- <div class="col-md-1" style="width: 3%;" ><input type="checkbox" onclick="checkboxOnclick(this)" typeName="vnic" vnic="999999898" style="width: 22px;height: 22px;"></div>
												 	<div class="col-md-1" ><span>最大值</span></div> -->
												 	
												</div>
												<div class="col-md-12" style="    line-height: 28px;padding-top: 20px;">
												 	<div class="col-md-2" style="width: 15%;" >公网IP数量(个)</div>
												 	<div class="col-md-2" ><input style="width: 100%;" type="number"  min = 0 value="0"id="floatingip"></div>
												 	<div class="col-md-1" style="    width: 6%;"><div class="yiwen" title="有效范围为[0,1000000000]">?</div></div>
												 	<!-- <div class="col-md-1" style="width: 3%;" ><input type="checkbox" onclick="checkboxOnclick(this)" typeName="floatingip" floatingip="1000000000" style="width: 22px;height: 22px;"></div>
												 	<div class="col-md-1" ><span>最大值</span></div> -->
												 	
												</div>
												<div class="col-md-12" style="    line-height: 28px;padding-top: 30px;">
												 	<div class="col-md-2" style="" >网段IP</div>
												 	<div class="col-md-6" >
													 	
													 		
													 		<div class="row"  style="border: 1px solid #c8c6c6;height: 100px;overflow: scroll; padding-left: 14px;">
													
																<table style="" id="tableBody">
																	<!-- <tr>
																		<td ><input type="checkbox"></td>
																		<td >192.168.1;192.168.1-192.168.1</td>
																	</tr> -->
																</table>
															</div>
													 		
													 	
												 	</div>
												 	<div class="col-md-4" >
												 		<div class="col-md-12" ><button class="btn1" style="width: 40%;height: 40px;">增加</button></div>
												 		<div class="col-md-12" ><button onclick="dl()" style="margin-top: 20px;width: 40%;height: 40px;">删除</button></div>
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
						              
					                	<!-- <div style="height: 35px;    margin-bottom: 10px;padding-left: 25px;" class="item col-xs-12">
					                       <span class="intelligent-label f-fl">课题组名称：</span><span id="aorgInfo">1213：</span>    
					                       
					                    </div> -->
					                    
					                   <!--  <div class="row" style="padding: 2% 5%;    min-height: 250px;">
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
											</div> -->
					                   		
					                   		<div class="row" style="padding: 2% 2%;    min-height: 250px;font-size: 15px;">
												<div class="col-md-12">
												 	<div class="col-md-2" style="font-size: 16px;font-weight: 600;width: 113px;"><span>--</span>基本信息</div>
												 	<div class="col-md-10" ><hr style=" height: 1px;background-color: #c8c6c6;    margin-top: 10px;"/></div>
												 	
												</div>
												<div class="col-md-12" style="    line-height: 28px;padding-top: 10px;    padding-left: 30px;">
												 	<div class="col-md-2" style="width: 16%;" >课题组名称：</div>
												 	<div class="col-md-10" id="aorgInfo"></div>
												 	
												</div>
												<div class="col-md-12" style="    line-height: 28px;padding-top: 10px;    padding-left: 30px;">
												 	<div class="col-md-2" style="width: 16%;" >课题组描述：</div>
												 	<div class="col-md-10" id="comments"></div>
												 	
												</div>
												<div class="col-md-12" style="    line-height: 28px;padding-top: 10px;    padding-left: 30px;">
												 	<div class="col-md-2" style="width: 16%;" >启用日期：</div>
												 	<div class="col-md-2" id="dt_starts"></div>
												 	<div class="col-md-2" style="width: 16%;">结束日期：</div>
												 	<div class="col-md-2" id="dt_expireds" >0</div>
												 	
												</div>
												<div class="col-md-12" style="    line-height: 28px;padding-top: 10px;    padding-left: 30px;">
												 	<div class="col-md-2" style="width: 16%;" >申请理由：</div>
												 	<div class="col-md-10" id="applyreasons"></div>
												</div>
												<div class="col-md-12" style="padding-top: 25px;"> 
												 	<div class="col-md-2" style="font-size: 16px;font-weight: 600;width: 113px;"><span>--</span> 计算配额</div>
												 	<div class="col-md-10" ><hr style=" height: 1px;background-color: #c8c6c6;    margin-top: 10px;"/></div>
												 	
												</div>
												<div class="col-md-12" style="    line-height: 28px;padding-top: 10px;    padding-left: 30px;">
												 	<div class="col-md-2" style="width: 16%;" >CPU数量(核)：</div>
												 	<div class="col-md-2" id="coress"></div>
												 	<div class="col-md-2" style="width: 16%;">云主机数量(个)：</div>
												 	<div class="col-md-2" id="instancess" >0</div>
												 	<div class="col-md-2" style="width: 16%;"  >内存容量(GB)：</div>
												 	<div class="col-md-2" id="rams">0</div>
												</div>
												<div class="col-md-12" style="padding-top: 25px;">
												 	<div class="col-md-2" style="font-size: 16px;font-weight: 600;width: 113px;"><span>--</span> 存储配额</div>
												 	<div class="col-md-10" ><hr style=" height: 1px;background-color: #c8c6c6;    margin-top: 10px;"/></div>
												 	
												</div>
												<div class="col-md-12" style="    line-height: 28px;padding-top: 10px;    padding-left: 30px;">
												 	<div class="col-md-2" style="width: 16%;" >存储总容量(GB)</div>
												 	<div class="col-md-2" id="gigabytess">1111</div>
												 	<div class="col-md-2" style="width: 16%;">快照数量(个)</div>
												 	<div class="col-md-2"  id="snapshortss">55</div>
												 	<div class="col-md-2" style="width: 16%;" >云硬盘数量(个)</div>
												 	<div class="col-md-2" id="volumess">55</div>
												</div>
												
												 <div class="col-md-12" style="padding-top: 25px;">
												 	<div class="col-md-2" style="font-size: 16px;font-weight: 600;width: 113px;"><span>--</span> 网络配额</div>
												 	<div class="col-md-10" ><hr style=" height: 1px;background-color: #c8c6c6;    margin-top: 10px;" /></div>
												 	
												</div>
												<div class="col-md-12" style="    line-height: 28px;padding-top: 10px;    padding-left: 30px;">
												 	<div class="col-md-2" style="width: 16%;" >路由器数量(个)</div>
												 	<div class="col-md-2" id="routers">0</div>
												 	<div class="col-md-2" style="width: 16%;" >防火墙数量(个)</div>
												 	<div class="col-md-2"id="firewalls" >0</div>
												 	<div class="col-md-2" style="width: 16%;" >网络数量(个)</div>
												 	<div class="col-md-2" id="networks">0</div>
												</div>
												<div class="col-md-12" style="    line-height: 28px;padding-top: 10px;    padding-left: 30px;">
												 	<div class="col-md-2" style="width: 16%;" >负载均衡数量(个)</div>
												 	<div class="col-md-2" id="loadbalancers">0</div>
												 	<div class="col-md-2" style="width: 16%;" >网卡数量(个)</div>
												 	<div class="col-md-2" id="vnics">0</div>
												 	<div class="col-md-2" style="width: 16%;" >公网IP数量(个)</div>
												 	<div class="col-md-2" id="floatingips">0</div>
												</div>
												<div class="col-md-12" style="    line-height: 28px;padding-top: 25px;    padding-left: 30px;">
												 	<div class="col-md-2" style="" >网段IP</div>
												 	<div class="col-md-6" >
													 		<div class="row"  style="border: 1px solid #c8c6c6;height: 100px;overflow: scroll; padding-left: 14px;">
													
																<table style="" id="tableBodys">
																	<tr>
																		<td ></td>
																	</tr>
																</table>
															</div>
												 	</div>
												 	
												 	
												</div>
					                   		</div>
					                   
					                   
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
						                    <p class="c-666 f-mt30 f-mb50">页面将在 <strong id="times" class="f-size18">10</strong> 秒钟后，跳转到 <a href="yunIndex.jsp" class="c-blue">用户首页</a></p>
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
												<input type="text" style="height: 40px;width: 78%;font-size: 18px;" id="orgComments"/>
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
										<button type="button" class="btn btn-primary" id="mymodel" onclick="submit()">
											确认
										</button>
									</div>
								</div><!-- /.modal-content -->
							</div><!-- /.modal -->
						</div>
					</div>
					<!--开始  -->
					<div class="m-modal">
						<div class="m-modal-dialog">
							<div class="m-top">
								<h4 class="m-modal-title">
									增加IP地址段
								</h4>
								<span class="m-modal-close">&times;</span>
							</div>
							<div class="m-middle">
								<div class="row" style="font-size:16px">
									<div class="col-md-12">
									 	<div class="col-md-3" >可用IP地址段</div>
									 	<div class="col-md-9" style="    border: 1px solid bisque;height: 130px;" id="choseId">
									 		<!-- <div class="col-md-12" style="padding-left: 0;">
									 			<div class="col-md-1"><input type="radio" name="options"></div>
									 			<div class="col-md-11">192.168.0.0/16;192.168.0.1-192.168.255.255</div>
									 		</div>  -->
									 		
									 	</div>
									</div>
									<div class="col-md-12" style="margin-top: 20px;">
									 	<div class="col-md-3"  style="    width: 22.5%;">CIDR<span style="color:red">*</span></div>
									 	<div class="col-md-9" style=" ">
									 		<input type="text" id="cidr" style="     width: 108%;" >
									 	</div>
									</div>
									<div class="col-md-12" style="margin-top: 20px;    margin-bottom: 20px;">
									 	<div class="col-md-3"  style="    width: 22.5%;">地址池</div>
									 	<div class="col-md-9">
									 		<input type="text" id="ipchi" style="     width: 108%;" >
									 	</div>
									</div>
								</div>
						
							</div>
							<div class="m-bottom">
								<button class="m-btn-sure">确定</button>
								<button class="m-btn-cancel">取消</button>
							</div>
						</div>
					</div>
					
					<!-- 结束 -->
					
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
		<script type="text/javascript" src="js/jquery.my-modal.1.1.js"></script>
		
		
		
		<script type="text/javascript">
		 var umtId=window.localStorage.getItem("umtId");
		 var cstnetId=window.localStorage.getItem("cstnetId");
		 var ipall="";
		 var dt_start="";
		 var dt_expired="";
		 var applyReason="";
		 $(document).ready(function() {
		    	var user_name=window.localStorage.getItem("user_name");
		    	choseAllId();
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
				var m1 = new MyModal.modal(function() {
					var flag=true;
					$("#tableBody tr").each(function(){
			        	var ip=$(this).children().eq(1).text()
			        	if(ip==ipall){
			        		alert("配置的网段ip与已配置的网段存在重叠")
			        		flag=false;
			        	}
			        })
			        if(!flag){
			        	return;
			        }
					var html="";
					html="<tr>"+
						 "<td ><input type='checkbox' class='bb'></td>"+
						 "<td >"+ipall+"</td>"+
						 "</tr>";
					$("#tableBody").append(html);
					//alert("你点击了确定");
				});
				$('.btn1').on("click", function() {
					m1.show();
				});
				
				$('input:radio[name="options"]').change(function(){
			    	 if($(this).is(":checked")){
			    		ipall=$(this).parent().next().html();
			    		var sipall=ipall.split(';')
			    		var cidr="";
			    		var ipchi="";
			    		for(var i = 0;i<sipall.length;i++){
							cidr=sipall[0]
							ipchi=sipall[1]
			    		}
			    		$("#cidr").val(cidr)
			    		$("#ipchi").val(ipchi)
			    	 }
			      });
				
				
				getOrgInfo(umtId);
				//第一页的确定按钮
				$("#btn_part1").click(function(){						
					
					var orgInfo=$("#orgInfo").val();
					if(orgInfo==""||orgInfo==null){
						alert("课题组名称不能为空，若没有请先创建课题组信息");
						return;
					}
					var flag=true;
					var orgIds=$("#orgInfo").val();
					$.ajax({
			        	type: "post",
		                dataType:"json",
		                async:false,
		                url: "${pageContext.request.contextPath}/getIsResource.do",
		                data:{orgIds:orgIds},
		                success: function(response){ 
		                	var data=response.data;
		                	if(data.length>0){
		                		alert("该课题组已申请过资源，请勿重复申请");
		                		flag=false;
		                	}
						
			            }  
			        });   
					if(!flag){
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
					var cores=$("#cores").val();
					var instances=$("#instances").val();
					var ram=$("#ram").val();
					var gigabytes=$("#gigabytes").val();
					var snapshorts=$("#snapshorts").val();
					var volumes=$("#volumes").val();
					var router=$("#router").val();
					var firewall=$("#firewall").val();
					var network=$("#network").val();
					var loadbalancer=$("#loadbalancer").val();
					var vnic=$("#vnic").val();
					var floatingip=$("#floatingip").val();
					 dt_start=$("#dt_start input").val();
					 dt_expired=$("#dt_expired input").val();
					 applyReason=$("#applyReason").val();
					$("#coress").html(cores)
					$("#instancess").html(instances)
					$("#rams").html(ram)
					$("#gigabytess").html(gigabytes)
					$("#snapshortss").html(snapshorts)
					$("#volumess").html(volumes)
					$("#routers").html(router)
					$("#firewalls").html(firewall)
					$("#networks").html(network)
					$("#loadbalancers").html(loadbalancer)
					$("#vnics").html(vnic)
					$("#floatingips").html(floatingip)
					$("#dt_starts").html(dt_start)
					$("#dt_expireds").html(dt_expired)
					$("#applyreasons").html(applyReason)
					var obj = {};
					obj.cores=cores;
					obj.instances=instances;
					obj.ram=ram;
					obj.gigabytes=gigabytes;
					obj.snapshorts=snapshorts;
					obj.volumes=volumes;
					obj.router=router;
					obj.firewall=firewall;
					obj.network=network;
					obj.loadbalancer=loadbalancer;
					obj.vnic=vnic;
					obj.floatingip=floatingip;
					var htmls="";
					var network = [];
					$("#tableBody tr").each(function(){
			        	var ips=$(this).children().eq(1).text()
						htmls+="<tr>"+
							 "<td >"+ips+"</td>"+
							 "</tr>";
						var networkChild = {};
						var sipalls=ips.split(';')
			    		var cidrs="";
			    		var ipchis="";
			    		for(var i = 0;i<sipalls.length;i++){
							cidrs=sipalls[0]
							ipchis=sipalls[1]
			    		}
			    		networkChild.cidr=cidrs
			    		
			    		var ip_pools = [];
						var ippoolChild = {};
			    		var ippoolAll=ipchis.split('-')
			    		for(var i = 0;i<ippoolAll.length;i++){
							start_ip=ippoolAll[0]
							end_ip=ippoolAll[1]
			    		}
			    		ippoolChild.start_ip=start_ip
			    		ippoolChild.end_ip=end_ip
			    		ip_pools.push(ippoolChild)
			    		networkChild.ip_pools=ip_pools
			    		network.push(networkChild)
			        })
			        var comments=$("#orgInfo option:selected").attr("comments")
					var orgId=$("#orgInfo option:selected").attr("orgId")
					var orgYunName=$("#orgInfo option:selected").text()
					obj.orgId=orgId
					obj.name=orgYunName
					obj.description=comments
			        obj.network_addresses=network
			        arr.push(obj);
					$("#tableBodys").html(htmls);
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
					if(applyReason==""||applyReason==null){
						flag=false;
						alert("申请理由不能为空");
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
					if( $("#tableBody tr").length<1 ){
						flag=false;
						alert("网段IP不能为空")
						return false;
					}
					/* $("#tableBody tr").each(function() {
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
					}) */
					if(!flag){
						return;
					}
					
					$("#comments").html($("#orgInfo option:selected").attr("comments"))
					$("#aorgInfo").html($("#orgInfo option:selected").text())
					/* $("#tableBodys tbody").html(html); */
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
			                data:{umtId:umtId,orgInfo:orgInfo,orgInfoName:orgInfoName,allInfo:allInfo,cstnetId:cstnetId,dt_start:dt_start,dt_expired:dt_expired,applyReason:applyReason},
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
										window.location.href="yunIndex.jsp";		
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
		 function checkboxOnclick(ele){
			 if ( ele.checked == true){
			 var typeName= $(ele).attr("typeName")
			 var maxNumber=$(ele).attr(typeName)
			 $("#"+typeName).val(maxNumber)
			 }else{
			 }
		 }

		 function choseAllId(){
			 $.ajax({
		        	type: "post",
	                dataType:"json",
	                url: "${pageContext.request.contextPath}/choseAllId.do",
	                success: function(response){           
		            	var html="";
	            		var data=response.data;
	            		if(data.length>0){                 
		                    for(var i=0; i<data.length; i++){
		                    	html+="<div class='col-md-12' style='padding-left: 0;'>";
		                    	html+="<div class='col-md-1'><input type='radio' name='options'></div>"
		                    	html+="<div class='col-md-11'>"+data[i].cidr+";"+data[i].start_ip+"-"+data[i].end_ip+"</div>"
		                    	html+="</div>"
		                    }  
		                    $("#choseId").html(html);
				    		//loadColumeDataOne(0);
		                    $('input:radio[name="options"]').change(function(){
		   			    	 if($(this).is(":checked")){
		   			    		ipall=$(this).parent().next().html();
		   			    		var sipall=ipall.split(';')
		   			    		var cidr="";
		   			    		var ipchi="";
		   			    		for(var i = 0;i<sipall.length;i++){
		   							cidr=sipall[0]
		   							ipchi=sipall[1]
		   			    		}
		   			    		$("#cidr").val(cidr)
		   			    		$("#ipchi").val(ipchi)
		   			    	 }
		   			      });
		                }  
		            }  
		        });  	
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
	                    	html+="<option value='" + data[i].uid + "' comments='" + data[i].comments + "' orgId='" + data[i].id + "'>" + data[i].name + "</option>";
	                    }  
	                    $("#orgInfo").html(html);
			    		//loadColumeDataOne(0);
	                }  
	            }  
	        });  
   		}
   	 	function submit(){ 
   	 	
   	 		
   	 		var orgName=$("#orgName").val();
   	 	    var orgComments=$("#orgComments").val();
   	 	    var supportUnit=$("#supportUnit").val();
   	 	    var contact_person=$("#contact_person").val();
   	        var contact_phone=$("#contact_phone").val();
	   	 	if(orgName==""||orgName==null){
		    	alert("课题组名称不能为空");
		    	return;
		    }
	   	 	if(orgComments==""||orgComments==null){
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
		    var contact_phone_patrn=/^1[34578]\d{9}$/;
		    if (!contact_phone_patrn.test(contact_phone)) {
		    	alert("请输入正确的电话号格式");
		    	return;
		    } 
		   	$.ajax({
	        	type: "post",
                dataType:"json",
                url: "${pageContext.request.contextPath}/exitOrgInfo.do",
                data:{orgName:orgName},
                success: function(response){           
                	var data=response.data;
                	if(data.length>0){ 
                		alert("此课题组已被创建过,请重新填写课题组名称");
        		    	return;
                	}else{
                		 $.ajax({
             	        	type: "post",
                             dataType:"json",
                             url: "${pageContext.request.contextPath}/addOrgInfo.do",
                             data:{umtId:umtId,orgName:orgName,comments:orgComments,supportUnit:supportUnit,contact_person:contact_person,contact_phone:contact_phone},
                             success: function(response){           
                             	window.location.reload()
                             	//$("#update").modal("hide");
             	            }  
             	        });  
                	}
	            }  
	        }); 
	        
   		}
   	 	function dl(){
	        var m = 0;
	        if ($('table tr').length == 0) {
	        	alert("请至少选择一条记录进行删除")
        	return;
        	} 
	        $("#tableBody tr").each(function(){
	        	if($(this).find("input[type='checkbox']").is(':checked')){
	        		m=m+1
	        		$(this).remove()
	        	}
	        })
	        if(m==0){
	        	alert("请至少选择一条记录进行删除")
	        }
	    }
   	 	
   	 
	 </script>
	</body>
</html>