<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>收货地址修改</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	<link rel="stylesheet" href="https://cdn.bootcss.com/weui/1.1.2/style/weui.min.css">
	<link rel="stylesheet" href="https://cdn.bootcss.com/jquery-weui/1.2.0/css/jquery-weui.min.css">
	<link rel="stylesheet" href="${ctx}/static/css/weixin/style.css">
	<style type="text/css">
		.topShow {
			background-color: skyblue;
			margin: 0 auto;
			min-height: 110px;
			width: 100%;
			bottom: 0px;
			position: absolute;
			border-top-left-radius：120%;
			-moz-border-top-left-radius: 120%;      
			-webkit-border-top-left-radius: 120%;
			border-top-right-radius：120%;
			-moz-border-top-right-radius: 120%;      
			-webkit-border-top-right-radius: 120%;
		}
		
		.touxiangStyle {
			border-radius: 50%;      
			-moz-border-radius: 50%;      
			-webkit-border-radius: 50%;
			height: 100px;
			width: 100px;
			z-index: 20;
			float: right;
			margin-right: 35%;
			margin-top: -10%;
		}
	</style>
</head>
<body ontouchstart style="height: 100%;background-color: #F5F5F5;font-family:'黑体';">
<!--主体-->
	<div class="weui-cells" style="min-height: 220px;margin-top: -1%;width: 100%;background-color: orange;position: relative;">
		<div class="weui-cell">
			   <div class="weui-cell__bd" style="text-align:center;">
			     <p>
			  		<div style="margin-left:-66%;float:left;"><img src="${pageContext.request.contextPath}/static/images/wx/back.png" style="width:4%;height:4%;"></img></div>   
			     </p>
			   </div>
			 </div>
		
		<div class="topShow">
			<div><img class="touxiangStyle" src="${pageContext.request.contextPath}/static/images/wx/touxiang.jpg"/></div>
			<div style="margin-top: 17.5%;text-align: center;">昵称</div>
		</div>
	</div>
	
	<div class="weui-cells" style="height: 65%;">
		<a href="${ctx}/dcxt/order/list">
			<div class="weui-cell">
				<div class="weui-cell__bd"><img style="width: 30px;height: 30px;" src="${ctx }/static/images/wx/center-eatfood.png"></div>
				<div class="weui-cell__bd">
					<div style="float: left;margin-left: -75%;">订单查询</div>
					<div style="float: right;color: graytext;">></div>
				</div>
			</div>
		</a>
		<a href="${ctx}/dcxt/order/list">
			<div class="weui-cell">
				<div class="weui-cell__bd"><img style="width: 30px;height: 30px;" src="${ctx }/static/images/wx/center-eatfood.png"></div>
				<div class="weui-cell__bd">
					<div style="float: left;margin-left: -75%;">积分查询</div>
					<div style="float: right;color: graytext;">></div>
				</div>
			</div>
		</a>
		<a href="${ctx}/dcxt/order/list">
			<div class="weui-cell">
				<div class="weui-cell__bd"><img style="width: 30px;height: 30px;" src="${ctx }/static/images/wx/center-eatfood.png"></div>
				<div class="weui-cell__bd">
					<div style="float: left;margin-left: -75%;">用餐查询</div>
					<div style="float: right;color: graytext;">></div>
				</div>
			</div>
		</a>
		<a href="${ctx}/dcxt/order/list">
			<div class="weui-cell">
				<div class="weui-cell__bd"><img style="width: 30px;height: 30px;" src="${ctx }/static/images/wx/center-eatfood.png"></div>
				<div class="weui-cell__bd">
					<div style="float: left;margin-left: -75%;">收货地址</div>
					<div style="float: right;color: graytext;">></div>
				</div>
			</div>
		</a>
		<a href="${ctx}/dcxt/order/list">
			<div class="weui-cell">
				<div class="weui-cell__bd"><img style="width: 30px;height: 30px;" src="${ctx }/static/images/wx/center-eatfood.png"></div>
				<div class="weui-cell__bd">
					<div style="float: left;margin-left: -75%;">个人信息</div>
					<div style="float: right;color: graytext;">></div>
				</div>
			</div>
		</a>
		<a href="${ctx}/dcxt/order/list">
			<div class="weui-cell">
				<div class="weui-cell__bd"><img style="width: 30px;height: 30px;" src="${ctx }/static/images/wx/center-eatfood.png"></div>
				<div class="weui-cell__bd">
					<div style="float: left;margin-left: -75%;">经销商管理</div>
					<div style="float: right;color: graytext;">></div>
				</div>
			</div>
		</a>
	</div>
<script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/jquery-weui.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/weixin/city-picker.js"></script>
<script type="text/javascript" src="${ctx}/static/js/weixin/fastclick.js"></script>
<script>

</script>

</body>
</html>
