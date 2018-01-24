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
			    	<div style="float: left;position: absolute;left: 3%;top: 33%;font-size: larger;">
			    		<a href="javascript:history.go(-1)"><img style="width: 30px;height: 30px;" src="${ctx }/static/images/wx/icon-back.png"></a>
			    	</div>
					<div style="float: left;position: absolute;left: 40%;top: 35%;text-align: center;font-size: large;">
					<c:if test="${empty address }">添加地址</c:if>
					<c:if test="${!empty address }">修改地址</c:if>
					</div>
			   		<div style="float: left;position: absolute;left: 85%;top: 35%;"></div>
			   </div>
			 </div>
			 <div class="weui-cell" style="width: 100%;">
				<div style="float: left;width: 20%;">收货人</div>
				<div style="float: left;margin-left: 15%;">
					<input type="text" style="width: 90%;text-align: right;" maxlength="10" id="person" value="${address.person }" />
				</div>
			</div>
			<div class="weui-cell" style="width: 100%;">
				<div class="weui-cell__hd">联系电话</div>
				<div class="weui-cell__bd">
					<input style="width: 90%;text-align: right;" type="number" pattern="[0-9]*" placeholder="请输入手机号码" id="phone" value="${address.phone }" />
				</div>
			</div>
			<div class="weui-cell">
		      <div class="weui-cell__hd"><label for="name" class="weui-label wy-lab">所在区域</label></div>
		      <div class="weui-cell__bd"><input class="weui-input" id="address" type="text" value="四川省 成都市 温江区" style="width: 90%;text-align: right;" readonly="true"/></div>
		    </div>
			<div class="weui-cell" style="width: 100%;">
				<div class="weui-cell__hd">详细地址</div>
				<div class="weui-cell__bd">
					<input type="text" id="address_detail" style="width: 90%;text-align: right;font-size: smaller;" value="${address.address }"  />
				</div>
			</div>
			<!-- <div class="weui-cell weui-cell_switch">
		      <div class="weui-cell__bd">设为默认地址</div>
		      <div class="weui-cell__ft">
		      	<input class="weui-switch" type="checkbox" name="is_default" /> 
		      </div>
		    </div> -->
		</div>
		
		<div class="weui-cell" style="position:absolute;bottom: 10px;height: 30px;width: 100%;margin-left: -4%;">
			<div class="weui-cell__bd">
				<a href="javascript:save_address()" class="weui-btn weui-btn_primary" style="background-color: orange;">保存</a>
			</div>
		</div>
				
		<script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
		<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/jquery-weui.min.js"></script>
		<script type="text/javascript" src="${ctx}/static/js/weixin/fastclick.js"></script>
		<script type="text/javascript" src="${ctx}/static/js/weixin/city-picker-now.js"></script>
		<script>
  $(function() {
    //FastClick.attach(document.body);
    /* if("${address.isDefault}" == 1){
    	$("[name = is_default]:checkbox").attr("checked", true);
    } */
    if("${address.id}"){
    	$("#address").val("${address.provence } ${address.city } ${address.county }");
    }
  });
</script>
<script>
      $("#address").cityPicker({
        title: "选择区域",
        onChange: function (picker, values, displayValues) {
          console.log(values, displayValues);
        }
      });
      
      
      function save_address(){
    	var accountId = "${accountId}";
   	  	var person = $("#person").val();
   	  	var phone = $("#phone").val();
   	  	var address = $("#address").val();
   	  	var address_detail = $("#address_detail").val();
   	  	var is_default = 0;
	   	$('input[name="is_default"]:checked').each(function(){    
	   		is_default = 1; 
	   	});
	   	if(!phone){
 			$.toptip("联系电话不能为空");
 		   return;
   	  	}
	   	var reg2 = /^1[3|4|5|7|8|9][0-9]\d{4,8}$/;
	   	if (!reg2.test(phone)) {
            $.toptip('请输入正确的电话号码');
            return;
        }
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
            url:"${ctx}/dcxt/accountaddress/wx_save",
            data:{
            	id : "${address.id}",
            	person : person,
            	phone : phone,
            	provence : provence,
            	city : city,
            	county : county,
            	address : address_detail,
            	isDefault : is_default
            },
            datatype: "json",//"xml", "html", "script", "json", "jsonp", "text".
            beforeSend:function(){
	            
	        },
            success:function(data){
            	if(data){
            		$.toptip("修改成功",3000,"success");
            		window.location.href = "${ctx}/dcxt/accountaddress/wx_address_list";
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