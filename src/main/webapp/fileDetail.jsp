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
		<link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
		<style type="text/css">
			body {
   				font-family: "微软雅黑";
	   			background-color: #EBEDF1;
	   		}
			* {
				padding: 0;
				margin: 0;
				font-family: "microsoft yahei";
			}
			
			ul li {
				list-style-type: none;
			}
			
			.box {
				width: 200px;
				/*border: 1px solid red;*/
			}
			
			ul {
				margin-left: 20px;
				color: white;
				/*border: 1px solid blue;*/
			}
			
			.menuUl li {
				margin: 10px 0;
			}
			
			.menuUl li span:hover {
				text-decoration: none;
				
			}
			
			.menuUl li i {
			 	margin-right: 10px; 
				top: 0px; cursor: pointer; color: #dcdc1f; 			
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
					
					<div class="row" style="padding: 0 5%;">
						<div class="col-md-12">
							<div style="border: 1px solid #EDEEED;"></div>
						</div>
					</div>
					<div class="row" style="padding: 2% 5%;">
							<div class="innerUl" style="padding-left: 20%;padding-top: 3%;font-size: 20px;overflow-y:scroll;  height:400px;">

		   						</div>

					</div>
				</div>
			</div>

		</div>
		<jsp:include page="common/footer.jsp"></jsp:include>
		

		<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
	    <script type="text/javascript" src="js/proTree.js" ></script>
	    <script type="text/javascript">
        //标题的图标是集成bootstrap 的图标  更改 请参考bootstrap的字体图标替换自己想要的图标
		
		$(document).ready(function() {
			var user_name=window.localStorage.getItem("user_name");
			$("#name").html(user_name);
				var url = location.search; //获取url中"?"符后的字串
				var account_id;
				if(url!=""&&url!=null){
					account_id = getUrlParam('account_id');
					account_id=decodeURI(account_id)
				}
				initProgramList(account_id);
		});
		function getUrlParam(param){
			if(location.search.indexOf(param) == -1){
				return "";
			}
			var s=location.search.substr(location.search.indexOf(param)+param.length+1);
			if(s.indexOf("&")!=-1){return s.substring(0,s.indexOf("&"));}
			else{return s;}
		}
		function initProgramList(fileDir){
			
			$.ajax({ 
                type: "post",
                dataType:"json",
                url: "${pageContext.request.contextPath}/fileDetail.do",
                data:{fileDir:fileDir},
                success: function(response){
                		var html="";
                		var arr =response;
                		$(".innerUl").ProTree({
                			arr: arr,
                			close:true,
                			simIcon: "fa fa-file-o",//单个标题字体图标 不传默认glyphicon-file
                			mouIconOpen: "fa fa-folder-open-o",//含多个标题的打开字体图标  不传默认glyphicon-folder-open
                			mouIconClose:"fa fa-folder-o",//含多个标题的关闭的字体图标  不传默认glyphicon-folder-close
                			callback: function(id,name,path) {
                				var fileType = name.substring(name.lastIndexOf(".") + 1, name.length).toLowerCase();
                				var document = [ "txt", "doc", "docx", "xls", "htm", "html", "jsp", "rtf", "wpd", "pdf", "ppt" ];
                				for (var i = 0; i < document.length; i++) {
	                				if (document[i]==fileType) {
	                					
	                					 var url = "http://storage.cstcloud.cn/spbdemo/fileDownload.do?path="+path;
                				      
	               				        var form = $("<form></form>").attr("action", url).attr("method", "post");
	               				        form.append($("<input></input>").attr("type", "hidden").attr("path", "path").attr("value", path));
	               				        form.appendTo('body').submit().remove();
	                				}
                				}
                				
                			}
                		})
            	 },
            });
		}
	</script>
	</body>
  </html>