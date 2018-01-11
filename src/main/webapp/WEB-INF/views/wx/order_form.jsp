<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/wx/_head.jsp" %>
<html>
<head>
    <title>订单详情</title>
    <style type="text/css">
    </style>
</head>
<body>

<div class="weui-panel" style="margin-top: 20px;">
    <div class="weui-panel__bd">
        <div class="weui-media-box weui-media-box_small-appmsg">
            <div class="weui-cells">
                <a class="weui-cell weui-cell_access" href="javascript:;">
                    <div class="weui-cell__bd weui-cell_primary">
                        <p><spring:message code='wx.title'/></p>
                    </div>
                </a>
            </div>
        </div>
    </div>
</div>

<div class="weui-form-preview mt20">
    <div class="weui-form-preview__hd">
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">付款金额</label>
            <em class="weui-form-preview__value">¥${order.money }</em>
        </div>
    </div>
    <div class="weui-form-preview__bd">
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">服务名称</label>
            <span class="weui-form-preview__value">${order.basicService.name }</span>
        </div>
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">当前状态</label>
            <span class="weui-form-preview__value">${fns:getDictLabel(order.status, 'order_status', '无')}</span>
        </div>
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">客户性质</label>
            <span class="weui-form-preview__value">${fns:getDictLabel(order.customerType , 'customer_type', '无')}</span>
        </div>
        <c:if test="${order.customerType == '1' }">
        	<div class="weui-form-preview__item">
	            <label class="weui-form-preview__label">企业名称</label>
	            <span class="weui-form-preview__value">
	                ${order.companyName }
	            </span>
	        </div>
        </c:if>
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">联系人</label>
            <span class="weui-form-preview__value">${order.contact }</span>
        </div>
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">联系电话</label>
            <span class="weui-form-preview__value">${order.phone }</span>
        </div>
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">订单备注</label>
            <span class="weui-form-preview__value">${order.mark }</span>
        </div>
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">购买时间</label>
            <span class="weui-form-preview__value"><fmt:formatDate value="${order.createDate }"
                                                                   pattern="yyyy-MM-dd hh:mm:ss"/></span>
        </div>
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">支付方式</label>
            <span class="weui-form-preview__value">微信支付</span>
        </div>
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">处理反馈</label>
            <span class="weui-form-preview__value">${order.resp }</span>
        </div>
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">反馈时间</label>
            <span class="weui-form-preview__value"><fmt:formatDate value="${order.dealDate }"
                                                                   pattern="yyyy-MM-dd hh:mm:ss"/></span>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/views/wx/_foot.jsp" %>
<script type="text/javascript">
</script>
</body>
</html>