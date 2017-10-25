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
		
	})
	var count = 0;
	function upload_spu_img_click(index){
		$("#file_"+index).click();
		
		if(index == count){
			count++;
		}
	}
	
	function upload_spu_input_change(index){
		var file = $("#file_"+index)[0];
		var url = window.URL.createObjectURL(file.files[0]);
		$(file).next("img").attr("src",url);
		
		if(index >= (count-1)){
			var str = "";
			str += '<span >';
			str += '	<input style="display:none" type="file" name="files"  id="file_'+count+'" onchange="upload_spu_input_change('+count+')">';
			str += '	<img onclick="upload_spu_img_click('+ count +')" style="width=80px;height:80px;" alt="" src="">';
			str += '</span>';
			
			$("img:last").before(str);
		}
	}
	

</script>
</head>
<body>

	<div class="easyui-layout" style="height:700px;">
		<div data-options="region:'center',border:false" style="padding-left:20px">
			spu信息管理页面<br>
			${msg}<br>
			
			<form action="${pageContext.request.contextPath }/save_spu.do" method="post" enctype="multipart/form-data">
			<select id="spu_class_1_select" name="flbh1"></select>
			<select id="spu_class_2_select" name="flbh2"></select>
			<select id="spu_tm_select" name="pp_id"></select>
			<hr>
			商品名称：<input type="text" name="shp_mch"><br>
			商品描述：<input type="text" name="shp_msh"><br>
			<hr>
			商品图片：<br>
			<span >
				<input style="display:none" type="file" name="files"  id="file_0" onchange="upload_spu_input_change(0)">
				<img style="width=80px;height:80px;" alt="" src="" onclick="upload_spu_img_click(0)">
			</span>
			
			<img style="width=80px;height:80px;"  src="${pageContext.request.contextPath }/img/upload_hover.png"  onclick="upload_spu_img_click(count)">
			<br><br>
			<input type="submit" value="提交">
			</form>
			
		
		</div>
	</div>

	
</body>
</html>
