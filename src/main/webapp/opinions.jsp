<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@taglib uri="/struts-tags" prefix="s" %> --%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>常用意见</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1"/>
    <meta http-equiv="cache-control" content="no-cache">
    <script src="js/jquery-1.8.3.js"></script>
    <script src="js/jquery-form.js"></script>
    <script src="js/jquery.validate.js"></script>
    <script src="js/jquery.pagination.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/spin.js"></script>
    <script src="js/basic.js"></script>
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/basic.css" rel="stylesheet">
    <link href="css/person.css" rel="stylesheet">  
    <link href="images/logo.ico" rel="shortcut icon">
     <!--[if IE 8]>
		<script src="js/placeholder.js"></script>
	<![endif]--> 
</head>
<script>
	var getApplyCount=0;
	var getPersonalCount=0;
	var applyPageSize=5;
	function selectAll(nextSelector,_this){
        if ($(_this).prop("checked")) {
        	$(_this).parent().addClass("on");
            $(nextSelector+" input[type=checkbox]").prop("checked", true);
            $(nextSelector+" input[type=checkbox]").each(function () {
                $(this).parent().addClass("on");
            });
        } else {
        	$(_this).parent().removeClass("on");
            $(nextSelector+" input[type=checkbox]").prop("checked", false);
            $(nextSelector+" input[type=checkbox]").each(function () {
                $(this).parent().removeClass("on");
            });
        }
	};
	/* 通用意见获取 */
    function InitApplyOpinion(pageIndex) {
    		getApplyCount++;
    		$("#pagination_apply").html("");
	    	$("#apply_count").val("");
	    	var spinner = new Spinner(spinOpts);
	    	spinner.spin($("#apply_opinion_container").get(0));
            $.ajax({ 
                type: "post",
                dataType:"json",
                url: "${pageContext.request.contextPath}/showOpinionViewType1.do?pageIndex="+pageIndex + "&pageSize="+ applyPageSize+"&"+Math.random(),	
                success: function(response){
                	if(response.errcode==0){
                		getApplyCount=0;
                		 spinner.spin(); 
                		 $("#apply_count").val(response.pageCount);
                		var dataHtml="";
                		var data=response.data;
                		if(data.length>0){
                			for(var i=0;i<data.length;i++){
                				dataHtml += '<li><div class="checkbox_group pull-left width10_"><span class="checkbox_wraper">'+
               	             '<input type="checkbox" class="checkbox_class" name="id" value="'+data[i].id+'"/></span></div>'+
               	             '<div class="apply_opinion_list  pull-left width90_"><span>'+data[i].opinion+'</span></div>'+
               	             '</li>'; 
                        	}
                			$("#pagination_apply").html(dataHtml);
                			
                		}else{
                			if(getApplyCount<=5){
                				spinner.spin(); 
                				getApplyOpinion();
                			}else{
                				spinner.spin();
                				$("#pagination_apply").html("<li>获取数据失败，请刷新重试</li>");
                				return false;
                			}
                			
                		}
               		}else if(response.errcode==-2){
               			location.href = 'error_xt.jsp';
               		};
                	if(response.errcode==-1){
                		if(getApplyCount<=5){
                			spinner.spin(); 
               				getApplyOpinion();
               			}else{
               				getApplyCount=0;
               				spinner.spin();
   		            		$("#pagination_apply").html("<li>暂无记录</li>");
               				return false;
               			}
	            		
            		};
            	},
            	
            });
    	
    	
           
	};
	
    function getApplyOpinion(){
    	 InitApplyOpinion(1);
    	 var applyOpinionTimer=setInterval(function(){
		    	if($("#apply_count").val()){
		    		$('#pagination_apply_opinion').pagination({
						totalData:$("#apply_count").val(),
						showData:5,
		        		jump:true,
		        	    coping:true,
		        	    prevContent:'上页',
		        	    nextContent:'下页',
		                callback:ApplyOpinionCallBack,
		            });
		    		clearInterval(applyOpinionTimer);
		    	}
		    },20);
    };
    function ApplyOpinionCallBack(api){
   		InitApplyOpinion(api.getCurrent());
	} ;
		/*个性化意见  */
		/*  获取*/
		function initPersonalOpinion(pageIndex){
			getPersonalCount++;
			var spinner = new Spinner(spinOpts);
	    	spinner.spin($("#personal_opinion_container").get(0));
	    	$("#personal_count").val("");
	    	$("#pagination_personal").html("");
			$.ajax({
				url:"${pageContext.request.contextPath}/showAllOpinionViewByUid?pageIndex="+pageIndex + "&pageSize="+ applyPageSize+"&"+Math.random(),
				type:"get",
				dataType: 'json',
				success:function(response){
					if(response.errcode==0){
						spinner.spin();
						$("#personal_count").val(response.pageCount);
						var dataHtml = '';
						if(response.data.length>0){
							
							$.each(response.data, function (index, item) {
					             dataHtml += '<li><div class="checkbox_group pull-left width10_"><span class="checkbox_wraper">'+
					             '<input type="checkbox" class="checkbox_class" name="id" value="'+item.id+'"/></span></div>'+
					             '<div class="file_type_content pull-left width60_">';
					             for(var i=0;i<item.filetypes.length;i++){
					            	 if(i==item.filetypes.length-1){
					            		 dataHtml+='<span>'+item.filetypes[i]+'</span>';
					            	 }else{
					            		 dataHtml+='<span>'+item.filetypes[i]+'</span>,';
					            	 } 
					             } 
					             dataHtml+='</div><div class="opinion_words_content pull-left width30_">';
					             for(var n=0;n<item.msgOpinions.opinions.length;n++){
					            	 if(n==item.msgOpinions.opinions.length-1){
					            		 dataHtml+='<span>'+item.msgOpinions.opinions[n]+'</span>';
					            	 }else{
					            		 dataHtml+='<span>'+item.msgOpinions.opinions[n]+'</span>;';
					            	 } 
					             }
					             dataHtml+='</div></li>';
					             
					         });
							$("#pagination_personal").html(dataHtml);
						}else{
							if(getPersonalCount<=5){
								spinner.spin();
                				getPersonalOpinion();
                			}else{
                				spinner.spin();
                				$("#pagination_personal").html("<li>获取数据失败，请刷新重试</li>");
                				return false;
                			}
						}    
				         
					} else{
						if(getPersonalCount<=5){
							spinner.spin();
            				getPersonalOpinion();
            			}else{
            				spinner.spin();
    						$("#pagination_personal").html("<li>暂无记录</li>");
            				return false;
            			}	
					}
				},
				error:function(){
					
				}
			}) ; 
		};
		
		function getPersonalOpinion(){
			initPersonalOpinion(1);
			 var personalOpinionTimer=setInterval(function(){
			    	if($("#personal_count").val()){
			    		$('#pagination_personal_opinion').pagination({
							totalData:$("#personal_count").val(),
							showData:5,
			        		jump:true,
			        	    coping:true,
			        	    prevContent:'上页',
			        	    nextContent:'下页',
			                callback:personalOpinionCallBack,
			            });
			    		clearInterval(personalOpinionTimer);
			    	}
			    },20);
			 
		};
		function personalOpinionCallBack(api){
			 initPersonalOpinion(api.getCurrent());
			}
	
		window.onload=function(){
			/*  获取通用意见*/
			
				getApplyOpinion();
				
			
			
			/*  获取个性化意见*/
			getPersonalOpinion();
			/* setTimeout(function(){
				getPersonalOpinion();
			},500);
			 */
		};
		$(function(){
			var ltpatoken="${sessionScope.ltpatoken}";
			if(ltpatoken=="null"){
				$(".a_shade").show();
				$(".canDisabled").attr("disabled",true);
			}else{
				$(".a_shade").hide();
				$(".canDisabled").removeAttr("disabled");
			}
		    $(".checkbox_class").each(function () {
		        if ($(this).prop("checked")) {
		            $(this).parent().addClass("on");
		        }
		    });
		    $("#cancle_submit").click(function(){
	   			 $("#confirmModal").modal("hide");
	   			 return false;
   		 	});
			/* 新建通用意见 */
			  $("#createApplyOpinion").click(function(){
		    	$("#createApplyOpinionModal").modal("show"); 
				 $("#createApplyOpinionModal").find("textarea").val("请输入意见内容");
		    });
		    $("#createApplyOpinionFrom").find("textarea").eq(0).focus(function(){
    			$(".applyOpinionError").html("");
    			if($(this).val()=="请输入意见内容"){
    				$(this).val("");
    			}
    		});
		    $("#saveApplyOpinion").click(function(){
		    	if($("#createApplyOpinionFrom").find("textarea").eq(0).val()=="" ||$("#createApplyOpinionFrom").find("textarea").val()=="请输入意见内容"){
		    		$(".applyOpinionError").html("请输入意见内容");
		    		return false;
		    	}else{
		    		$.ajax({
						url:"${pageContext.request.contextPath}/saveOpinionViewType1",
						data:$("#createApplyOpinionFrom").serialize()+"&uid="+$("input[name=uid]").val(),
						type:"post",
						dataType: 'json',
						success:function(response){
							if(response.errcode==0){
								getApplyOpinion();
								 $("#createApplyOpinionModal").modal("hide"); 
								 $("#createApplyOpinionModal").find("textarea").val("请输入意见内容");
							}  else if(response.errcode==-1){
								$(".applyOpinionError").html("添加失败");
							} 
						},
						error:function(){
							$(".applyOpinionError").html("保存失败");
						}
					});
		    	}
		    });
			$("#deleteApplyOpinion").click(function(){
				if($("#apply_opinion_container input[type=checkbox]:checked").length==0){
					cancle_submit("至少选择一项");
		    		 return false;
		    	 }else{
		    		 confirm_submit("是否确认删除");
		    		 $("#confirm_submit").click(function(){
		    			 $("#confirmModal").modal("hide");
		    			 var ids="";
							var tempArr=[];
							$("#pagination_apply").find("input[type=checkbox]:checked").each(function(){
								tempArr.push($(this).val());
							});
							ids=tempArr.join(",");
							$.ajax({
								url:"${pageContext.request.contextPath}/deleOpinionviewType1",
								data:"ids="+ids,
								type:"post",
								dataType: 'json',
								success:function(response){					
									if(response.errcode==0){
										$(".apply_opinion .selectAll_input").prop("checked",false);
										$(".apply_opinion .selectAll_input").parent().removeClass("on");
										getApplyOpinion();
									}else if(response.errcode==-1){
										cancle_handle("删除失败");
									} 
								},
								error:function(){
									cancle_handle("删除失败");
								}
								
								
							}); 
		    		 }); 
		    	 }
				 
			});
			$("#edit_apply_btn").click(function(){
				var length=$("#apply_opinion_container input[type=checkbox]:checked").length;
				if(length==0){
					cancle_submit("至少选择一项");
		    		 return false;
		    	 }else if(length>1){
		    		 cancle_handle("请选择一项修改");
		    		 return false;
		    	 }else{
		    		 var cur=$(".apply_opinion_content input[type=checkbox]:checked");
		    		 var id=cur.val();
		    		 var opinion=cur.closest("li").find(".apply_opinion_list span").html();
		    		 $("#editApplyOpinionFrom input[name=id]").val(id);
		    		 $("#editApplyOpinionFrom textarea").val(opinion);
		    		 $("#editApplyOpinionModal").modal("show");
		    	 }
			});
			$("#editApplyOpinionFrom").find("textarea").eq(0).focus(function(){
    			$(".editapplyOpinionError").html("");
    			if($(this).val()=="请输入意见内容"){
    				$(this).val("");
    			}
    		});
			$("#editApplyOpinion_btn").click(function(){
				if($("#editApplyOpinionFrom").find("textarea").eq(0).val()==""){
		    		$(".editapplyOpinionError").html("请输入意见内容");
		    		return false;
		    	}else{
		    		var spinner = new Spinner(spinOpts);
			    	spinner.spin($("#editApplyOpinionFrom").get(0));
		    		$.ajax({
						url:"${pageContext.request.contextPath}/modifyOpinionViewType1?"+Math.random(),
						data:$("#editApplyOpinionFrom").serialize(),
						type:"post",
						dataType: 'json',
						success:function(response){
							if(response.errcode==0){
								var cur=$(".apply_opinion_content input[type=checkbox]:checked");
					    		 var opinion=$("#editApplyOpinionFrom textarea").val();
				    			 cur.closest("li").find(".apply_opinion_list span").html(opinion);
				    			 spinner.spin();
					    		 $("#editApplyOpinionModal").modal("hide");
								
							}  else if(response.errcode==-1){
								spinner.spin();
								$(".editapplyOpinionError").html("添加失败");
								return;
							} 
						},
						error:function(){
							spinner.spin();
							$(".editapplyOpinionError").html("保存失败");
						}
					});
		    	}
			})
			
			
			/*新建 个性化意见*/
			$("#createPersonalOpinion-btn").click(function(){
				window.location.href="${pageContext.request.contextPath}/addveiw.jsp?uid="+$("input[name=uid]").val();
			});

			$("#deletePersonalOpinion").click(function(){
				if($("#personal_opinion_container input[type=checkbox]:checked").length==0){
					cancle_submit("至少选择一项");
		    		 return false;
		    	 }else{
		    		 confirm_submit("是否确认删除");
		    		 $("#confirm_submit").click(function(){
		    			 $("#confirmModal").modal("hide");
		    			 var ids="";
		 				var tempArr=[];
		 				$("#pagination_personal").find("input[type=checkbox]:checked").each(function(){
		 					tempArr.push($(this).val());
		 				});
		 				ids=tempArr.join(",");
		 				$.ajax({
		 					url:"${pageContext.request.contextPath}/removeOpinionViewType2",
		 					data:"ids="+ids,
		 					type:"post",
		 					dataType: 'json',
		 					success:function(response){
		 						if(response.errcode==0){
		 							$(".personal_opinion .selectAll_input").prop("checked",false);
		 							$(".personal_opinion .selectAll_input").parent().removeClass("on");
		 							getPersonalOpinion();
		 						}else if(response.errcode==-1){
		 							cancle_handle("删除失败");
		 						} 
		 					},
		 					error:function(){
		 						cancle_handle("删除失败");
		 					}
		 					
		 					
		 				});  
		    		 });
		    		 
		    	 }
				
			});
			$("#edit_personal_btn").click(function(){
				var length=$(".personal_opinion_content input[type=checkbox]:checked").length;
				if(length==0){
					cancle_submit("至少选择一项");
		    		 return false;
				}else if(length>1){
					cancle_submit("请选择一项修改");
		    		 return false;
				}else{
					window.location.href=window.location.href="${pageContext.request.contextPath}/modifyPresonalOpinion.jsp?id="+$(".personal_opinion_content input[type=checkbox]:checked").val()+"&"+Math.random();
				}
			})
		    
		    
		    $(".apply_opinion_content").on("click",".checkbox_class" ,function(){
		    	if($(this).prop("checked")){
		    		$(this).parent().addClass("on");
		    		if($(this).closest(".apply_opinion_content").find(".checkbox_class:checked").length==$(this).closest(".apply_opinion_content").find(".checkbox_class").length){
		    			$(".apply_opinion").find(".selectAll_input").prop("checked",true);
		    			$(".apply_opinion").find(".selectAll_input").parent().addClass("on");
		    		}
		    	}else{
		    		$(this).parent().removeClass("on");
		    		$(".apply_opinion").find(".selectAll_input").prop("checked",false);
	    			$(".apply_opinion").find(".selectAll_input").parent().removeClass("on");
		    	}
		    	
		    });
		    $(".personal_opinion_content").on("click",".checkbox_class" ,function(){
		    	if($(this).prop("checked")){
		    		$(this).parent().addClass("on");
		    		if($(this).closest(".personal_opinion_content").find(".checkbox_class:checked").length==$(this).closest(".personal_opinion_content").find(".checkbox_class").length){
		    			$(".personal_opinion").find(".selectAll_input").prop("checked",true);
		    			$(".personal_opinion").find(".selectAll_input").parent().addClass("on");
		    		}
		    	}else{
		    		$(this).parent().removeClass("on");
		    		$(".personal_opinion").find(".selectAll_input").prop("checked",false);
	    			$(".personal_opinion").find(".selectAll_input").parent().removeClass("on");
		    	}
		    	
		    });
		    
		    
		})
	 
 
</script>

<body>

<!--内容-->
<div id="content">
	<div class="height856 opinion_tab">
		 <div class="navbar">
             <ul class="nav">
                 <li class="active"><a href="#rightTab1" data-toggle="tab"  id="go_apply_opinion">通用设置</a></li>
                 <li class="noBorder"><a href="#rightTab2" data-toggle="tab" id="go_personal_opinion">个性化设置</a></li>
             </ul>
          </div>
          <div class="tab-content">
              <div class="tab-pane active fade in apply_opinion"  id="rightTab1">
	              <div class="content-header">
		              	<div class="btn_container noMargin">
	                       	<a data-toggle="modal" class="create-btn" id="createApplyOpinion"><span>新建</span></a>
	                    </div>
	                    <div class="btn_container">
	                       	<a id="deleteApplyOpinion" class="delete-btn"><span>删除</span></a>
	                       	<div class="a_shade"></div>
	                    </div>
	                    <div class="btn_container">
	                       	<a href="javascript:;"  class="edit-btn" id="edit_apply_btn"><span>修改</span></a>
	                    </div>
	                    
                  </div>
                  <div class="opinion_header">
                  		<div class="select_all pull-left">
                            <div class="checkbox_group">
	                            <span class="checkbox_wraper">
	                            	<input type="checkbox" class="checkbox_class selectAll_input" onclick='selectAll("#pagination_apply",this)'/>
	                            </span>
	                            <span>全选</span>
                            </div>       
                        </div>
                        <div  class="opinion_content pull-left">
                  			<span>意见内容</span>
                  		</div>
                  </div>
                  <div id="apply_opinion_container">
                  	<ul  class="apply_opinion_content" id="pagination_apply">
						
                  	</ul>
                  </div>
                  
                  <div id="pagination_apply_opinion" class="page"></div>
                  
              </div>
              <div class="tab-pane fade in personal_opinion" id="rightTab2">
              		<div class="content-header">
              			<div class="btn_container noMargin">
	                    	<a href="javascript:;"  class="create-btn" id="createPersonalOpinion-btn"><span>新建</span></a>
	                    </div>	  
	                    <div class="btn_container">
	                    <a href="javascript:;"  id="deletePersonalOpinion" class="delete-btn"><span>删除</span></a>
	                       	<div class="a_shade"></div>
	                    </div>	 
	                    <div class="btn_container">
	                    	<a href="javascript:;"  class="edit-btn" id="edit_personal_btn"><span>修改</span></a>
	                    </div>	                   	                    
                	</div>
               		<div class="opinion_header">
                  		<div class="select_all   pull-left">
                            <div class="checkbox_group">
	                            <span class=checkbox_wraper>
	                            	<input type="checkbox" class="checkbox_class selectAll_input" onclick='selectAll("#pagination_personal",this)'/>
	                            </span>
	                            <span>全选</span>
                            </div>       
                        </div>
                        <div  class="file_type pull-left">
                  			<span>文件类型</span>
                  		</div>
                  		<div  class="opinion_words pull-left">
                  			<span>处理常用意见词</span>
                  		</div>
                  	</div>
                  	<div id="personal_opinion_container">
                  		<ul class="personal_opinion_content" id="pagination_personal">
	                  		
                  		</ul>
                  	</div>
                  	
                  	<div id="pagination_personal_opinion" class="page"></div>
              </div>
          </div>
	</div>
	<form>
		<input type="hidden" name="uid" value="${sessionScope.userid}"/>
		<input type="hidden" id="apply_count" value=""/>
		<input type="hidden" id="personal_count" value=""/>
	</form>
</div>

<div id="createApplyOpinionModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
        <input type="button" class="close" data-dismiss="modal" aria-hidden="true" value="×"/>
        <h3>新建常用意见</h3>
    </div>
    <div class="modal-body">
        <form method="post" enctype="multipart/form-data" id="createApplyOpinionFrom">
            <div class="input_container">
                <textarea name="opinion">请输入意见内容</textarea>
            </div>
            <div class="applyOpinionError">
            </div>
        </form>
    </div>
    <div class="modal-footer">
        <input class="btn btn-primary save canDisabled" type="button" value="保存退出" id="saveApplyOpinion"/>
        <input class="btn cancle" type="button" data-dismiss="modal" aria-hidden="true" value="取消"/>
    </div>
</div>
<div id="confirmModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
        <input type="button" class="close" data-dismiss="modal" aria-hidden="true" value="×">
        <h3 id="myModalLabel">提示信息</h3>
    </div>
    <div class="modal-body">
        <div id="information">
        </div>
    </div>
    <div class="modal-footer">
        <input class="btn btn-primary save" type="button" value="确定" id="confirm_submit" />
        <input class="btn cancle" type="button" value="取消" id="cancle_submit" data-dismiss="modal" aria-hidden="true"/>
    </div>
</div>
<div id="editApplyOpinionModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
        <input type="button" class="close" data-dismiss="modal" aria-hidden="true" value="×"/>
        <h3>修改常用意见</h3>
    </div>
    <div class="modal-body">
        <form method="post" enctype="multipart/form-data" id="editApplyOpinionFrom">
            <div class="input_container">
            	<input type="hidden" name="id" value="">
                <textarea name="opinion"></textarea>
            </div>
            <div class="editapplyOpinionError">
            </div>
        </form>
    </div>
    <div class="modal-footer">
        <input class="btn btn-primary save canDisabled" type="button" value="保存退出" id="editApplyOpinion_btn"/>
        <input class="btn cancle" type="button" data-dismiss="modal" aria-hidden="true" value="取消"/>
    </div>
</div>
</body>
</html>


