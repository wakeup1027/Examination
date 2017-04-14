<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>获取json数据接口测试</title>
	<script src="<%=basePath%>script/jquery-1.8.3.min.js"></script>
</head>
<body>
<script>
	$(function(){
		$.get("<%=basePath%>Examination/getJsonData.action", function(result){
		    console.log(result);
		  });		
	});
</script>
</body>
</html>