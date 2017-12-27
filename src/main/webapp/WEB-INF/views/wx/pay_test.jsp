<%@ page contentType="text/html; charset=UTF-8"%>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
System.out.println("进入了支付页面");
%>
<!DOCTYPE html>
<html>
	<head>
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.1.0.js"></script>
		
	    <title>订单-支付</title>
	</head>
<body>
	<script type="text/javascript">
	
		$(document).ready(function () {
			wx.config({
		        debug: true, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
		        appId: "${payInfo.appId}", // 必填，公众号的唯一标识
		        timestamp: "${payInfo.timeStamp}", // 必填，生成签名的时间戳
		        nonceStr: "${payInfo.nonceStr}", // 必填，生成签名的随机串
		        signature: "${payInfo.paySign}", // 必填，签名，见附录1
		        jsApiList: ['chooseWXPay'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
		    });

		    wx.ready(function () {
		        wx.chooseWXPay({
		            appId: "${payInfo.appId}",
		            timestamp: "${payInfo.timeStamp}",
		            nonceStr: "${payInfo.nonceStr}",
		            package: "${payInfo.packageValue}",
		            signType: 'MD5',
		            paySign: "${payInfo.paySign}",
		            success: function (res) {
		            	if (res.errMsg == "chooseWXPay:ok") {  
                            //支付成功  
                            alert('支付成功');  
                        } else {  
                            alert(res.errMsg);  
                        } 
			        	//window.location.href = "${pageContext.request.contextPath}/wx/ordertest_4?orderId=${orderId}";
		            },
		            cancel: function (e) {
		            	alert('取消了支付'); 
		            },
		            error: function (e) {
		            	alert('请重新支付'); 
		            }
		        });
		    });
			
	    });
		
	</script>
</body>
</html>
