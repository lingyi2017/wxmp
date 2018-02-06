<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>订单详情</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#value").focus();
            $("#inputForm").validate({
                submitHandler: function (form) {
                    loading('正在提交，请稍等...');
                    form.submit();
                },
                errorContainer: "#messageBox",
                errorPlacement: function (error, element) {
                    $("#messageBox").text("输入有误，请先更正。");
                    if (element.is(":checkbox") || element.is(":radio") || element.parent().is(".input-append")) {
                        error.appendTo(element.parent().parent());
                    } else {
                        error.insertAfter(element);
                    }
                }
            });
        });
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/qyfw/order/">订单列表</a></li>
    <li class="active"><a href="${ctx}/qyfw/order/detail?id=${order.id}">订单详情</a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="order" action="${ctx}/qyfw/order/save" method="post"
           class="form-horizontal">
    <form:hidden path="id"/>
    <tags:message content="${message}"/>

    <fieldset>
        <legend>
            <strong>订单信息</strong>
        </legend>
    </fieldset>
    <div class="control-group">
        <label class="control-label">服务名称:</label>
        <div class="controls">
            <label class="lbl">${order.basicService.name}</label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">客户性质:</label>
        <div class="controls">
            <label class="lbl">${fns:getDictLabel(order.customerType, 'customer_type', '无')}</label>
        </div>
    </div>
    <c:if test="${order.customerType == '1'}">
    	<div class="control-group">
	        <label class="control-label">企业名称:</label>
	        <div class="controls">
	            <label class="lbl">${order.companyName}</label>
	        </div>
	    </div>
    </c:if>
    
    <div class="control-group">
        <label class="control-label">联系人:</label>
        <div class="controls">
            <label class="lbl">${order.contact}</label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">联系电话:</label>
        <div class="controls">
            <label class="lbl">${order.phone}</label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">支付金额:</label>
        <div class="controls">
            <label class="lbl">${order.money}</label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">订单备注:</label>
        <div class="controls">
            <label class="lbl">${order.mark}</label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">订单状态:</label>
        <div class="controls">
            <label class="lbl">${fns:getDictLabel(order.status, 'order_status', '无')}</label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">购买时间:</label>
        <div class="controls">
            <label class="lbl"><fmt:formatDate value="${order.createDate}" pattern="yyyy-MM-dd hh:mm:ss"/></label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">处理反馈:</label>
        <div class="controls">
            <label class="lbl">${order.resp}</label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">反馈时间:</label>
        <div class="controls">
            <label class="lbl"><fmt:formatDate value="${order.dealDate}" pattern="yyyy-MM-dd hh:mm:ss"/></label>
        </div>
    </div>

    <fieldset>
        <legend>
            <strong>客户信息</strong>
        </legend>
    </fieldset>
    <div class="control-group">
        <label class="control-label">客户名称:</label>
        <div class="controls">
            <label class="lbl">${order.customer.name}</label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">客户性质:</label>
        <div class="controls">
            <label class="lbl">${fns:getDictLabel(order.customer.customerType, 'customer_type', '无')}</label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">联系人:</label>
        <div class="controls">
            <label class="lbl">${order.customer.contact}</label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">联系电话:</label>
        <div class="controls">
            <label class="lbl">${order.customer.phone}</label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">联系地址:</label>
        <div class="controls">
            <label class="lbl">${order.customer.address}</label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">备注:</label>
        <div class="controls">
            <label class="lbl">${order.customer.mark}</label>
        </div>
    </div>

    <fieldset>
        <legend>
            <strong>材料说明</strong>
        </legend>
    </fieldset>
    <c:if test="${fn:length(order.orderMaterials) == 0}">
        	暂无材料
    </c:if>
    <c:if test="${fn:length(order.orderMaterials) > 0}">
    	<table id="contentTable" class="table table-striped table-condensed">
	        <thead>
	        <tr>
	            <th>序号</th>
	            <th>名称</th>
	            <th>材料详情</th>
	            <shiro:hasPermission name="qyfw:order:edit">
	                <th>操作</th>
	            </shiro:hasPermission></tr>
	        </thead>
	        <tbody>
	        
	        <c:forEach items="${order.orderMaterials}" var="material" varStatus="status">
	            <tr>
	                <td>${status.index + 1}</td>
	                <td>${material.name}</td>
	                <td><img src="${material.path}" class="img-rounded"></td>
	                <shiro:hasPermission name="qyfw:order:edit">
	                    <td>
	                        <a href="${ctx}/qyfw/order/detail?id=${order.id}"><spring:message code='download'/></a>
	                    </td>
	                </shiro:hasPermission>
	            </tr>
	        </c:forEach>
	        </tbody>
	    </table>
    </c:if>
    

    <div class="form-actions">
        <input id="btnCancel" class="btn" type="button" value="<spring:message code='return' />"
               onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>