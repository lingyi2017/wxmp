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
    <h3>${basicService.name }</h3>
</header>
<div class="weui-form-preview">
    <c:if test="${basicService.isBuy == true}">
        <div class="weui-form-preview__hd">
            <label class="weui-form-preview__label">价格</label>
            <span class="weui-form-preview__value">¥${basicService.price }</span>
        </div>
    </c:if>
    <div class="weui-form-preview__bd">
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">服务类型</label>
            <span class="weui-form-preview__value value-color">${basicService.name}</span>
        </div>
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">服务介绍</label>
        </div>
        <div class="weui-form-preview__item">
            <span class="weui-form-preview__value value-color" id="span_desciption">
            </span>
        </div>
    </div>
</div>

<div class="bottom-btn">
    <div class="weui-form-preview__ft ">
        <c:if test="${basicService.isBuy == false}">
            <button type="submit" class="weui-form-preview__btn weui-form-preview__btn_primary open-popup white"
                    style="background-color: #3475eb;" data-target="#half">我要咨询
            </button>
        </c:if>
        <c:if test="${basicService.isBuy == true}">
            <a class="weui-form-preview__btn weui-form-preview__btn_default open-popup" style="color: #3475eb;"
               href="javascript:" data-target="#half">我要咨询</a>
            <button type="submit" id="buy_button" class="weui-form-preview__btn weui-form-preview__btn_primary white"
                    style="background-color: #3475eb;"
                    onclick="javascript:window.location.href = '${pageContext.request.contextPath}/qyfw/order/wx_serivce_buy?openid=${openid}&serviceId=${basicService.id}'">
                我要购买
            </button>
        </c:if>
    </div>
</div>

<!------- 咨询页面 START ------->
<div id="half" class='weui-popup__container popup-bottom'>
    <div class="weui-popup__overlay"></div>
    <div class="weui-popup__modal">
        <div class="toolbar">
            <div class="toolbar-inner">
                <a href="javascript:;" class="picker-button close-popup" style="color: #3475eb; font-size: 16px;">关闭</a>
                <h1 class="title" style="font-size: 16px;">服务咨询</h1>
            </div>
        </div>
        <div class="modal-content">
            <input type="hidden" id="openid" value="${openid }">
            <div class="weui-panel weui-panel_access">
                <div class="weui-cells__title">客户性质</div>
                <div class="weui-cells weui-cells_radio">
                    <c:if test="${basicService.customerType == '1'}">
                        <label class="weui-cell weui-check__label" for="x11">
                            <div class="weui-cell__bd">
                                <label class="weui-form-preview__label">企业</label>
                            </div>
                            <div class="weui-cell__ft">
                                <input type="radio" class="weui-check" name="customerType" value="1" id="x11"
                                       checked="checked">
                                <span class="weui-icon-checked"></span>
                            </div>
                        </label>
                    </c:if>
                    <c:if test="${basicService.customerType == '2'}">
                        <label class="weui-cell weui-check__label" for="x12">
                            <div class="weui-cell__bd">
                                <label class="weui-form-preview__label">个人</label>
                            </div>
                            <div class="weui-cell__ft">
                                <input type="radio" class="weui-check" name="customerType" value="2" id="x12"
                                       checked="checked">
                                <span class="weui-icon-checked"></span>
                            </div>
                        </label>
                    </c:if>
                    <c:if test="${basicService.customerType == '1,2'}">

                        <label class="weui-cell weui-check__label" for="x12">
                            <div class="weui-cell__bd">
                                <label class="weui-form-preview__label">个人</label>
                            </div>
                            <div class="weui-cell__ft">
                                <input type="radio" class="weui-check" name="customerType" value="2" id="x12" checked="checked">
                                <span class="weui-icon-checked"></span>
                            </div>
                        </label>
                        <label class="weui-cell weui-check__label" for="x11">
                            <div class="weui-cell__bd">
                                <label class="weui-form-preview__label">企业</label>
                            </div>
                            <div class="weui-cell__ft">
                                <input type="radio" class="weui-check" name="customerType" value="1" id="x11">
                                <span class="weui-icon-checked"></span>
                            </div>
                        </label>
                    </c:if>
                </div>
            </div>

            <div class="weui-panel weui-panel_access fs17">
            	<div class="weui-cell" id="div_companyName">
                    <div class="weui-cell__hd"><label class="weui-form-preview__label">企业名称</label></div>
                    <div class="weui-cell__bd">
                        <input class="weui-input" id="companyName">
                    </div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-form-preview__label">联系人</label></div>
                    <div class="weui-cell__bd">
                        <input class="weui-input" id="person">
                    </div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-form-preview__label">联系电话</label></div>
                    <div class="weui-cell__bd">
                        <input class="weui-input fs14" type="number" pattern="[0-9]*" id="phone">
                    </div>
                </div>
            </div>

            <div class="weui-panel weui-panel_access fs17">
                <div class="weui-cell">
                    <div class="weui-cell__bd">
                        <textarea class="weui-textarea fs14" placeholder="咨询内容" rows="3" id="content"></textarea>
                        <div class="weui-textarea-counter"><span>0</span>/200</div>
                    </div>
                </div>
            </div>

            <div class="weui-form-preview__ft fs17 mt10">
                <a class="weui-form-preview__btn weui-form-preview__btn_default"
                   style="background-color: #3475eb;color: white;"
                   href="javascript:submit_consult()">提交</a>
            </div>
        </div>
    </div>
</div>
<!------- 咨询页面 END ------->
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
        
        $("#span_desciption").append(htmlDecodeByRegExp("${basicService.desciption}"));
    });
    function htmlDecodeByRegExp(str) {
        var s = "";
        if (str.length == 0) return "";
        s = str.replace(/&amp;/g, "&");
        s = s.replace(/&lt;/g, "<");
        s = s.replace(/&gt;/g, ">");
        s = s.replace(/&nbsp;/g, " ");
        s = s.replace(/&#39;/g, "\'");
        s = s.replace(/&quot;/g, "\"");
        return s;
    };
    function submit_consult() {
        var person = $("#person").val();
        var companyName = $("#companyName").val();
        var phone = $("#phone").val();
        var content = $("#content").val();
        var customerType = $("input[name='customerType']:checked").val();
        var openid = $("#openid").val();
        var basicServiceId = "${basicService.id}";
        if (phone == "") {
            $.toptip('<div class="toptip">请输入联系电话</div>', 'warning');
            return;
        }
        if (content == "") {
            $.toptip('<div class="toptip">请输入咨询内容</div>', 'warning');
            return;
        }
        var tel = /(^0[1-9]{1}\d{9,10}$)|(^1[3,5,8]\d{9}$)/g;
        if (!tel.test(phone)) {
            $.toptip('<div class="toptip">请输入正确的电话号码</div>', 'warning');
            return;
        }
        $.ajax({
            url: "${pageContext.request.contextPath}/qyfw/consulting/wx_save_consulting",
            type: "post",
            dataType: "json",
            data: {
                openid: openid,
                person: person,
                companyName: companyName,
                phone: phone,
                content: content,
                customerType: customerType,
                basicServiceId: basicServiceId
            },
            cache: false,
            async: false,
            success: function (data) {
                if (data.result) {
                    $.toptip('<div class="toptip">咨询成功!请等待客服人员与您联系</div>', 'success');
                    $.closePopup();
                    window.location.reload(true);
                } else {
                    $.toptip('<div class="toptip">抱歉,发生了不可预知的错误,请稍后再试!</div>', 'error');
                    $.closePopup();
                    window.location.reload;
                }
            },
            error: function (err) {
                $.toptip('<div class="toptip">抱歉,发生了不可预知的错误,请稍后再试!</div>', 'error');
                $.closePopup();
                window.location.reload;
            }
        });
    };
</script>
</body>
</html>
