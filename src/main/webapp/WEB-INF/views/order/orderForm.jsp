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
    <shiro:hasPermission name="dcxt:order:edit">
        <li class="active"><a>订单信息</a></li>
    </shiro:hasPermission>
</ul>

<form:form id="inputForm" modelAttribute="order" action="${ctx}/dcxt/account/save" method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <tags:message content="${message}"/>
   
    <div class="control-group" style="width: 33%;float: left;">
        <label class="control-label">订单号:</label>
        <div class="controls">
            <form:input path="orderNumber" htmlEscape="false" maxlength="50" readonly="true"/>
        </div>
    </div>
     <div class="control-group" style="width: 33%;float: left;">
        <label class="control-label">下单时间:</label>
        <div class="controls">
            <form:input path="orderTime" htmlEscape="false" readonly="true"/>
        </div>
    </div>
    <div class="control-group" style="width: 34%;float: left;">
        <label class="control-label">客户姓名:</label>
        <div class="controls">
            <form:input path="account.name" htmlEscape="false" readonly="true"/>
        </div>
    </div>
    <div class="control-group" style="width: 33%;float: left;">
        <label class="control-label">客户电话:</label>
        <div class="controls">
            <form:input path="account.phone" htmlEscape="false" readonly="true"/>
        </div>
    </div>
    <div class="control-group" style="width: 33%;float: left;">
        <label class="control-label">购买产品:</label>
        <div class="controls">
            
        </div>
    </div>
    <div class="control-group" style="width: 33%;float: left;">
        <label class="control-label">支付方式:</label>
        <div class="controls">
            <form:input path="payWay" htmlEscape="false" readonly="true" value="${fns:getDictLabel('order.payWay','pay_way','无')}"/>
        </div>
    </div>
    <div class="control-group" style="width: 33%;float: left;">
        <label class="control-label">购买天数:</label>
        <div class="controls">
            <form:input path="days" htmlEscape="false" readonly="true"/>
        </div>
    </div>
     <div class="control-group" style="width: 33%;float: left;">
        <label class="control-label">完成天数:</label>
        <div class="controls">
            <form:input path="finishDays" htmlEscape="false" readonly="true"/>
        </div>
    </div>
    <div class="control-group" style="width: 33%;float: left;">
        <label class="control-label">总金额:</label>
        <div class="controls">
            <form:input path="days" htmlEscape="false" readonly="true"/>
        </div>
    </div>
    <div class="control-group" style="width: 33%;float: left;">
        <label class="control-label">实付金额:</label>
        <div class="controls">
            <form:input path="days" htmlEscape="false" readonly="true"/>
        </div>
    </div>
    <div class="control-group" style="width: 33%;float: left;">
        <label class="control-label">优惠金额:</label>
        <div class="controls">
            <form:input path="days" htmlEscape="false" readonly="true"/>
        </div>
    </div>
    <div class="control-group" style="width: 33%;float: left;">
        <label class="control-label">订单状态:</label>
        <div class="controls">
        	<form:input path="payWay" htmlEscape="false" readonly="true" value="${fns:getDictLabel('order.orderStatus','order_status','无')}"/>
        </div>
    </div>
    <div class="control-group" style="width: 33%;float: left;">
        <label class="control-label">评价:</label>
        <div class="controls">
        	<form:input path="payWay" htmlEscape="false" readonly="true" value="${fns:getDictLabel('order.comment.comment','order_comment','无')}"/>

        </div>
    </div>
    <div class="control-group" style="width: 33%;float: left;">
        <label class="control-label">评价内容:</label>
        <div class="controls">
            <form:textarea path="comment.commentMark" htmlEscape="false" readonly="true"/>
        </div>
    </div>
        <div class="control-group" style="width: 33%;float: left;">
        <label class="control-label">追加评价内容:</label>
        <div class="controls">
            <form:textarea path="comment.commentAddMark" htmlEscape="false"  readonly="true"/>
        </div>
    </div>
    <!-- 子订单信息 -->
    <table id="contentTable" class="table table-striped table-bordered table-condensed">
	    <thead>
	    <tr>
	        <th>订单号</th>
	        <th>配送日期</th>
	        <th>订单金额</th>
	        <th>收货人</th>
	        <th>收货电话</th>
	        <th>收货地址</th>
	        <th>配送状态</th>
	        <th>操作</th>
	    </tr>
	    </thead>
	    <tbody>
	    <c:forEach items="${order.orderByDays}" var="entity">
	        <tr>
	            <td>${entity.orderNumber}</td>
	            <td>${entity.deliveryDate}</td>
	            <td>${entity.orderMoney}</td>
	            <td>${entity.person}</td>
	            <td>${entity.phone}</td>
	            <td>${entity.address}</td>
	            <td>${fns:getDictLabel(entity.status, 'order_delivery_status', '无')}</td>
                <td>
                	<c:if test="${entity.status == 2 }">
                		<a href="${ctx}/dcxt/accountaddress/formByOrderId?orderId=${entity.id}">修改收货地址</a>
                	</c:if>
                    
                </td>
	        </tr>
	    </c:forEach>
	    </tbody>
	</table>
    <div class="form-actions" style="width: 100%;float: left;">
        <shiro:hasPermission name="dcxt:account:edit">
            <input id="btnSubmit" class="btn btn-primary" type="submit" value="<spring:message code='save' />"/>&nbsp;
        </shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="<spring:message code='return' />"
               onclick="history.go(-1)"/>
    </div>
</form:form>

</body>
</html>