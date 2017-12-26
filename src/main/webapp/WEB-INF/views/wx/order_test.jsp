<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/jquery.mobile/jquery.mobile-1.4.0.min.css" />
   
</head>
<body>

<div data-role="page">
  <div data-role="header" data-theme="e">
  <h1>业务付款</h1>
  </div>

  <div data-role="content">
    <form method="post">
      <div data-role="fieldcontain">
        <label for="paymoney">支付金额：</label>
        <input type="text" name="paymoney" id="paymoney" placeholder="请输入支付金额..">       
        <a data-role="button" href="javascript:doWeixinPay()" data-theme="e">提交</a>
      </div>
    </form>
  </div>
</div>

     <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery/jquery-1.9.1.min.js"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery.mobile/jquery.mobile-1.4.0.min.js"></script>
     <script>
		$(document).ready(function(){
			
		});
     </script>
	 <script type="text/javascript">
	    function doWeixinPay(){
	    	var pay=$("#paymoney").val();
	    	if(pay == null || pay == ""){
	    		alert("请输入支付金额！");
	    		return;
	    	}else{
	    		window.location.href="${pageContext.request.contextPath}/wx/page/ordertest_2?totalFee"+pay;
	    	}
	    }
	 </script>

</body>
</html>
