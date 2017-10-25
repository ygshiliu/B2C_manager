<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
	var attr_index = 1;
	function add_attr(){
		
		var table = "";
		table+='<br>';
		table+='<input type="hidden" name="attr_list['+attr_index+'].flbh2" value="${flbh2_id }"/>';
		table+='<table  border="1" cellpadding="5" cellspacing="0" id="attr_list_'+attr_index+'">';
		table+='<tr>';
		table+='	<td>属性名：<input type="text" name="attr_list['+ attr_index +'].shxm_mch"></td>';
		table+='	<td><a href="javascritp:;" onclick="add_attr_value('+attr_index+')">增加属性值</a></td>';
		table+='</tr>';
		table+='<tr>';
		table+='	<td>属性值：<input type="text" name="attr_list['+attr_index+'].list_value[0].shxzh"></td>';
		table+='	<td>单位：<input type="text" name="attr_list['+attr_index+'].list_value[0].shxzh_mch"></td>';
		table+='</tr>';
		table+='</table>';
		table+='<br>';
		$("table:last").after(table);
		attr_index++;
		
		return false;
	}
	function add_attr_value(index){
		var tr_len = $("#attr_list_"+index+" tr").length-1;
		
		var tr="";
		tr+='<tr>';
		tr+='	<td>属性值：<input type="text" name="attr_list['+ index +'].list_value['+tr_len+'].shxzh"></td>';
		tr+='	<td>单位：<input type="text" name="attr_list['+ index +'].list_value['+tr_len+'].shxzh_mch"></td>';
		tr+='</tr>';
		
		$("#attr_list_"+index).append(tr);
		
		return false;
	}
</script>
</head>
<body>
	<form action="${pageContext.request.contextPath }/add_attr.do" method="post">
		<h1>《${flbh2_name }》分类属性添加页面：</h1>
		<a href="javascritp:;" onclick="add_attr()">增加属性</a><br>
		<input type="hidden" name="attr_list[0].flbh2" value="${flbh2_id }"/>
		<table id="attr_list_0" border="1" cellpadding="5" cellspacing="0">
			<tr>
				<td>属性名：<input type="text" name="attr_list[0].shxm_mch"></td>
				<td><a href="javascritp:;" onclick="add_attr_value(0)">增加属性值</a></td>
			</tr>
			<tr>
				<td>属性值：<input type="text" name="attr_list[0].list_value[0].shxzh"></td>
				<td>单位：<input type="text" name="attr_list[0].list_value[0].shxzh_mch"></td>
			</tr>
			
		</table>
		
		<input type="submit" value="添加属性">
	</form>
</body>
</html>