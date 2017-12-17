<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>收货地址修改</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="stylesheet" href="https://cdn.bootcss.com/weui/1.1.2/style/weui.min.css">
	<link rel="stylesheet" href="https://cdn.bootcss.com/jquery-weui/1.2.0/css/jquery-weui.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/weixin/style.css">
</head>
<body ontouchstart>
<!--修改收货地址-->
<header class="wy-header">
  <div class="wy-header-icon-back"><span></span></div>
  <div class="wy-header-title">修改收货地址</div>
</header>
<div class="weui-content">
  <div class="weui-cells weui-cells_form wy-address-edit">
    <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label wy-lab">收货人</label></div>
      <div class="weui-cell__bd"><input class="weui-input" type="text" placeholder="" id="person" value="${address.person }"></div>
    </div>
    <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label wy-lab">收货电话</label></div>
      <div class="weui-cell__bd"><input class="weui-input" type="number" pattern="[0-9]*" placeholder="" id="phone" value="${address.phone }"></div>
    </div>
    <div class="weui-cell">
      <div class="weui-cell__hd"><label for="name" class="weui-label wy-lab">所在地区</label></div>
      <div class="weui-cell__bd"><input class="weui-input" id="address" value="${address.provence } ${address.city } ${address.county }" type="text" readonly="true"></div>
    </div>
    <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label wy-lab">详细地址</label></div>
      <div class="weui-cell__bd">
        <textarea class="weui-textarea" placeholder="" id="address_detail">${address.address }</textarea>
      </div>
    </div>
  </div> 
  <div class="weui-btn-area">
    <a class="weui-btn weui-btn_primary" href="javascript:saveAddress()" id="showTooltips">保存此地址</a>
    <a class="weui-btn weui-btn_warn" href="javascript:delAddress()">删除此地址</a>
  </div>

</div>

<script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/jquery-weui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/weixin/city-picker-now.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/weixin/fastclick.js"></script>
<script>
  $(function() {
    FastClick.attach(document.body);
  });
  function saveAddress(){
  	var id = "${address.id}";
  	var person = $("#person").val();
  	var phone = $("#phone").val();
  	var address = $("#address").val();
  	var address_detail = $("#address_detail").val();
  	if(!address){
		$.toptip("地区不能为空");
   		return;
  	}
  	if(!address_detail){
		$.toptip("详细地址不能为空");
		return;
	}
	address = address.split(" ");
  	var provence = address[0];
  	var city = address[1];
  	var county = address[2];
   	$.ajax({
        type:"POST",
        async:false,
        url:"${pageContext.request.contextPath}/dcxt/accountaddress/addressSaveByWeiXin",
        data:{
        	id : id,
        	person : person,
        	phone : phone,
        	provence : provence,
        	city : city,
        	county : county,
        	address : address_detail
        },
        datatype: "json",//"xml", "html", "script", "json", "jsonp", "text".
        beforeSend:function(){
           	
       },
        success:function(data){
        	if(data){
        		$.toptip("修改成功",3000,"success");
        		window.location.href = "${pageContext.request.contextPath}/dcxt/accountaddress/addressListByWeiXin?accountId=${address.account.id}";
        	}
        },
        error: function(){
            //请求出错处理
        	$.toptip("修改失败");
        }         
     });
    }
    
    function delAddress(){
    	var id = "${address.id}";
  	  $.ajax({
            type:"POST",
            async:false,
            url:"${pageContext.request.contextPath}/dcxt/accountaddress/addressDelByWeiXin",
            data:{
            	addressId : id
            },
            datatype: "json",//"xml", "html", "script", "json", "jsonp", "text".
            beforeSend:function(){
	            	
	        },
            success:function(data){
            	if(data){
            		$.toptip("修改成功",3000,"success");
            		window.location.href = "${pageContext.request.contextPath}/dcxt/accountaddress/addressListByWeiXin?accountId=${address.account.id}";
            	}
            },
            error: function(){
                //请求出错处理
            	$.toptip("修改失败");
            }         
         });
    }
</script>
<script>
      $("#address").cityPicker({
        title: "选择区域",
        onChange: function (picker, values, displayValues) {
          console.log(values, displayValues);
        }
      });
      
</script>
</body>
</html>
