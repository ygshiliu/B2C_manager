<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.7.2.js"></script>
<script type="text/javascript">
	

		function select_attr(attr_id,flag){
			
		 	 if(flag){
				$("#sku_attr_inner_"+attr_id).show();
			}else{
				$("#sku_attr_inner_"+attr_id).hide();
			}  
			
		} 
</script>
</head>
<body>
 	<c:forEach items="${attr_list }" var="attr" varStatus="index">
		 &nbsp;<input type="checkbox" name="sku_attr_list[${index.index }].shxm_id" value="${attr.id }" onclick="select_attr(${attr.id },this.checked)"/>"${attr.shxm_mch }" &nbsp;
	</c:forEach> 
	<hr>
	<c:forEach items="${attr_list }" var="attr" varStatus="index">
		<div id="sku_attr_inner_${attr.id }" style="display:none">
		<c:forEach items="${attr.list_value }" var="attr_value">
			&nbsp;<input type="radio"name="sku_attr_list[${index.index }].shxzh_id" value="${attr_value.id }"/> ${attr_value.shxzh }${attr_value.shxzh_mch }&nbsp;
		</c:forEach>
		</div>
	</c:forEach> 
	<hr>
	库存名称：<input type="text" name="sku_mch"><br>
	库存价格：<input type="text" name="jg"><br>
	库存数量：<input type="text" name="kc"><br>
	库存地址：<input type="text" name="kcdz"><br>
	<br>
	<input type="submit" value="添加 入库">
</body>
</html>