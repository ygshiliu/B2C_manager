<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
	$(function(){
		$.getJSON("${pageContext.request.contextPath }/js/json/class_1.js",function(data){
			$.each(data,function(i,item){
				$("#spu_class_1_select").append("<option value='"+item.id+"'>"+item.flmch1+"</option>");
			})
		})
		
		$("#spu_class_1_select").change(function(){
			$("#spu_class_2_select").empty();
			$.getJSON("${pageContext.request.contextPath }/js/json/class_2_"+this.value+".js",function(data){
				$.each(data,function(i,item){
					$("#spu_class_2_select").append("<option value='"+item.id+"'>"+item.flmch2+"</option>");
				})
			})
			
			$("#spu_tm_select").empty();
			$.getJSON("${pageContext.request.contextPath }/js/json/tm_class_1_"+this.value+".js",function(data){
				$.each(data,function(i,item){
					$("#spu_tm_select").append("<option value='"+item.id+"'>"+item.ppmch+"</option>");
				})
			})
		})
		
		$("#spu_tm_select").change(function(){
			var pp_id = this.value;
			var flbh1 = $("#spu_class_1_select").val();
			var flbh2 = $("#spu_class_2_select").val();
			$.getJSON("${pageContext.request.contextPath}/get_sku_by_tm.do",{pp_id:pp_id,flbh1:flbh1,flbh2:flbh2},function(data){
				$(data).each(function(i,item){
					$("#sku_spu_select").append("<option value='"+item.id+"'>"+item.shp_mch+"</option>");
				})
			})
		})
		
		$("#spu_class_2_select").change(function(){
			var flbh2 = this.value;
			$.post("${pageContext.request.contextPath}/get_sku_attr_by_class_2.do",{flbh2:flbh2},function(data){
				$("#sku_attr_list_inner").html(data);
			})
		})
		
	})

</script>
</head>
<body>
	<form action="${pageContext.request.contextPath }/save_sku.do" method="post">
	<select id="spu_class_1_select" name="flbh1"></select><br>
	<select id="spu_class_2_select" name="flbh2"></select><br>
	<select id="spu_tm_select" name="pp_id"></select><br>
	<select id="sku_spu_select" name="shp_id"></select><br>
	<hr>
	<dir id="sku_attr_list_inner"></dir>
	</form>
</body>
</html>