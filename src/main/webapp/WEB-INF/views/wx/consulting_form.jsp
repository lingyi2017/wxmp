<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/wx/_head.jsp" %>
<html>
<head>
    <title>咨询详情</title>
    <style type="text/css">
    </style>
</head>
<body>

<div class="weui-form-preview">
    <div class="weui-form-preview__hd">
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">服务名称</label>
            <em class="weui-form-preview__value">${consulting.basicService.name }</em>
        </div>
    </div>
    <div class="weui-form-preview__bd">
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">当前状态</label>
            <span class="weui-form-preview__value">${fns:getDictLabel(consulting.dealStatus, 'consulting_status', '无')}</span>
        </div>
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">客户性质</label>
            <span class="weui-form-preview__value">${fns:getDictLabel(consulting.customerType , 'customer_type', '无')}</span>
        </div>
        <c:if test="${consulting.customerType == '1' }">
        	<div class="weui-form-preview__item">
	            <label class="weui-form-preview__label">企业名称</label>
	            <span class="weui-form-preview__value">
	                ${consulting.companyName }
	            </span>
	        </div>
        </c:if>
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">联系人</label>
            <span class="weui-form-preview__value">
                ${consulting.person }
            </span>
        </div>
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">联系电话</label>
            <span class="weui-form-preview__value">
                ${consulting.phone }
            </span>
        </div>
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">咨询内容</label>
            <span class="weui-form-preview__value">
                ${consulting.content }
            </span>
        </div>
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">咨询时间</label>
            <span class="weui-form-preview__value"><fmt:formatDate value="${consulting.time }"
                                                                   pattern="yyyy-MM-dd hh:mm:ss"/></span>
        </div>
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">咨询反馈</label>
            <span class="weui-form-preview__value">
                ${consulting.dealBack }
            </span>
        </div>
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">反馈时间</label>
            <span class="weui-form-preview__value"><fmt:formatDate value="${consulting.dealTime }"
                                                                   pattern="yyyy-MM-dd hh:mm:ss"/></span>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/views/wx/_foot.jsp" %>
<script type="text/javascript">
</script>
</body>
</html>