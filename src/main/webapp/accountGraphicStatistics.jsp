<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <html>
     <head>
        <meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>资源监控</title>
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
			body {
   				font-family: "微软雅黑";
	   			background-color: #EBEDF1;
	   		}
		.row {
		    margin-right: 0px; 
		    margin-left: 0px; 
		}		
		
		</style>
    </head>
    <body lang="zh-CN">
		<jsp:include page="common/header.jsp"></jsp:include>
    	<div style="overflow: hidden;">
    		<img src="images/banner6.jpg" style="width: 116%;margin-left: -8%;"/>
    	</div>
 		<div class="container">
			<div class="row" style="padding-bottom: 5%;">
				<div class="col-md-12 border" style="margin-top: -6%;background-color: #FFFFFF;">
					<div class="row" style="padding: 2% 5% 1% 5%;">
						<div class="col-md-6">
							资源监控详情
						</div>
						<div class="col-md-6 text-right">
							<button onclick="javascript:history.back(-1);" style="width: 102px;height: 35px;border: none;background-color: #ebedf1;color: #2c2c88;">返回上一页</button>
						</div>
					</div>
					<div class="row" style="padding: 0 5%;">
						<div class="col-md-12">
							<div style="border: 1px solid #EDEEED;"></div>
						</div>
					</div>
					<div class="row" style="padding: 2% 5%;">
						<div class="col-md-6" style="padding-right: 8px;">
							<div style="background-color:#FFFFFF ;height: 270px;">
								<div onclick="accountInfo()" id="myechartsPie" style="height: 270px;">
									
								</div>
							</div>
						</div>
						<div class="col-md-6" style="padding-left: 8px;">
							<div style="background-color:#FFFFFF ;height: 270px;">
								<div id="myeChartsCount" style="height: 270px;">
									
								</div>
							</div>
						</div>
						<div class="col-md-6"  style="margin-top: 16px;margin-bottom: 50px; padding-right: 8px;">
							<div style="background-color:#FFFFFF ;height: 270px;">
								<div id="myecharts" style="height: 270px;">
									
								</div>
							</div>
						</div>
						<div class="col-md-6"  style="margin-top: 16px;margin-bottom:50px ; padding-left: 8px;">
							<div style="background-color:#FFFFFF ;height: 270px;">
								<div  id="myeChartsAdd" style="height: 270px;">
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
      	<jsp:include page="common/footer.jsp"></jsp:include>
        
		<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
		<script src="js/common.js"></script>
		
	    <script type="text/javascript">
		    $(document).ready(function() {
		    	/* getModelList3() */
		    	loadColumeDataOne()
		    	loadColumeDataTwo()
		    	 loadData() 
		    	loadColumeDataAdd()
		    	var user_name=window.localStorage.getItem("user_name");
				$("#name").html(user_name);
		    
			}); 
		    var url = location.search; //获取url中"?"符后的字串
			var uid;
			if(url!=""&&url!=null){
				uid = getUrlParam('uid');
				uid=decodeURI(uid)
			}
			
			function getUrlParam(param){
				if(location.search.indexOf(param) == -1){
					return "";
				}
				var s=location.search.substr(location.search.indexOf(param)+param.length+1);
				if(s.indexOf("&")!=-1){return s.substring(0,s.indexOf("&"));}
				else{return s;}
			}
		    
		    
		    var x = [];
		    var y = [];
		    function loadColumeDataOne() {
		    	/* if(account_id==0){
		    		var id=$("#accountStatus option:selected").val();
		    		account_id=id;
		    	} */
		    	
		    	x = [];
		    	y = [];
		    	$.ajax({
		    		async:false,
		    		url : "${pageContext.request.contextPath}/getDataInfo.do",
		    		data:{uid:uid,type:0},
		    		dataType : "json",
		    		type : "post",
		    		success : function(response) {
		    			$.each(response.data,function(i,j){
		    				x.push(j.username);
		    				y.push( {value:j.num_mb, name: j.username});
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
		    		        text: '用户存储资源使用排名(GB)Top10',
		    		        top:'10',
					        textStyle : 
					        	{
					        		color:'black',
					                align : 'center',
					                baseline : 'middle',
					                fontFamily : '微软雅黑',
					                fontSize : 15,
					                fontWeight : 'bolder'
					            },
					        left: 'center'
		    		    },
		    		    tooltip : {
		    		        trigger: 'axis'
		    		    },
		    		    xAxis : [
		    		        {
		    		            type : 'category',
		    		            data :xData ,
		    		            axisLine:{
		                            lineStyle:{
		                                color:'black'
		                            }
		                        },
		                        axisLabel: {
		    						color: "#707170" ,
	    							 interval:0,
	    							 rotate:40
		    						
		    					} 
		    		        }
		    		    ],
		    		    yAxis : [
		    		        {
		    		            type : 'value',
		    		            axisLine:{
		                            lineStyle:{
		                                color:'black'
		                            }
		                        },axisLabel: {
		    						color: "#707170" 
		    					}  
		    		        }
		    		    ],
		    		    grid: {
					        left: 100
					        
					    },
		    		    series : [
		    		        {
		    		            name:'使用容量(GB)',
		    		            type:'bar',
		    		            data:yData,
		    		            barMaxWidth:30,//最大宽度
		    			        
		    		        }
		    		    ],
		    		    
					    color:["#E5934C"]
		    	};
		    	//设置option
		    	myChart.setOption(option);
		    }
		    var m = [];
		    var n = [];
		    function loadColumeDataTwo() {
		    	
		    	m = [];
		    	n = [];
		    	$.ajax({
		    		async:false,
		    		url : "${pageContext.request.contextPath}/getDataInfo.do",
		    		data:{uid:uid,type:1},
		    		dataType : "json",
		    		type : "post",
		    		success : function(response) {
		    			$.each(response.data,function(i,j){
		    				m.push(j.username);
		    				n.push( {value:j.num_files, name: j.username});
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
		    			title: {
					        text: '用户文件数量排名Top10',
					        top:'10',
					        textStyle : 
					        	{
					        		color:'black',
					                align : 'center',
					                baseline : 'middle',
					                fontFamily : '微软雅黑',
					                fontSize : 15,
					                fontWeight : 'bolder'
					            },
					        left: 'center'
					    },
					    tooltip : {
		    		        trigger: 'axis'
		    		    },
		    		    
		    		    xAxis : [
		    		        {
		    		            type : 'category',
		    		            data :xData ,
		    		            axisLine:{
		                            lineStyle:{
		                                color:'black'
		                            }
		                        },
		                        axisLabel: {
		    						color: "#707170" ,
		    							 interval:0,
		    							 rotate:40
		    					}
		    					

		    		        }
		    		    ],
		    		    yAxis: {
					        type: 'value',
					        axisLine:{
		                        lineStyle:{
		                            color:'black'
		                        }
		                    },axisLabel: {
								color: "#707170" 
							}
					    },
					    grid: {
					        left: 100
					        
					    },
		    		    series : [
		    		        {
		    		            name:'文件数量(个)',
		    		            type:'bar',
		    		            data:yData,
		    			        barMaxWidth:30,//最大宽度
		    			       
		    		        }
		    		    ],
		    		    color:["#A16DC7"]
		    	};
		    	//设置option
		    	myChart.setOption(option);
		    }
		    /* function timefunc(){
		    	var dt = $("#time").val();
		    	loadColumeDataTwo(dt);
	    	} */
	    	var p = [];
	    	var q = [];

	    	function loadData() {
	    		
	    		$.ajax({
	    			async:false,
	    			data:{uid:uid},
	    			url : '${pageContext.request.contextPath}/getPieInfo.do',
	    			dataType : 'json',
	    			type : 'post',
	    			success : function(result) {
	    				$.each(result.data,function(i,j){
	    					p.push("已用容量");
	    					var quota=j.quota
	    					var num_mb=j.num_mb
	    					if(j.num_mb==""||j.num_mb==null){
	    						
	    						q.push( {value:0, name: "已用容量"});
	    					}else{
	    						q.push( {value:(num_mb), name: "已用容量"});
	    					}
	    					
	    					p.push("剩余容量");
	    					if(j.num_mb==""||j.num_mb==null){
	    						
	    						q.push( {value:(quota), name: "剩余容量"});
	    					}else{
	    						
	    						q.push( {value:((quota-num_mb).toFixed(2)), name: "剩余容量"});
	    					}
	    					
	    					
	    				});
	    			},
	    			error : function(errorMsg) {
	    				alert("加载数据失败");
	    			}
	    		});//AJAX
	    		initMyCharts(p,q);
	    	}//loadData()
	    	function initMyCharts(xData,yData){
	    	var myChart = echarts.init(document.getElementById('myechartsPie'));
	    	var option = {
    			title: {
			        text: '存储使用情况(GB)',
			        top:'10',
			        textStyle : 
			        	{
			        		color:'black',
		                    align : 'center',
		                    baseline : 'middle',
		                    fontFamily : '微软雅黑',
		                    fontSize : 15,
		                    fontWeight : 'bolder'
		                },
			        left: 'center'
			    },
			    tooltip : {
			        trigger: 'item',
			        formatter: "{b} : {c} ({d}%)"
			    },
			    legend: {
			        bottom: 15,
			        left: 'center',
			        data: [ '已用容量','剩余容量']
			    },
			    grid : {
			        bottom: 20   //距离容器下边界30像素
			    },
	    		series : [ {
	    			 name:'容量(MB)',
	    			 type: 'pie',
		             radius : '65%',
		             center: ['50%', '50%'],
		             selectedMode: 'single',
	    	         data:yData,
	    	         itemStyle: {
		                emphasis: {
		                    shadowBlur: 10,
		                    shadowOffsetX: 0,
		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
		                }
		             },
		             /* label: {
		                normal: {
		                    show: true,
		                    position: 'inside',
		                    formatter: '{d}%',
		                    textStyle : {                   
			                    align : 'center',
			                    baseline : 'middle',
			                    fontFamily : '微软雅黑',
			                    fontSize : 15,
			                    fontWeight : 'bolder'
			                }
		                },
		              } */
	    			} ],
	    			 color:['#22A4BF','#F39016']
	    		

	    	};

	    	//设置option
	    	myChart.setOption(option);
	    	}
	    	function accountInfo(){
	    		window.location.href =encodeURI('userAccount.jsp?uid='+uid);
	    	}
	    	
	    	
	    	var a = [];
		    var b= [];
		    function loadColumeDataAdd() {
		    	/* if(account_id==0){
		    		var id=$("#accountStatus option:selected").val();
		    		account_id=id;
		    	} */
		    	
		    	a= [];
		    	b = [];
		    	$.ajax({
		    		async:false,
		    		url : "${pageContext.request.contextPath}/getDataAddInfo.do",
		    		data:{uid:uid},
		    		dataType : "json",
		    		type : "post",
		    		success : function(response) {
		    			$.each(response.data,function(i,j){
		    				a.push(j.username);
		    				b.push( {value:j.addnumber, name: j.username});
		    			});
		    		},
		    		error : function(errorMsg) {
		    			alert("加载数据失败");
		    		}
		    	});
		    	initMyChartAdd(a,b);
		    }
		    function initMyChartAdd(xData,yData){
		    	var myChart = echarts.init(document.getElementById('myeChartsAdd'));
		    	var option = {
		    		    title : {
		    		        text: '用户近一个月资源存储使用增长排名(GB)Top10',
		    		        top:'10',
					        textStyle : 
					        	{
					        		color:'black',
					                align : 'center',
					                baseline : 'middle',
					                fontFamily : '微软雅黑',
					                fontSize : 15,
					                fontWeight : 'bolder'
					            },
					        left: 'center'
		    		    },
		    		    tooltip : {
		    		        trigger: 'axis'
		    		    },
		    		    xAxis : [
		    		        {
		    		            type : 'category',
		    		            data :xData ,
		    		            axisLine:{
		                            lineStyle:{
		                                color:'black'
		                            }
		                        },
		                        axisLabel: {
		    						color: "#707170",
	    							 interval:0,
	    							 rotate:40 
		    						
		    					} 
		    		        }
		    		    ],
		    		    yAxis : [
		    		        {
		    		            type : 'value',
		    		            axisLine:{
		                            lineStyle:{
		                                color:'black'
		                            }
		                        },axisLabel: {
		    						color: "#707170" 
		    					}
		    		        }
		    		    ],
		    		    grid: {
					        left: 100
					        
					    },
		    		    series : [
		    		        {
		    		            name:'增长量(GB)',
		    		            type:'bar',
		    		            data:yData,
		    		            barMaxWidth:30,//最大宽度
		    			        
		    		        }
		    		    ],
					    color:["#5096E3"]
		    	};
		    	//设置option
		    	myChart.setOption(option);
		    }
		</script>
	</body>
  </html>