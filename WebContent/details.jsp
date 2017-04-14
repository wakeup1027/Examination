<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String num = null;
if(request.getParameter("num")==null){
	num ="0";
}else{
	num = new String(request.getParameter("num").getBytes("ISO-8859-1"),"UTF-8");
}	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>内容详情</title>
	<script src="<%=basePath%>script/jquery-1.8.3.min.js"></script>
</head>
<body>
<script>
var num = "<%=num%>";
$(function(){
	$.ajax({
		type: "POST",
        data:{},
        dataType: 'json',
        url: "<%=basePath%>Examination/list.action",
        success: function (data) {
        	var dataStr = data.obj;
        	dataStr = JSON.parse(dataStr);
        	var dataJson = dataStr.data;
        	console.log(dataJson);
        	var findIt = false;
        	for(var i=0; i<dataJson.length; i++){
        		if((dataJson[i].url).indexOf(num)>0){
        			$("#TextTitle").text(dataJson[i].title);
        			$("#creanPerson").text("创建者："+dataJson[i].pendingName);
        			$("#creanTime").text("创建时间："+dataJson[i].receiveTime);
        			$("#creanType").text("类型："+dataJson[i].examinaType);
        			$("#textContent").text(dataJson[i].contentText);
        			$("#passType").text("审核状态："+dataJson[i].passType);
        			findIt = true;
        		}
        	}
        	if(findIt==false){
        		alert("没有查找到对应的审批");
        	}
        },error:function(){
            	
        }
	});
});
</script>
<div id="TextTitle" style="text-align:center; font-size: 25px;">中国人民共和国成立了，从此人民翻身做主，做土地的主人！举国欢庆</div>
<div style="text-align:center; font-size:12px; color: #888;">
	<label id="creanPerson">创建者：XXX</label>
	<label id="creanTime" style="margin-left:10px;">创建时间：2017-04-13 16:10:31</label>
	<label id="creanType" style="margin-left:10px;">类型：行政审批</label>
</div>
<div id="textContent" style="text-indent:2em; margin-top:15px;">开始的放假水电费老吉安市福利及水电费了人垃圾撒的浪费控件拉水电费老吉安市地方阿萨德飞看来就撒旦法阿萨德路附近撒了点附近拉我去诶如撒的发奖金了科学城付了款删掉了付款就啥都发了就玩儿拉萨的积分开始的放假水电费老吉安市福利及水电费了人垃圾撒的浪费控件拉水电费老吉安市地方阿萨德飞看来就撒旦法阿萨德路附近撒了点附近拉我去诶如撒的发奖金了科学城付了款删掉了付款就啥都发了就玩儿拉萨的积分开始的放假水电费老吉安市福利及水电费了人垃圾撒的浪费控件拉水电费老吉安市地方阿萨德飞看来就撒旦法阿萨德路附近撒了点附近拉我去诶如撒的发奖金了科学城付了款删掉了付款就啥都发了就玩儿拉萨的积分</div>
<div id="passType" style="text-align:right; margin-top:15px; font-size: 14px;">审核状态：不通过</div>
</body>
</html>