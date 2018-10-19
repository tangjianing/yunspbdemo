var spinOpts = {
        lines: 10, 
        length: 5, 
        width: 5, 
        radius: 10, 
        corners: 1, 
        rotate: 0, 
        direction: 1, 
        color: '#333', 
        speed: 1, 
        trail: 60, 
        shadow: false, 
        hwaccel: false, 
        className: 'spinner', 
        zIndex: 2e9, 
        top: '50%', 
        left: '50%'
    };
	var spinner = new Spinner(spinOpts);
	function confirm_submit(text){
		$("#information").html(text);
		$("#confirmModal").modal("show");
	}
	function cancle_submit(text){
		confirm_submit(text);
		 $("#confirm_submit").click(function(){
			 $("#confirmModal").modal("hide");
			 return false;
		 });
	}
	
	/* 预览图片 */
	function onPreviewLoad(sender){
	autoSizePreview( sender, sender.offsetWidth, sender.offsetHeight );
}
	function checkFileExt(ext)
    {
        if (!ext.match(/.jpg|.gif|.png/i)) {
            return false;
        }
        return true;
    }

    function getObjectURL(file) {
		var url = null ;
		if (window.createObjectURL!=undefined) {
		    	url = window.createObjectURL(file) ;
		    } else if (window.URL!=undefined) {
		    	url = window.URL.createObjectURL(file) ;
		    } else if (window.webkitURL!=undefined){
			url = window.webkitURL.createObjectURL(file) ;
			}
			return url ;
	  }

	function autoSizePreview( objPre, originalWidth, originalHeight ){
		var zoomParam = clacImgZoomParam( 176, 176, originalWidth, originalHeight );
		objPre.style.width = zoomParam.width + 'px';
		objPre.style.height = zoomParam.height + 'px';
		objPre.style.marginTop = zoomParam.top + 'px';
		objPre.style.marginLeft = zoomParam.left + 'px';
	}

	function clacImgZoomParam( maxWidth, maxHeight, width, height ){
		var param = { width:width, height:height, top:0, left:0 };
		
		if( width>maxWidth || height>maxHeight ){
			rateWidth = width / maxWidth;
			rateHeight = height / maxHeight;
			
			if( rateWidth > rateHeight ){
				param.width =  maxWidth;
				param.height = height / rateWidth;
			}else{
				param.width = width / rateHeight;
				param.height = maxHeight;
			}
		}
		
		param.left = (maxWidth - param.width) / 2;
		param.top = (maxHeight - param.height) / 2;
		
		return param;
	}
	function tree(jsonStr,type,selector){
		
        var str="";
        for(var i=0;i<jsonStr.length;i++){
            var cur=jsonStr[i];
            str+="<li class='root_li'>";
            if(type=="onlyChecked"){
                if(cur.children){
                    var children=cur.children;
                    str += "<span class='roots_switch'></span>";
                    if(cur.isvalid=="Y"){
                        str += "<span class='checkbox_wrapper on'><input type='checkbox' disabled='disabled' value='"+cur.id+"' checked='checked' class='roots_check checkbox_class'/></span>"+"<a title='" + cur.name + "'>" + cur.name + "</a>";
                    }
                    str+="<div class='level_container'>";
                    str+="<span class='bottom_switch'></span>";
                    str+="<ul class='lastLevel'>";
                    for(var j=0;j<children.length;j++){
                        if(children[j].isvalid=="Y"){
                            str+="<li>";
                            str += "<span class='checkbox_wrapper on'><input type='checkbox' disabled='disabled' value='"+children[j].id+"' checked='checked' class='bottom_check checkbox_class'/></span>"+"<a title='" + children[j].name + "'>" + children[j].name + "</a>";
                            str+="</li>";
                        }

                    }
                    str+="</ul></div>";
                }else{

                    str += "<span class='roots_docu'></span>";
                    cur.isvalid=="Y"?
                            str += "<span class='checkbox_wrapper on'><input type='checkbox' value='"+cur.id+"' checked='checked' class='roots_check checkbox_class'/></span>"+"<a title='" + cur.name + "'>" + cur.name + "</a>":
                            str += "<span class='checkbox_wrapper'><input type='checkbox' value='"+cur.id+"'class='roots_check checkbox_class'/></span>"+"<a  title='" + cur.name + "'>" + cur.name + "</a>";
                }
            }else if(type=="all"){
                if(cur.children){
                    var children=cur.children;
                    str += "<span class='roots_switch'></span>";
                    jsonStr[i].isvalid=="Y"?
                            str += "<span class='checkbox_wrapper on'><input type='checkbox' value='"+cur.id+"' checked='checked' class='roots_check checkbox_class'/></span>"+"<a title='" + cur.name + "'>" + cur.name + "</a>":
                            str += "<span class='checkbox_wrapper'><input type='checkbox' value='"+cur.id+"' class='roots_check checkbox_class'/></span>"+"<a title='" + cur.name + "'>" + cur.name + "</a>";
                    str+="<div class='level_container'>";
                    str+="<span class='bottom_switch'></span>";
                    str+="<ul class='lastLevel'>";
                    for(var j=0;j<children.length;j++){
                        str+="<li>";
                        children[j].isvalid=="Y"?
                                str += "<span class='checkbox_wrapper on'><input type='checkbox' value='"+children[j].id+"' checked='checked' class='bottom_check checkbox_class'/></span>"+"<a title='" + children[j].name + "'>" + children[j].name + "</a>":
                                str += "<span class='checkbox_wrapper'><input type='checkbox' value='"+children[j].id+"' class='bottom_check checkbox_class'/></span>"+"<a title='" + children[j].name + "'>" + children[j].name + "</a>";
                        str+="</li>";
                    }
                    str+="</ul>";


                }else{
                    str += "<span class='roots_docu'></span>";
                    jsonStr[i].isvalid=="Y"?
                            str += "<span class='checkbox_wrapper on'><input type='checkbox' value='"+cur.id+"' checked='checked' class='roots_check checkbox_class'/></span>"+"<a title='" + cur.name + "'>" + cur.name + "</a>":
                            str += "<span class='checkbox_wrapper'><input type='checkbox' value='"+cur.id+"' class='roots_check checkbox_class'/></span>"+"<a title='" + cur.name + "'>" + cur.name + "</a>";
                }
            }
            str+="</li>";
        }
        $(selector).html(str);
        $(selector).on("click",function(e){
            var cur_obj=$(e.target);
            if(cur_obj.hasClass("roots_switch")){
                if(cur_obj.hasClass("close")){
                    cur_obj.removeClass("close");
                    cur_obj.next().next().next().animate({"height":cur_obj.get(0).flag},500);
                }else{
                    if(!cur_obj.get(0).flag){
                        cur_obj.get(0).flag=cur_obj.next().next().next().height();
                    }
                    cur_obj.addClass("close");
                    cur_obj.next().next().next().animate({"height":0},500);
                }
            }else if(cur_obj.hasClass("roots_check")){
                if(cur_obj.prop("checked")){
                    cur_obj.parent().addClass("on");
                    cur_obj.parent().next().next().find("input[type=checkbox]").each(function(){
                        $(this).prop("checked",true).parent().addClass("on");
                    })
                }else{
                    cur_obj.parent().removeClass("on");
                    cur_obj.parent().next().next().find("input[type=checkbox]").each(function(){
                        $(this).prop("checked",false).parent().removeClass("on");
                    })
                }
            }else if(cur_obj.hasClass("bottom_check")){
                if(cur_obj.prop("checked")){
                    cur_obj.parent().addClass("on");
                    cur_obj.closest(".root_li").find("input.roots_check").eq(0).prop("checked",true).parent().addClass("on");
                }else{
                    cur_obj.parent().removeClass("on");
                    var closest=cur_obj.closest(".level_container");
                    var checkCount=closest.find("input[type=checkbox]:checked").length;
                    if(checkCount==0){
                        cur_obj.closest(".root_li").find("input.roots_check").eq(0).prop("checked",false).parent().removeClass("on");
                    }
                }
            }
        })

    }
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
		function getUrlArgObject(){  
		    var args=new Object();  
		    var query=location.search.substring(1);//获取查询串  
		    var pairs=query.split(",");//在逗号处断开  
		    for(var i=0;i<pairs.length;i++){  
		        var pos=pairs[i].indexOf('=');//查找name=value  
		        if(pos==-1){//如果没有找到就跳过  
		            continue;  
		        }  
		        var argname=pairs[i].substring(0,pos);//提取name  
		        var value=pairs[i].substring(pos+1);//提取value  
		        args[argname]=unescape(value);//存为属性  
		    }  
		    return args;//返回对象  
		}  ;
		/*隐藏编辑区*/
		function cancle_edit(selector,_this){
			$(_this).closest(selector).find(".box_hide").hide();
			$(_this).closest(selector).find(".box_show").show();
		}
		function getSplitString(str) {
	        var arr = str.split(",");
	        var resources = "";
	        for (var i = 0; i < arr.length; i++) {
	            var arr1 = arr[i].split(/\s+/);

	            for (var j = 0; j < arr1.length; j++) {
	                if (jQuery.trim(arr1[j]) != "") {
	                    resources += jQuery.trim(arr1[j]) + ",";
	                }
	            }
	        }

	        return resources;
	    }
		
		
		
		
		String.prototype.trim = function() {
			  return this.replace(/^\/s\/s*/, '').replace(/\/s\/s*$/, '');
			};