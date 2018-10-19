<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <html>
     <head>
        <meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>成员资源监控</title>
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
		<link rel="stylesheet" href="css/myProgress.css" />
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
    		<img src="images/544518852714682623.jpg" style="width: 116%;margin-left: -8%;"/>
    	</div>
 		<div class="container">
			<div class="row" style="padding-bottom: 5%;">
				<div class="col-md-12 border" style="margin-top: -6%;background-color: #FFFFFF;">
					<div class="row" style="padding: 2% 5% 1% 5%;">
						<div class="col-md-6">
							成员资源监控详情
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
						<!-- <div class="col-md-6" style="padding-right: 8px;">
							<div style="background-color:#FFFFFF ;height: 270px;">
								<div id="myechartsPie" style="height: 270px;">
									
								</div>
							</div>
						</div> -->
						<div class="col-md-12" style="padding-left: 8px;">
							<div style="background-color:#FFFFFF ;height: 100px;">
								 <div style="    text-align: center;font-size: 14px;font-weight: 600;">存储使用情况(GB)</div>
								 <div style="margin-left: 8%;width:400px !important;margin-top: 20px;" class="progress-out" w="0"> 
									 <div class="percent-show"><span>50</span>%</div>
									 <div class="progress-in"></div>
								 </div>
							</div>
						</div>
						<div class="col-md-12" style="padding-left: 8px;">
							<div style="background-color:#FFFFFF ;height: 270px;">
								<div id="myeChartsCount" style="height: 270px;">
									
								</div>
							</div>
						</div>
						<div class="col-md-12"  style="margin-top: 16px;margin-bottom: 50px; padding-right: 8px;">
							<div style="background-color:#FFFFFF ;height: 270px;">
								<div id="myecharts" style="height: 270px;">
									
								</div>
							</div>
						</div>
						<!-- <div class="col-md-6"  style="margin-top: 16px;margin-bottom:50px ; padding-left: 8px;">
							<div style="background-color:#FFFFFF ;height: 270px;">
								<div  id="myeChartsAdd" style="height: 270px;">
									
								</div>
							</div>
						</div> -->
					</div>
				</div>
			</div>
		</div>
      	<jsp:include page="common/footer.jsp"></jsp:include>
        
		<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
		<script src="js/common.js"></script>
		<script src='js/stopExecutionOnTimeout.js?t=1'></script>
		<script src='js/jquery.myProgress.js'></script>
	    <script type="text/javascript">
		    $(document).ready(function() {
		    	/* getModelList3() */
		    	loadColumeDataOne()
		    	loadColumeDataTwo()
		    	/*  loadData() 
		    	loadColumeDataAdd() */
		    	var user_name=window.localStorage.getItem("user_name");
				$("#name").html(user_name);
				var activePos = $('.tabs-header .active').position();
				loadData()
				
			}); 
		    var url = location.search; //获取url中"?"符后的字串
			var account_id;
			if(url!=""&&url!=null){
				account_id = getUrlParam('account_id');
				account_id=decodeURI(account_id)
			}
			
			function getUrlParam(param){
				if(location.search.indexOf(param) == -1){
					return "";
				}
				var s=location.search.substr(location.search.indexOf(param)+param.length+1);
				if(s.indexOf("&")!=-1){return s.substring(0,s.indexOf("&"));}
				else{return s;}
			}
			
		    function changePos() {
		        activePos = $('.tabs-header .active').position();
		        $('.border').stop().css({
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
		
			
			
		    var uid=25;
		    
		    var x = [];
		    var y = [];
		    function loadColumeDataOne() {
		    	x = [];
		    	y = [];
		    	$.ajax({
		    		async:false,
		    		url : "${pageContext.request.contextPath}/getUsedTrend.do",
		    		data:{account_id:account_id},
		    		dataType : "json",
		    		type : "post",
		    		success : function(response) {
		    			$.each(response.data,function(i,j){
		    				x.push(j.dt);
		    				y.push( {value:j.file_num, name: j.dt});
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
		    		        text: '用户90天内资源增长情况(文件数)',
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
		    		    	trigger: 'axis',
		    		        axisPointer: {
		    		            type: 'cross'
		    		        }
		    		    },
		    		    toolbox: {
		    		        show: true,
		    		        feature: {
		    		            saveAsImage: {}
		    		        }
		    		    },
		    		    xAxis : [
		    		        {
		    		        	type: 'category',
		    		            boundaryGap: false,
		    		            data :xData 
		    		        }
		    		    ],
		    		    yAxis : [
		    		        {
		    		        	type: 'value',
		    		            axisLabel: {
		    		                formatter: '{value}'
		    		            },
		    		            axisPointer: {
		    		                snap: true
		    		            } 
		    		            
		    		        }
		    		    ],
		    		    
		    		    series : [
		    		        {
		    		            name:'文件数(个 )',
		    		            type:'line',
		    		            smooth: true,
		    		            data:yData,
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
		    		url : "${pageContext.request.contextPath}/getUsedTrend.do",
		    		data:{account_id:account_id},
		    		dataType : "json",
		    		type : "post",
		    		success : function(response) {
		    			$.each(response.data,function(i,j){
		    				m.push(j.dt);
		    				n.push( {value:j.bytes_num, name: j.dt});
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
					        text: '用户90天内资源增长情况(GB)',
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
					    	trigger: 'axis',
					        axisPointer: {
					            type: 'cross'
					        }
		    		    },
		    		    toolbox: {
		    		        show: true,
		    		        feature: {
		    		            saveAsImage: {}
		    		        }
		    		    },
		    		    xAxis : [
		    		        {
		    		        	type: 'category',
		    		            boundaryGap: false,
		    		            data :xData 
		    		        }
		    		    ],
		    		    yAxis: {
		    		    	type: 'value',
		    		        axisLabel: {
		    		            formatter: '{value}'
		    		        },
		    		        axisPointer: {
		    		            snap: true
		    		        }
					    },
					    
		    		    series : [
		    		        {
		    		            name:'使用容量(GB)',
		    		            type:'line',
		    		            smooth: true,
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
	    	//饼图
	    	function loadData() {
	    		$.ajax({
	    			async:false,
	    			data:{account_id:account_id},
	    			url : '${pageContext.request.contextPath}/getAccountPieInfo.do',
	    			dataType : 'json',
	    			type : 'post',
	    			success : function(result) {
	    				$.each(result.data,function(i,j){
	    					var params=j.params
	    					var bytes_num=j.bytes_num
	    					if(bytes_num==""||bytes_num==null){
	    						var width=0;
	    					}else{
	    						var width=(bytes_num/params).toFixed(2)*100
	    					}
	    					
	    					var div=$(".progress-out");//进度条要插入的地方
	    					
	    					div.each(function(){
	    						
	    						$(this).myProgress({speed: 4000, percent:width,width: "800px"}); 
	    					})
	    				});
	    			},
	    			error : function(errorMsg) {
	    				alert("加载数据失败");
	    			}
	    		});
	    	}
		    
		</script>
	</body>
  </html>