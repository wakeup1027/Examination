<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="<%=basePath%>script/jquery-1.8.3.min.js"></script>
<style>
	ul{list-style-type:none;padding:0px;margin:0px;}
	.ContentText{border:1px solid #cccccc; border-bottom:none;fong-size:15px;color:#666;font-family:"Microsoft YaHei";}
	.ContentText li{border-bottom:1px solid #cccccc; line-height:40px; padding-left:10px; padding-right:10px;}
	.titleClass{float:left;}
	.creanTimeClass{float:right;}
	
	.pageBox{margin:0px auto;overflow: hidden;width:350px; font-size:13px; color:#333;}
	.pageBox div{float:left; margin-left:15px; cursor:pointer;}
</style>

</head>
<script>

var cuntPage = 1; //总共多少页
var currPage = 1; //当前页
var dataNum = 10;  //一页拥有多少条数据
var dataBox = ""; //临时存放数据的变量

//存放json数据的变量
var rows = {"obj":{}};

$(function(){
	
	$.ajax({
		type: "POST",
        data:{},
        dataType: 'json',
        url: "<%=basePath%>Examination/list.action",
        success: function (data) {
        	var dataStr = data.obj;
        	dataStr = JSON.parse(dataStr);
        	//console.log(dataStr);
        	var dataJson = dataStr.data;
        	dataBox = dataJson;
        	for(var i=0; i<dataNum; i++){
        		var li = '<li><div class="titleClass"><a href="'+dataJson[i].url+'">'+dataJson[i].title+'</a></div><div class="creanTimeClass">'+dataJson[i].receiveTime+'</div><div style="clear:both;"></div></li>';
        		$(".ContentText").append(li);
        	}
        	
        	cuntPage = Math.ceil(dataJson.length/dataNum);  //计算总共多少页
        	$("#currpage").text(currPage);
        	$("#coutPage").text(cuntPage);
        	
        	//格式化自定义的json数据
        	var data = [];
        	for(var i=0 ; i<dataJson.length; i++){
        		data.push(jsonDataFormat(dataJson[i].title, dataJson[i].receiveTime, dataJson[i].pendingName, dataJson[i].url));
        	}
        	rows["obj"]["count"] = dataStr.count;
			rows["obj"]["pageUrl"] = dataStr.pageUrl;
			rows["obj"]["data"] = data;
			rows["obj"]["systemCnName"] = dataStr.systemCnName;
			rows["obj"]["systemEnName"] = dataStr.systemEnName;
			console.log(rows);  //最后得出自定义格式
			console.log(JSON.stringify(rows)); //json字符串
        },error:function(){
            	
        }
	});
});

//格式化json数据	 
function jsonDataFormat(title, receiveTime, pendingName, url){
	var jsonStr = {};
	jsonStr.title = title;
	jsonStr.receiveTime = receiveTime;
	jsonStr.pendingName = pendingName;
	jsonStr.url = url;
	return jsonStr;
}

function pageFunc(n){
	//点击下一页的情况
	if(n=="nextPage"){
		//console.log(dataBox);
		var currNum = $("#currpage").text(); //获取当前页
		var countNum = $("#coutPage").text(); //获取总页数
		if(currNum<countNum){ //这是当前页小于总页的情况
			if(parseInt(countNum)-parseInt(currNum)==1){
				$(".ContentText").html("");
				for(var i=currNum*dataNum; i<dataBox.length; i++){
					var li = '<li><div class="titleClass"><a href="'+dataBox[i].url+'">'+dataBox[i].title+'</a></div><div class="creanTimeClass">'+dataBox[i].receiveTime+'</div><div style="clear:both;"></div></li>';
	        		$(".ContentText").append(li);
				}
				$("#currpage").text(parseInt(currNum)+1);
			}else{
				$(".ContentText").html("");
				for(var i=currNum*dataNum; i<(parseInt(currNum)+1)*dataNum; i++){
					var li = '<li><div class="titleClass"><a href="'+dataBox[i].url+'">'+dataBox[i].title+'</a></div><div class="creanTimeClass">'+dataBox[i].receiveTime+'</div><div style="clear:both;"></div></li>';
	        		$(".ContentText").append(li);
				}
				$("#currpage").text(parseInt(currNum)+1);
			}
		}else{
			alert("已经是最后一页了");
		}
	}
	
	//点击上一页的情况
	if(n=="prevPage"){
		var currNum = $("#currpage").text(); //获取当前页
		var countNum = $("#coutPage").text(); //获取总页数
		if(currNum>1){
			$(".ContentText").html("");
			for(var i=(parseInt(currNum)-2)*dataNum; i<(parseInt(currNum)-1)*dataNum; i++){
				var li = '<li><div class="titleClass"><a href="'+dataBox[i].url+'">'+dataBox[i].title+'</a></div><div class="creanTimeClass">'+dataBox[i].receiveTime+'</div><div style="clear:both;"></div></li>';
        		$(".ContentText").append(li);
			}
			$("#currpage").text(parseInt(currNum)-1);
		}else{
			alert("已经是第一页了");
		}
	}
	
	//点击首页的情况
	if(n=="firstNum"){
		$(".ContentText").html("");
		for(var i=0; i<dataNum; i++){
			var li = '<li><div class="titleClass"><a href="'+dataBox[i].url+'">'+dataBox[i].title+'</a></div><div class="creanTimeClass">'+dataBox[i].receiveTime+'</div><div style="clear:both;"></div></li>';
    		$(".ContentText").append(li);
		}
		$("#currpage").text(1);
	}
	
	//点击末页的情况
	if(n=="lastNum"){
		var countNum = $("#coutPage").text();
		$(".ContentText").html("");
		for(var i=(parseInt(countNum)-1)*dataNum; i<dataBox.length; i++){
			var li = '<li><div class="titleClass"><a href="'+dataBox[i].url+'">'+dataBox[i].title+'</a></div><div class="creanTimeClass">'+dataBox[i].receiveTime+'</div><div style="clear:both;"></div></li>';
    		$(".ContentText").append(li);
		}
		$("#currpage").text(countNum);
	}
}
</script>
<body>
	<ul class="ContentText"></ul>
	<div style="overflow: hidden; margin-top:20px;">
		<div class="pageBox">
			<div id="firstNum" onclick="pageFunc('firstNum')">首页</div>
			<div id="prevPage" onclick="pageFunc('prevPage')">上一页</div>
			<div id="nextPage" onclick="pageFunc('nextPage')">下一页</div>
			<div id="lastNum" onclick="pageFunc('lastNum')">末页</div>
			<div style="margin-left:40px;">
				<span>第</span>
				<span id="currpage"></span>
				<span>/</span>
				<span id="coutPage"></span>
				<span>页</span>
			</div>
			<div style="clear:both;"></div>
		</div>
	</div>
</body>
</html>