<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>${flbh2_name }的属性列表：</h1><br>
		<c:if test="${!empty attrList }">
			 	<c:forEach items="${attrList }" var="attr">
					"${attr.shxm_mch }" 属性：
					<c:forEach items="${attr.list_value }" var="attr_value" varStatus="index">
						${attr_value.shxzh }${attr_value.shxzh_mch }&nbsp;&nbsp;&nbsp;
					</c:forEach>
					<br>
				</c:forEach> 
		</c:if>

	<hr>
	<a href="javascript:index_add_tabs('${pageContext.request.contextPath }/to_add_attr_value.htm?flbh2_id=${flbh2_id}&flbh2_name=${flbh2_name}','添加分类属性');">添加属性</a>
</body>
</html>