<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html class="pixel-ratio-1">
<head>
    <title>企明星</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

    <link href="https://cdn.bootcss.com/weui/1.1.2/style/weui.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/jquery-weui/1.2.0/css/jquery-weui.min.css" rel="stylesheet">

    <style type="text/css">

        body {
            font-size: 14px;
            line-height: 1;
            overflow-x: hidden;
            max-width: 640px;
            margin: 0 auto;
            color: #333;
            background-color: #f5f5fa;
            -webkit-overflow-scrolling: touch;
            -webkit-touch-callout: none;
        }

        .header {
            background-color: #3475eb;
            height: 50px;
            line-height: 35px;
            top: 0px;
            width: 100%;
        }

        .header h3 {
            color: white;
            margin-left: 40%;
        }

    </style>
</head>
<body>

<div class="weui-search-bar header" id="searchBar">
    <h3>${basicService.name }</h3>
</div>
<div class="weui-form-preview">
    <div class="weui-form-preview__hd">
        <label class="weui-form-preview__label">价格</label>
        <span class="weui-form-preview__value">¥${basicService.price }</span>
    </div>
    <div class="weui-form-preview__bd">
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">服务类型</label>
            <span class="weui-form-preview__value">${basicService.name}</span>
        </div>
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">服务介绍</label>
            <span class="weui-form-preview__value" id="span_desciption">
            </span>
        </div>
    </div>
    <div class="weui-form-preview__ft ">
        <a class="weui-form-preview__btn weui-form-preview__btn_default open-popup" style="color: #3475eb;"
           href="javascript:" data-target="#half" >我要咨询</a>
        <c:if test="${basicService.isBuy == false}">
        	<button type="submit" id="buy_button" class="weui-form-preview__btn weui-form-preview__btn_primary"
                style="background-color: #AAAAAA; color: white;" disabled="disabled">暂不支持购买
        	</button>
        </c:if>
        
        <c:if test="${basicService.isBuy == true}">
        	<button type="submit" id="buy_button" class="weui-form-preview__btn weui-form-preview__btn_primary"
                style="background-color: #3475eb; color: white;"
                onclick="javascript:window.location.href = '${pageContext.request.contextPath}/qyfw/order/wx_serivce_buy?openid=${openid}&serviceId=${basicService.id}'">我要购买
        	</button>
        </c:if>
        
    </div>
</div>

<div id="half" class='weui-popup__container popup-bottom'>
    <div class="weui-popup__overlay"></div>
    <div class="weui-popup__modal">
        <div class="toolbar">
            <div class="toolbar-inner">
                <a href="javascript:;" class="picker-button close-popup" style="color: #3475eb;">关闭</a>
                <h1 class="title">服务咨询</h1>
            </div>
        </div>
        <div class="modal-content">
            <div class="weui-cells weui-cells_form">
            	<input type="hidden" id="openid" value="${openid }">
            	<div class="weui-cells__title">客户性质</div>
					<div class="weui-cells weui-cells_radio">
						<c:if test="${basicService.customerType == '1'}">
							<label class="weui-cell weui-check__label" for="x11">
							    <div class="weui-cell__bd">
							      <label class="weui-form-preview__label" style="font-size: 17px">企业</label>
							    </div>
							    <div class="weui-cell__ft">
							      <input type="radio" class="weui-check" name="customerType" value="1" id="x11" checked="checked">
							      <span class="weui-icon-checked"></span>
							    </div>
							  </label>
						</c:if>
					  	<c:if test="${basicService.customerType == '2'}">
							<label class="weui-cell weui-check__label" for="x12">
							    <div class="weui-cell__bd">
							      <label class="weui-form-preview__label" style="font-size: 17px">个人</label>
							    </div>
							    <div class="weui-cell__ft">
							      <input type="radio" class="weui-check" name="customerType" value="2" id="x12" checked="checked">
							      <span class="weui-icon-checked"></span>
							    </div>
							  </label>
						</c:if>
						<c:if test="${basicService.customerType == '1,2'}">
							
							  <label class="weui-cell weui-check__label" for="x12">
							    <div class="weui-cell__bd">
							      <label class="weui-form-preview__label" style="font-size: 17px">个人</label>
							    </div>
							    <div class="weui-cell__ft">
							      <input type="radio" class="weui-check" name="customerType" value="2" id="x12">
							      <span class="weui-icon-checked"></span>
							    </div>
							  </label>
							  <label class="weui-cell weui-check__label" for="x11">
							    <div class="weui-cell__bd">
							      <label class="weui-form-preview__label" style="font-size: 17px">企业</label>
							    </div>
							    <div class="weui-cell__ft">
							      <input type="radio" class="weui-check" name="customerType" value="1" id="x11">
							      <span class="weui-icon-checked"></span>
							    </div>
							  </label>
						</c:if>
					
					</div>
                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label" id="label_contact"></label></div>
                    <div class="weui-cell__bd">
                        <input class="weui-input" id="person">
                    </div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-form-preview__label" style="font-size: 17px">联系方式</label></div>
                    <div class="weui-cell__bd">
                        <input class="weui-input" id="phone">
                    </div>
                </div>
                <div class="weui-cells weui-cells_form">
                    <div class="weui-cell">
                        <div class="weui-cell__bd">
                            <textarea class="weui-textarea" placeholder="咨询内容" rows="3" id="content"></textarea>
                            <div class="weui-textarea-counter"><span>0</span>/200</div>
                        </div>
                    </div>
                </div>
                <div class="weui-form-preview__ft">
                    <a class="weui-form-preview__btn weui-form-preview__btn_default close-popup"
                       style="background-color: #3475eb;color: white;"
                       href="javascript:submit_consult()">提交</a>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/jquery-weui.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/swiper.min.js"></script>
<script src="https://cdn.bootcss.com/fastclick/1.0.6/fastclick.min.js"></script>

<script type="text/javascript">
    $(function () {
        FastClick.attach(document.body);
        if("${basicService.customerType}" == 2){
			$("#label_contact").html("联系人");
        }else{
        	$("#label_contact").html("企业名称");
        }
        $('input[name=customerType]').click(function(){
        	var value = $("input[name='customerType']:checked").val();
        	if(value == '1'){
        		$("#label_contact").html("企业名称");
        	}else{
        		$("#label_contact").html("联系人");
        	}
        	
        });
        $("#span_desciption").append(htmlDecodeByRegExp("${basicService.desciption}"));
    });
    function htmlDecodeByRegExp(str){
		var s = "";
        if(str.length == 0) return "";
        s = str.replace(/&amp;/g,"&");
        s = s.replace(/&lt;/g,"<");
        s = s.replace(/&gt;/g,">");
        s = s.replace(/&nbsp;/g," ");
        s = s.replace(/&#39;/g,"\'");
        s = s.replace(/&quot;/g,"\"");
        return s;
	};
    function submit_consult(){
    	var person = $("#person").val();
    	var phone = $("#phone").val();
    	var content = $("#content").val();
    	var customerType = $("input[name='customerType']:checked").val();
    	var openid = $("#openid").val();
    	var basicServiceId = "${basicService.id}";
    	if(phone == ""){
    		$.toptip('请输入联系方式', 'warning');
    		return;
    	}
    	if(content == ""){
    		$.toptip('请输入咨询内容', 'warning');
    		return;
    	}
    	var tel = /(^0[1-9]{1}\d{9,10}$)|(^1[3,5,8]\d{9}$)/g;
    	if(!tel.test(phone)){
    		$.toptip('请输入正确的电话号码', 'warning');
    		return;
    	}
    	$.ajax({
	        url : "${pageContext.request.contextPath}/qyfw/consulting/wx_save_consulting",
	        type : "post",
	        dataType : "json",
	        data : {
	        		openid:openid,
	        		person:person,
	        		phone:phone,
	        		content:content,
	        		customerType:customerType,
	        		basicServiceId:basicServiceId
	        },
	        cache : false,
	        async : false,
	        success : function(data) {
	            if(data.result){
	            	alert("咨询成功!请等待客服人员与您联系");
	            	window.location.reload(true);
	            	
	            }else{
	            	alert("抱歉,发生了不可预知的错误,请稍后再试!");
	            	window.location.reload;
	            }
	        },
	        error : function(err) {
	        	alert("抱歉,发生了不可预知的错误,请稍后再试!");
	        	window.location.reload;
	        }
	    });
    };
</script>
</body>
</html>
