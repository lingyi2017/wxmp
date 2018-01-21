<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
		<title>地址编辑</title>
		<link rel="stylesheet" href="https://cdn.bootcss.com/weui/1.1.2/style/weui.min.css">
		<link rel="stylesheet" href="https://cdn.bootcss.com/jquery-weui/1.2.0/css/jquery-weui.min.css">
		<link rel="stylesheet" href="${ctx}/static/css/weixin/style.css">
		<style>
			.nearStyle {
				height: 18px;
				width: 18px;
				background-color: orange;
				float: left;
				margin-top: 0.5%;
			}
			.nonearStyle {
				height: 16px;
				width: 16px;
				background-color: white;
				float: left;
				border: 1px solid black;
				margin-top: 0.5%;
			}
			
			.radioStyle {
				border-radius：90%;
				-moz-border-radius: 90%;      
				-webkit-border-radius: 90%;
				height: 10px;
				width: 10px;
				border: 1px solid gray;
				text-align: center;
				font-size: small;
				color:white;
			}
			
			.radioActive {
				border: 1px solid orange;
				color: orange;
			}
		</style>
	</head> 
	<body style="height: 100%;font-family:'黑体';background-color: #F5F5F5;width: 100%;">
		<div class="weui-cells" style="margin-top: -0.7%;margin-bottom: -5px;">
			 <div class="weui-cell">
			   <div class="weui-cell__bd" style="text-align:center;height: 40px;">
			    	<div style="float: left;position: absolute;left: 3%;top: 33%;font-size: larger;">←</div>
					<div style="float: left;position: absolute;left: 40%;top: 35%;text-align: center;font-size: large;">地址编辑</div>
			   		<div style="float: left;position: absolute;left: 85%;top: 35%;">删除</div>
			   </div>
			 </div>
			 <div class="weui-cell" style="width: 100%;">
				<div style="float: left;width: 20%;">收货人</div>
				<div style="float: left;margin-left: 15%;">
					<input type="text" style="width: 90%;text-align: right;" maxlength="10" value="你好啊" />
				</div>
			</div>
			<div class="weui-cell" style="width: 100%;">
				<div style="float: left;width: 20%;">称谓</div>
				<div style="float: left;margin-left: 48%;">
					<label onclick="changeGender(0)">
						<label class="radioStyle" id="label1">●</label>&nbsp;男
					</label>
					<label onclick="changeGender(1)">
						<label class="radioStyle" id="label2">●</label>&nbsp;女
					</label>
					<input style="display: none;" type="radio" name="gender" value="1" />
					<input style="display: none;" type="radio" name="gender" value="2" />
				</div>
			</div>
			<div class="weui-cell" style="width: 100%;">
				<div style="float: left;width: 20%;">联系电话</div>
				<div style="float: left;margin-left: 15%;">
					<input type="text" style="width: 90%;text-align: right;" maxlength="10" value="13568956231" />
				</div>
			</div>
			<div class="weui-cell" style="width: 100%;" id="address">
				<div style="float: left;width: 20%;">所在区域</div>
				<div style="float: left;margin-left: 15%;">
					<input type="text" style="width: 90%;text-align: right;" maxlength="12" value="你好啊" readonly="readonly" />
				</div>
				<div style="float: left;">&gt;</div>
			</div>
			<div class="weui-cell" style="width: 100%;">
				<div style="float: left;width: 20%;">详细地址</div>
				<div style="float: left;margin-left: 24%;">
					<input type="text" style="width: 90%;text-align: right;font-size: smaller;" value="你好啊" />
				</div>
			</div>
			<div class="weui-cell" style="width: 100%;">
				<div id="near" class="nearStyle" onclick="near()">
					<label style="color: white;position: absolute;top: 11px;left: 17px;">✔</label>
				</div>
				<div style="float: left;font-size: large;">&nbsp;是否默认</div>
				<input id="nearCheck" type="checkbox" checked="checked" style="display: none;" />
			</div>
		</div>
		
		<div class="weui-cells" style="position: absolute;bottom: 0px;width: 100%; text-align: center;color:white;font-family: '宋体';font-size: large;background-color: orange;">
			<div class="weui-cell">
				<div class="weui-cell__bd">
					保存
				</div>
			</div>
		</div>
				
		<script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
		<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/jquery-weui.min.js"></script>
		<script type="text/javascript" src="${ctx}/static/js/weixin/fastclick.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/weixin/city-picker-now.js"></script>
		<script>
		      $("#address").cityPicker({
		        title: "选择区域",
		        onChange: function (picker, values, displayValues) {
		          console.log(values, displayValues);
		        }
		      });
		      
				
			function near(){
				if($("#near").prop("class")==("nearStyle")){
					$("#near").removeClass("nearStyle");
					$("#near").addClass("nonearStyle");
					$("#nearCheck").attr("checked",false);
				}else{
					$("#near").removeClass("nonearStyle");
					$("#near").addClass("nearStyle");
					$("#nearCheck").attr("checked",true);
				}
			}
			
			function changeGender(num){
				if(num==0){
					$("#label1").addClass("radioActive");
					$("#label2").removeClass("radioActive");
				}else{
					$("#label2").addClass("radioActive");
					$("#label1").removeClass("radioActive");
				}
				$("input[name='gender']").get(num).checked=true;
			}
		</script>
	</body>
</html>