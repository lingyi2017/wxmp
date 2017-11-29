<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>订单信息</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
	    $(document).ready(function() {
	    	$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
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
    <li><a href="${ctx}/dcxt/order/">订单列表</a></li>
    <shiro:hasPermission name="dcxt:account:edit">
        <li class="active"><a>订单信息</a></li>
    </shiro:hasPermission>
</ul>

<form:form id="inputForm" modelAttribute="order" action="${ctx}/dcxt/account/save" method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <tags:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">订单号:</label>
        <div class="controls">
            <form:input path="orderNumber" htmlEscape="false" maxlength="50" readonly="true"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">下单时间:</label>
        <div class="controls">
            <form:input path="orderTime" htmlEscape="false" readonly="true"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">客户姓名:</label>
        <div class="controls">
            <form:input path="account.name" htmlEscape="false" readonly="true"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">客户电话:</label>
        <div class="controls">
            <form:input path="account.phone" htmlEscape="false" readonly="true"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">购买产品:</label>
        <div class="controls">
            
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">支付方式:</label>
        <div class="controls">
        	 <form:select path="payWay" disabled="true">
                <form:options items="${fns:getDictList('pay_way')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">购买天数:</label>
        <div class="controls">
            <form:input path="days" htmlEscape="false" readonly="true"/>
        </div>
    </div>
     <div class="control-group">
        <label class="control-label">完成天数:</label>
        <div class="controls">
            <form:input path="finishDays" htmlEscape="false" readonly="true"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">总金额:</label>
        <div class="controls">
            <form:input path="days" htmlEscape="false" readonly="true"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">实付金额:</label>
        <div class="controls">
            <form:input path="days" htmlEscape="false" readonly="true"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">优惠金额:</label>
        <div class="controls">
            <form:input path="days" htmlEscape="false" readonly="true"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">订单状态:</label>
        <div class="controls">
        	 <form:select path="orderStatus" disabled="true">
                <form:options items="${fns:getDictList('order_status')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </div>
    </div>
    <c:if test="${order.isRefund == '1' }">
    <div class="control-group">
        <label class="control-label">退款申请时间:</label>
        <div class="controls">
            <form:input path="refundTime" htmlEscape="false" readonly="true"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">退款原因:</label>
        <div class="controls">
            <form:input path="refundReason" htmlEscape="false" readonly="true"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">退款回复:</label>
        <div class="controls">
            <form:input path="refundReply" htmlEscape="false" readonly="true"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">退款金额:</label>
        <div class="controls">
            <form:input path="refundMoney" htmlEscape="false" readonly="true"/>
        </div>
    </div>
    </c:if>
    <div class="control-group">
        <label class="control-label">收货信息:</label>
        <div class="controls">-------------------------------------
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">收货人:</label>
        <div class="controls">
            <form:input path="address.person" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">收货人电话:</label>
        <div class="controls">
            <form:input path="address.phone" htmlEscape="false" maxlength="50" cssClass="required phone" readonly="true"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">收货地址:</label>
        <div class="controls">
            <form:textarea path="address.address" htmlEscape="false" rows="2" maxlength="200" class="input-xlarge" readonly="true"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">评价信息:</label>
        <div class="controls">-------------------------------------
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">评价:</label>
        <div class="controls">
            <form:select path="comment.comment" disabled="true">
                <form:options items="${fns:getDictList('order_comment')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">评价内容:</label>
        <div class="controls">
            <form:textarea path="comment.commentMark" htmlEscape="false" maxlength="50" cssClass="required phone" readonly="true"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">追加评价内容:</label>
        <div class="controls">
            <form:textarea path="comment.commentAddMark" htmlEscape="false" rows="2" maxlength="200" class="input-xlarge" readonly="true"/>
        </div>
    </div>
    <div class="form-actions">
        <shiro:hasPermission name="dcxt:account:edit">
            <input id="btnSubmit" class="btn btn-primary" type="submit" value="<spring:message code='save' />"/>&nbsp;
        </shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="<spring:message code='return' />"
               onclick="history.go(-1)"/>
    </div>
</form:form>

</body>
</html>