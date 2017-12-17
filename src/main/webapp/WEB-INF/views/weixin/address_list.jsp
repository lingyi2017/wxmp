<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>收货地址修改</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="stylesheet" href="https://cdn.bootcss.com/weui/1.1.2/style/weui.min.css">
	<link rel="stylesheet" href="https://cdn.bootcss.com/jquery-weui/1.2.0/css/jquery-weui.min.css">
	<link rel="stylesheet" href="${ctx}/static/css/weixin/style.css">
</head>
<body ontouchstart>
<!--主体-->
<header class="wy-header">
  <div class="wy-header-icon-back"><span></span></div>
  <div class="wy-header-title">地址管理</div>
</header>
<div class="weui-content">
  <div class="weui-panel address-box">
	  	<c:forEach  items="${addressList }" var="entity">
	  		<div class="weui-panel__bd">
		      <div class="weui-media-box weui-media-box_text address-list-box">
		        <a href="${ctx}/dcxt/accountaddress/addressEditByWeiXin?id=${entity.id} " class="address-edit"></a>
		        <h4 class="weui-media-box__title"><span>${entity.person }</span>   <span>${entity.phone }</span></h4>
		        <p class="weui-media-box__desc address-txt">${entity.address }</p>
		        
		        <c:if test="${entity.isDefault == 1 }">
		        	<span class="default-address-checkbox"><input type="radio" name="is_default" value="${entity.isDefault }" checked="checked" onchange="change_default_address('${entity.id}','${entity.account.id }')" style="width: 25px;height: 15px"></span>
		        	<span class="default-address">默认地址</span>
		        </c:if>
		        <c:if test="${entity.isDefault == 0 }">
		        	<span class="default-address-checkbox"><input type="radio" name="is_default" value="${entity.isDefault }" onchange="change_default_address('${entity.id}','${entity.account.id }')" style="width: 25px;height: 15px"></span>
		        	<span class="default-address-checkbox">设为默认</span>
		        </c:if>
		        </div>
		      </div>
		    
	  	</c:forEach>
   </div>
    
    
 </div>
  <div class="weui-btn-area">
  	<input type="hidden" name="accountId" value="${accountId }"/>
    <a class="weui-btn weui-btn_primary" href="${ctx}/dcxt/accountaddress/addressAddByWeiXin?accountId=${accountId }" id="showTooltips">添加收货地址</a>
  </div>


<script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/jquery-weui.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/weixin/city-picker.js"></script>
<script type="text/javascript" src="${ctx}/static/js/weixin/fastclick.js"></script>
<script>
  $(function() {
    FastClick.attach(document.body);
  });
  
  function change_default_address(address_id,account_id){
	  console.info(address_id);console.info(account_id);
	  $.ajax({
          type:"POST",
          async:false,
          url:"${pageContext.request.contextPath}/dcxt/accountaddress/addressDefaultByWeiXin",
          data:{
          	addressId : address_id,
          	accountId : account_id
          },
          datatype: "json",//"xml", "html", "script", "json", "jsonp", "text".
          beforeSend:function(){
	            	
	        },
          success:function(data){
          	if(data){
          		$.toptip("修改成功",3000,"success");
          		history.go(0);
          		//window.location.href = "${pageContext.request.contextPath}/dcxt/accountaddress/addressListByWeiXin?openId=123";
          	}
          },
          error: function(){
              //请求出错处理
          	$.toptip("修改失败");
          }         
       });
  };
</script>
</body>
</html>
