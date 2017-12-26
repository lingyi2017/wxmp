<%@ page contentType="text/html; charset=UTF-8"%>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
System.out.println("in jsapi.jsp");
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
		        debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
		        appId: "${payInfo.appid}", // 必填，公众号的唯一标识
		        timestamp: "${timeStamp}", // 必填，生成签名的时间戳
		        nonceStr: "${payInfo.nonceStr}", // 必填，生成签名的随机串
		        signature: "${payInfo.sign}", // 必填，签名，见附录1
		        jsApiList: ['chooseWXPay'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
		    });

		    wx.ready(function () {
		    	alert("prepay_id=${payInfo.prepayId}");
		    	alert("${payInfo.sign}");
		        wx.chooseWXPay({
		            appId: "${payInfo.appid}",
		            timestamp: "${timeStamp}",
		            nonceStr: "${payInfo.nonceStr}",
		            package: "prepay_id=${payInfo.prepayId}",
		            signType: 'MD5',
		            paySign: "${payInfo.sign}",
		            success: function (res) {
		            	alert(res);
		            	if (res.errMsg == "chooseWXPay:ok") {  
                            //支付成功  
                            alert('支付成功');  
                        } else {  
                            alert(res.errMsg);  
                        } 
			        	//window.location.href = "${pageContext.request.contextPath}/wx/ordertest_4?orderId=${orderId}";
		            },
		            cancel: function (e) {
		            	alert(e);
		            },
		            error: function (e) {
		            	alert(e);
		            }
		        });
		    });
			
	    });
		
	</script>
</body>
</html>
