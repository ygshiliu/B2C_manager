<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript">
	$(function(){
		var url = "${pageContext.request.contextPath }${url}";
		var title = "${title}";
		if(url!="" && title!=""){
			index_add_tabs(url,title);
		}
	})
 	function index_add_tabs(url,title){
		$.post(url,function(data){
			var flag = $('#tt').tabs('exists',title);
			if(!flag){
				$('#tt').tabs('add',{    
				    title:title, 
				    content:data,
				    closable:true
				});  
			}else{
				$('#tt').tabs('select',title);
			}
		})
	}
 	
 	
 	/* function index_add_tabs(url,title){
		var flag = $('#tt').tabs('exists',title);
		if(!flag){
			$('#tt').tabs('add',{    
			    title:title,    
			    closable:true,  
			    href:url
			});  
		}else{
			$('#tt').tabs('select',title);
		}
		
	}  */

</script>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',title:'North Title',split:true" style="height:100px;"></div>   
    <div data-options="region:'west',title:'West',split:true,width:200" 
    style="width:100px;padding-top:10px;font-size:17px">
    	<ul  class="easyui-tree">   
    		<li>   
	        	<span>系统管理</span>
	        	<ul>
	        		<li><a style="text-decoration:none;" href="javascript:index_add_tabs('${pageContext.request.contextPath }/goto_spu.htm','spu商品信息');">SPU信息</a></li>	
	        		<li><a style="text-decoration:none;" href="javascript:index_add_tabs('${pageContext.request.contextPath }/goto_attr.htm','分类属性信息');">分类属性</a></li>	
	        		<li><a style="text-decoration:none;" href="javascript:index_add_tabs('${pageContext.request.contextPath }/goto_sku.htm','SKU库存信息');">SKU库存信息</a></li>	
	        		<li>
						<span>接口</span>
	        			<ul>
	        				<li>仓库管理</li>
	        				<li>物流管理</li>
	        				<li>测试管理</li>
	        			</ul>
					</li>	
	        		
	        	</ul>
        	</li>
    		<li>   
	        	<span>缓存管理</span>
	        	<ul>
	        		<li>商品缓存</li>	
	        		<li>用户缓存</li>	
	        	</ul>
        	</li>
        </ul>   
    	
    </div>   
    <div data-options="region:'center',title:'center title',iconCls:'icon-ok'" style="padding:5px;background:#eee;">
    	
    	<div id="tt" class="easyui-tabs">  
    	 
	    </div>   
    </div>   
</body>
</html>