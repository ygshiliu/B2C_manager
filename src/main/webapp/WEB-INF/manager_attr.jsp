<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
	$(function(){
		
		$('#spu_class_1_select').combobox({    
		    url:'${pageContext.request.contextPath }/js/json/class_1.js',    
		    valueField:'id',    
		    textField:'flmch1',
		    width:200,
		    value:"请选择",
		    onSelect:function(){
				$("#spu_class_2_select").empty();
				var val = $('#spu_class_1_select').combobox('getValue');
				
				$("#spu_class_2_select").combobox({    
				    url:'${pageContext.request.contextPath }/js/json/class_2_'+val+'.js',    
				    valueField:'id',    
				    textField:'flmch2',
				    width:200,
				    value:"请选择",
				    onSelect:function(){
						$("#attr_inner").empty();
						var flbh2_id = $('#spu_class_2_select').combobox('getValue');
						var flbh2_name =$('#spu_class_2_select').combobox('getText');
						
						$('#attr_inner').datagrid({    
						    url:'${pageContext.request.contextPath }/attr_class_2_select2.do', 
						    queryParams:{flbh2_id:flbh2_id,flbh2_name:flbh2_name},
						    columns:[[    
						        {field:'shxm_mch',title:'属性名',width:100},    
						        {field:'shfqy',title:'是否启用',width:100},    
						        {field:'shxm_mch',title:'属性名',width:100},    
						        {field:'chjshj',title:'创建时间',width:300,
						        	formatter:function(value,row,index){
						        		//value当前列值
						        		//row本行所有数据对象
						        		//index索引;
						        		alert("------")
						        		var date = new Date(value);
						        		var time = date.toDateString();
						        		return time;
						        }},    
						        {field:'list_value',title:'属性值',width:300,
						        	formatter:function(value,row,index){
						        		var val="";
						        		$(value).each(function (i,json){
						        			val+=" "+json.shxzh+json.shxzh_mch;
						        		});
						        		return val;
						        }},    
						    ]]    
						});  
				    }
				})
				
		    }
		});
		
		
	})
	
	

</script>
</head>
<body >
	分类属性信息列表页面<br>
	${msg}<br>
	
	<select  class="easyui-combobox" id="spu_class_1_select" name="flbh1"></select>
	<select  class="easyui-combobox" id="spu_class_2_select" name="flbh2">
		<option>请选择</option>
	</select>
	<hr>
	<div id="attr_inner" class="easyui-datagrid"></div>
	
	
</body>
</html>