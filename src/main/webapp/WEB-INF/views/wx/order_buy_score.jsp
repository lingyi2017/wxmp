<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>个人中心</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	<link rel="stylesheet" href="https://cdn.bootcss.com/weui/1.1.2/style/weui.min.css">
	<link rel="stylesheet" href="https://cdn.bootcss.com/jquery-weui/1.2.0/css/jquery-weui.min.css">
	<link rel="stylesheet" href="${ctx}/static/css/weixin/style.css">
		<style>
			select option {
				background-color: white;color: black;
			}
		</style>
	</head>
	<body style="height: 100%;font-family:'é»ä½';background-color: #F5F5F5;">
		<!-- ä¸ -->
		<div class="weui-cells" style="margin-top: -0.7%;margin-bottom: -5px;">
			 <div class="weui-cell">
			   <div class="weui-cell__bd" style="text-align:center;height: 40px;">
			     <div style="float: left;position: absolute;left: 3%;top: 15%;">â</div>
				 <div style="float: left;position: absolute;left: 40%;top: 35%;text-align: center;font-size: large;">ç§¯åè´­ä¹°</div>
			   </div>
			 </div>			
			 <div class="weui-cell" style="width: 100%;height: 70px;">
			 	<div style="float: left;color: orange;">â&nbsp;è¯·å¡«åæ¶è´§å°å</div>
			 	<div style="float: right;margin-left: 45%;color: darkgray;font-size: x-large;">&gt;</div>
			 </div>
		</div>
		
		<!-- äº -->
		<div class="weui-cells" style="" >
			<div class="weui-cell" style="height: 100px;width: 100%;">
				<div style="float: left;height: 100%;width:30%;background-color: orange;">
					<img style="height: 100%;width:100%;" src="https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=611116088,4106962857&fm=27&gp=0.jpg" />
				</div>
				<div style="float: left;margin-left: 5%;width: 70%;">
					<div style="position: absolute;top: 5px;width: 55%;">çèé¢çèé¢çèé¢çèé¢çèé¢çèé¢çèé¢çèé¢</div>
					<div style="position: absolute;bottom: 5px;width: 100%;">
						<p style="float: left;">
							<div style="float: left;color: orange;">ç§¯å&nbsp;</div>
							<div style="float: left;font-size: larger;margin-top: -1%;color: orange;">182</div>
							<div style="float: left;margin-left: 30%;">
								<div style="float: left;">x&nbsp;</div>
								<div style="float: left;">1</div>
							</div>
						</p>
					</div>
				</div>
			</div>
			<div class="weui-cell">
				<div style="float: left;">è´­ä¹°åé</div>
				<div style="float: left;margin-left: 50%;">
					<select style="width: 80px;">
						<option>å¤§ä»½</option>
						<option>ä¸­ä»½</option>
						<option>å°ä»½</option>
					</select>
					<!--
					<div onclick="minus()" style="float: left;height: 25px;width: 25px;background-color: lightgray;text-align: center;">-</div>
					<input id="payNum" type="text" style="float: left;width: 40px;height: 25px;text-align: center;" readonly="readonly" value="1" />
					<div onclick="add()" style="float: left;height: 25px;width: 25px;background-color: lightgray;text-align: center;">+</div>
					 -->
				</div>
			</div>
			<div class="weui-cell">
				<div style="float: left;">è´­ä¹°æ¹å¼</div>
				<div style="float: left;margin-left: 35%;font-size: smaller;">
					<label><input type="radio" value="1" name="buyType" style="color: orange;" checked="checked"/>ææè´­ä¹°</label>
					<label><input type="radio" value="2" name="buyType" style="color: orange;"/>ææè´­ä¹°</label>
				</div>
			</div>
			<div class="weui-cell">
				<div style="float: left;">
					è®¢è´­æ¥æ&nbsp;
					<p style="color: darkgray;font-size: smaller;float: left;margin-left: 35%;margin-top: -9%;">è¯·éæ©ä½ è¦è®¢è´­çæ¥æ</p></div>
					<div style="float: left;font-size: larger;color: darkgray;margin-left: 30%;">&gt;</div>
			</div>
			<div class="weui-cell">
				<div style="float: left;">å¤æ³¨çè¨</div>
				<div style="float: left;margin-left: 5%;">
					<input type="text" style="font-size: small;width: 220px;" maxlength="17" placeholder="æä»ä¹ç¹æ®è¦æ±ï¼æ¨å¯ä»¥å¨è¿éå¡«å"/>
				</div>
			</div>
			<div class="weui-cell" style="padding-left: 30%;">
				<p>å±<div>1</div>ä»¶åå</p>
				<p style="padding-left: 5%;">å°è®¡ï¼</p>
				<p style="font-size: small;color: orange;">ç§¯å&nbsp; <div style="font-size: larger;color: orange;">182</div></p>
			</div>
		</div>
		
		<!-- ä¸ -->
		<div style="position: absolute;bottom: 0px;width: 100%;height: 60px;background-color: orange;">
			<div style="width: 60%;float: left;background-color: white;height: 100%;padding-top: 10px;">
				<p style="float: left;font-size: x-large;margin-left: 10%;">æ»é¢</p>
				<p style="float: left;padding-left: 10%;padding-top: 10px;color: orange;">
					ç§¯å&nbsp;
					<div style="font-size: x-large;font-weight: bold;color: orange;">182</div>
				</p>
			</div>
			<div style="width: 40%;float: left;height: 100%;text-align: center;color: white;padding-top: 4%;font-size: larger;" onclick="alert(1)">æäº¤è®¢å</div>
		</div>
<script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/jquery-weui.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/weixin/fastclick.js"></script>
		<script>
			function minus(){
				if($("#payNum").val()>1){
					$("#payNum").val(parseInt(($("#payNum").val())-1));
				}
			}
			
			function add(){
				if($("#payNum").val()<99){
					$("#payNum").val((parseInt($("#payNum").val())+1));
				}
			}
		</script>
	</body>
</html>