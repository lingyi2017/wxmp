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
		<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
		<script type="text/javascript">
		
		function onBridgeReady(){
			   WeixinJSBridge.invoke(
			       'getBrandWCPayRequest', {
			           "appId":"${payInfo.appid}",     //公众号名称，由商户传入     
			           "timeStamp":"${timeStamp}",         //时间戳，自1970年以来的秒数     
			           "nonceStr":"${payInfo.nonceStr}", //随机串     
			           "package":"prepay_id=${payInfo.prepayId}",     
			           "signType":"MD5",         //微信签名方式：     
			           "paySign":"${payInfo.sign}" //微信签名 
			       },
			       function(res){
			    	   alert(res.err_msg);
			    	// 使用以下方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回    ok，但并不保证它绝对可靠。 
			    		if(res.err_msg == "get_brand_wcpay_request:ok") {
			        	   alert("支付成功");
			        	   window.location.href = "${pageContext.request.contextPath}/wx/ordertest_4?orderId=${orderId}";
			           }else if(res.err_msg == "get_brand_wcpay_request:fail"){
			       			alert('支付失败');
			       		}else if(res.err_msg == "get_brand_wcpay_request:cancel"){
			       			alert('支付取消');
			       		}else{
			       			alert(res.err_msg);
			       		}
			       }
			   ); 
			}
		
		
		</script>	
	    <title>订单-支付</title>
	</head>
<body>
	<script type="text/javascript">
	
		$(document).ready(function () {
			if (typeof window.WeixinJSBridge == "undefined")
			{
			    $(document).on('WeixinJSBridgeReady', function()
			    {
			    	onBridgeReady();
			    });
			}
			else
			{
				onBridgeReady();
			}
			
	    });
		
	</script>
</body>
</html>
