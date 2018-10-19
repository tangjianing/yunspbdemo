<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <html>
     <head>
        <meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>用户监测</title>
		<!--bootstrap-->
		<link rel="stylesheet" href="css/bootstrap.css" />
		<link rel="stylesheet" href="css/datepicker.css" />
		<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css" />
		
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="js/bootstrap.js"></script>
		<script type="text/javascript" src="js/echarts.min.js"></script>
		
		
		<!--文字-->
		<link rel="stylesheet" href="css/iconfont.css" />
		<!--top样式-->
		<link rel="stylesheet" href="css/topPublic.css" />
		<link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
		<style type="text/css">
			.bodystyle {
				filter: alpha(opacity=60);
				-moz-opacity: 0.8;
				-khtml-opacity: 0.8;
				opacity: 0.8;
				height: 100%;
				width: 100%;
				position: absolute;
				background: url(images/bg8.jpg) no-repeat;
				background-size: cover;
				z-index: -1;
			}
		.row {
		    margin-right: 0px; 
		    margin-left: 0px; 
		}		
		canvas {
				border: 1px solid #6f4a4a !important;
		}	
		</style>
    </head>
    <body lang="zh-CN">
		<div class="bodystyle">
		</div>
		<!--TOP-->
		<div id="top" class="row">
			<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
				<img style="width: 40%; padding-top: 3%" src="images/logo.png" />
			</div>
			<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
				<span>您好!</span>
				<span id="name" style="color: white;"></span>
				<span>，欢迎登陆！</span>
				<span class="mui-icon iconfont icon-close top"></span>
				<a href="https://passport.escience.cn/logout?WebServerURL=http://159.226.188.120:8080/spbdemo/login.html"><span id="logout">退出登录</span></a>&nbsp;&nbsp;
				<span class="mui-icon iconfont icon-icon1460189584239"></span>
				<a href="index.jsp">返回主页</a>
			</div>
		</div>
		<!--END TOP-->
<!-- 		<h1 style="color: #FFF;cursor: pointer;display: inline-block;padding-left: 70px;padding-top: 5px;font-size: 28px;">账号下文件信息一览</h1>
 -->		
 		<div class="container">
			<div class="row" style="height: 80px;margin-top: 1%;">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					
					<div  class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						<div style="padding-top: 35px;" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<select  onchange="func()" id="accountStatus"  style="    width: 21%;height: 30px;background-color: #20b2b7c2;color: white;">   
							  
							 </select>
						</div>
						<div id="myecharts" style="    padding-top: 20px;width:550px;height: 400px;" class="col-xs-12 col-sm-12 col-md-12 col-lg-12"></div>
					</div>
					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					    <div style="padding-top: 35px;" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<input onchange="timefunc()" type="text" style="height: 30px;width: 200px;width: 120px;background-color: #3cc6ce;color: white;" id="time" class="m-ctrl-medium date-picker datetimepicker" type="text" data-date-format="yyyy-mm-dd" data-date-viewmode="days" readonly="readonly" />

						</div> 
						<div id="myeChartsCount" style="    padding-top: 20px;width:550px;height: 400px;" class="col-xs-12 col-sm-12 col-md-12 col-lg-12"></div>
					</div>
				</div>
			</div>
		</div>
       <!--  <div id="myecharts" style="width:500px;height: 250px;"></div> -->
        
		<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
		<script src="js/common.js"></script>
		<script type="text/javascript" src="js/bootstrap-datepicker.js"></script>
		<script type="text/javascript" src="js/bootstrap-datetimepicker.js"></script>
		<script type="text/javascript" src="js/bootstrap-datetimepicker.zh-CN.js"></script>
	    <script type="text/javascript">
		    $(document).ready(function() {
		    	getModelList3()
		    	var user_name=window.localStorage.getItem("user_name");
				$("#name").html(user_name);
		    	var d=new Date(),str=''; 
		    	if(d.getMonth()<10){
		    		  str +=d.getFullYear()+'-0'; //获取当前年份 
		    	}else{
		    		   str +=d.getFullYear()+'-'; //获取当前年份 
		    	}
			 
			    str +=d.getMonth()+1; //获取当前月份（0——11） 
			    $("#time").val(str);
			    loadColumeDataTwo(str)
  
/* 		    	$('.date-picker').datepicker();
 */		    	 $('.datepicker').datepicker(); 
		    	$('#time').datetimepicker({
					language: 'zh-CN',
					startView: 'year',
					minView: 'year',
					maxView: 'decade',
					format: 'yyyy-mm',
					autoclose: true
				});
			});
		    var x = [];
		    var y = [];
		    function loadColumeDataOne(account_id) {
		    	if(account_id==0){
		    		var id=$("#accountStatus option:selected").val();
		    		account_id=id;
		    	}
		    	x = [];
		    	y = [];
		    	$.ajax({
		    		async:false,
		    		url : "${pageContext.request.contextPath}/graphicInfo.do",
		    		data:{account_id:account_id},
		    		dataType : "json",
		    		type : "post",
		    		success : function(response) {
		    			$.each(response.data,function(i,j){
		    				x.push(j.dt);
		    				y.push( {value:j.bytes_num, name: j.dt});
		    			});
		    		},
		    		error : function(errorMsg) {
		    			alert("加载数据失败");
		    		}
		    	});
		    	initMyChartOne(x,y);
		    }
		    function initMyChartOne(xData,yData){
		    	var myChart = echarts.init(document.getElementById('myecharts'));
		    	var option = {
		    		    title : {
		    		        text: '同一账号不同月份存储容量剩余情况',
		    		        textStyle: {
		    		            fontSize: 16,
		    		            color: '#e8523e' ,   
		    		            display: 'inline-block',
		    		            fontWeight: 400
		    		            // 主标题文字颜色
		    		        },
		    		    },
		    		    tooltip : {
		    		        trigger: 'axis'
		    		    },
		    		    calculable : true,
		    		    barCategoryGap : '50',
		    		    grid: {
		    		        left: '6%',
		    		        right: '4%',
		    		        bottom: '4%',
		    		        containLabel: true
		    		    },
		    		    
		    		    xAxis : [
		    		        {
		    		            type : 'category',
		    		            data :xData ,
		    		            axisLabel:{  
		    	                    interval:0,  
		    	                    rotate:0,//倾斜度 -90 至 90 默认为0  
		    	                    textStyle:{  
		    	                        color:"#FFFFFF"  
		    	                    }  
		    	                }  
		    		        }
		    		    ],
		    		    yAxis : [
		    		        {
		    		            type : 'value',
		    		            axisLabel:{  
		    	                    textStyle:{  
		    	                        color:"#FFFFFF"  
		    	                    }  
		    	                }  
		    		        }
		    		    ],
		    		    series : [
		    		        {
		    		            name:'剩余容量',
		    		            type:'bar',
		    		            data:yData,
		    		            itemStyle:{
		    		                normal:{
		    		                    color:'#379CF8'
		    		                }
		    		            }
		    		        }
		    		    ]
		    	};
		    	//设置option
		    	myChart.setOption(option);
		    }
		    function getModelList3(){  
		        $.ajax({
		        	type: "post",
	                dataType:"json",
	                url: "${pageContext.request.contextPath}/accountStatus.do",
	                success: function(response){           
		            	var html="";
	            		var data=response.data;
	            		if(data.length>0){                 
		                    for(var i=0; i<data.length; i++){
		                    	html+="<option value='" + data[i].account_id + "'>" + data[i].account_id + "</option>";
		                    }  
		                    $("#accountStatus").html(html);
				    		loadColumeDataOne(0);
		                }  
		            }  
		        });  
		      
	   		} 
		    function func(){
		    	var account_id = $('select option:selected').val();
		    	loadColumeDataOne(account_id);
	    	}
		   
		    var m = [];
		    var n = [];
		    function loadColumeDataTwo(time) {
		    	
		    	m = [];
		    	n = [];
		    	$.ajax({
		    		async:false,
		    		url : "${pageContext.request.contextPath}/graphicCountInfo.do",
		    		data:{dt:time},
		    		dataType : "json",
		    		type : "post",
		    		success : function(response) {
		    			$.each(response.data,function(i,j){
		    				m.push(j.account_id);
		    				n.push( {value:j.bytes_num, name: j.account_id});
		    			});
		    		},
		    		error : function(errorMsg) {
		    			alert("加载数据失败");
		    		}
		    	});
		    	initMyChartTwo(m,n);
		    }
		    function initMyChartTwo(xData,yData){
		    	var myChart = echarts.init(document.getElementById('myeChartsCount'));
		    	var option = {
		    		    title : {
		    		        text: '同一月份不同账号存储容量剩余情况',
		    		        textStyle: {
		    		            fontSize: 16,
		    		            color: '#e8523e' ,   
		    		            display: 'inline-block',
		    		            fontWeight: 400
		    		            // 主标题文字颜色
		    		        },
		    		    },
		    		    tooltip : {
		    		        trigger: 'axis'
		    		    },
		    		    calculable : true,
		    		    barCategoryGap : '50',
		    		    grid: {
		    		        left: '6%',
		    		        right: '4%',
		    		        bottom: '4%',
		    		        containLabel: true
		    		    },
		    		    
		    		    xAxis : [
		    		        {
		    		            type : 'category',
		    		            data :xData ,
		    		            axisLabel:{  
		    	                    interval:0,  
		    	                    rotate:0,//倾斜度 -90 至 90 默认为0  
		    	                    textStyle:{  
		    	                        color:"#FFFFFF"  
		    	                    }  
		    	                }  
		    		        }
		    		    ],
		    		    yAxis : [
		    		        {
		    		            type : 'value',
		    		            axisLabel:{  
		    	                    textStyle:{  
		    	                        color:"#FFFFFF"  
		    	                    }  
		    	                }  
		    		        }
		    		    ],
		    		    series : [
		    		        {
		    		            name:'剩余容量',
		    		            type:'bar',
		    		            data:yData,
		    		            itemStyle:{
		    		                normal:{
		    		                    color:'#379CF8'
		    		                }
		    		            }
		    		        }
		    		    ]
		    	};
		    	//设置option
		    	myChart.setOption(option);
		    }
		    function timefunc(){
		    	var dt = $("#time").val();
		    	loadColumeDataTwo(dt);
	    	}
		</script>
	</body>
  </html>