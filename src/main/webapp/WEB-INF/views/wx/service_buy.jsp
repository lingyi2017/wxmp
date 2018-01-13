<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/wx/_head.jsp" %>
<html>
<head>
    <title><spring:message code='wx.title'/></title>
    <style type="text/css">
    </style>
</head>
<body>
<header>
    <h3>服务购买</h3>
</header>
<div class="weui-form-preview mt20">
    <div class="weui-form-preview__bd">
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label fs14">价格</label>
            <span class="weui-form-preview__value" style="color: red; font-size: 20px">¥${basicService.price }</span>
        </div>
    </div>
    <div class="weui-form-preview__bd">
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label fs14">名称</label>
            <span class="weui-form-preview__value value-color">
                ${basicService.name }
            </span>
        </div>
    </div>
</div>

<form id="form" action="${pageContext.request.contextPath}/qyfw/order/wx_save" method="post"
      onsubmit="return sumbit_order()">

    <div class="weui-cells__title">客户性质</div>
    <div class="weui-cells weui-cells_radio">
        <c:if test="${basicService.customerType == '1'}">
            <label class="weui-cell weui-check__label" for="x11">
                <div class="weui-cell__bd">
                    <label class="weui-form-preview__label fs14">企业</label>
                </div>
                <div class="weui-cell__ft">
                    <input type="radio" class="weui-check" name="customerType" value="1" id="x11">
                    <span class="weui-icon-checked"></span>
                </div>
            </label>
        </c:if>
        <c:if test="${basicService.customerType == '2'}">
            <label class="weui-cell weui-check__label" for="x12">
                <div class="weui-cell__bd">
                    <label class="weui-form-preview__label fs14">个人</label>
                </div>
                <div class="weui-cell__ft">
                    <input type="radio" class="weui-check" name="customerType" value="2" id="x12">
                    <span class="weui-icon-checked"></span>
                </div>
            </label>
        </c:if>
        <c:if test="${basicService.customerType == '1,2'}">
            <label class="weui-cell weui-check__label" for="x12">
                <div class="weui-cell__bd">
                    <label class="weui-form-preview__label fs14">个人</label>
                </div>
                <div class="weui-cell__ft">
                    <input type="radio" class="weui-check" name="customerType" value="2" id="x12" checked="checked">
                    <span class="weui-icon-checked"></span>
                </div>
            </label>
            <label class="weui-cell weui-check__label" for="x11">
                <div class="weui-cell__bd">
                    <label class="weui-form-preview__label fs14">企业</label>
                </div>
                <div class="weui-cell__ft">
                    <input type="radio" class="weui-check" name="customerType" value="1" id="x11">
                    <span class="weui-icon-checked"></span>
                </div>
            </label>
        </c:if>
    </div>

    <div class="weui-cells weui-cells_form fs14">
    	<div class="weui-cell" id="div_companyName">
            <div class="weui-cell__hd"><label class="weui-form-preview__label">企业名称</label></div>
            <div class="weui-cell__bd">
                <input class="weui-input" id="companyName" name="companyName">
            </div>
        </div>
        <div class="weui-cell" style="color: #999;">
            <div class="weui-cell__hd"><label class="weui-label">联系人</label></div>
            <div class="weui-cell__bd value-color">
                <input class="weui-input" id="contact" name="contact">
            </div>
        </div>
        <div class="weui-cell" style="color: #999;">
            <input type="hidden" name="openid" value="${openid }">
            <input type="hidden" name="basicServiceId" value="${basicService.id }">
            <div class="weui-cell__hd"><label class="weui-label">联系电话</label></div>
            <div class="weui-cell__bd">
                <input class="weui-input value-color" type="number" pattern="[0-9]*" name="phone" id="phone">
            </div>
        </div>
    </div>
    <div class="weui-cells weui-cells_form fs14">
        <div class="weui-cell">
            <div class="weui-cell__bd">
                <textarea class="weui-textarea value-color" placeholder="订单备注" rows="3" id="mark"
                          name="mark"></textarea>
                <div class="weui-textarea-counter"><span>0</span>/200</div>
            </div>
        </div>
    </div>
    <%--<div class="weui-panel mt20" style="margin-bottom: 60px">
        <div class="weui-panel__bd">
            <div class="weui-media-box weui-media-box_small-appmsg">
                <div class="weui-cells">
                    <a class="weui-cell weui-cell_access" href="javascript:;">
                        <div class="weui-cell__hd"><i class="weui-icon-success fs14"></i></div>
                        <div class="weui-cell__bd weui-cell_primary fs14">
                            <p style="color: #999;">微信支付</p>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>--%>
    <div class="bottom-btn">
        <div class="weui-form-preview__ft ">
            <a class="weui-form-preview__btn" href="javascript:;" style="background-color: white">
                <p style="text-align: left;color: #999; margin-left: 15px">
                    实际支付<span class="red">¥${basicService.price }</span>
                </p>
            </a>
            <button type="submit" class="weui-form-preview__btn2"
                    style="background-color: red; color: white;" onclick="javascript:sumbit_order()">确认支付
            </button>
        </div>
    </div>
</form>

<%@ include file="/WEB-INF/views/wx/_foot.jsp" %>

<script type="text/javascript">
    $(function () {
    	if ("${basicService.customerType}" == 2) {
        	$("#div_companyName").show();
        } else {
        	$("#div_companyName").hide();
        }
        $('input[name=customerType]').click(function () {
            var value = $("input[name='customerType']:checked").val();
            if (value == '1') {
                $("#div_companyName").show();
            } else {
            	$("#div_companyName").hide();
            }

        });
    });
    function sumbit_order() {
        var phone = $("#phone").val();
        var tel = /(^0[1-9]{1}\d{9,10}$)|(^1[3,5,8]\d{9}$)/g;
        if (!tel.test(phone)) {
            $.toptip('<div class="toptip">请输入正确的电话号码</div>', 'warning');
            return false;
        }
        var data = $('form').serialize();
        var content = JSON.stringify(data).replace(/"/gi, '').replace(/&/gi, '<br>');
        $('form').submit();
    };

</script>
</body>
</html>