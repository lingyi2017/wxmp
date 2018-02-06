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
    <li><a href="${ctx}/qyfw/consulting/">咨询列表</a></li>
    <li class="active"><a href="${ctx}/qyfw/consulting/detail?id=${consulting.id}">咨询详情</a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="consulting" action="${ctx}/qyfw/consulting/save" method="post"
           class="form-horizontal">
    <form:hidden path="id"/>
    <tags:message content="${message}"/>

    <fieldset>
        <legend>
            <strong>咨询信息</strong>
        </legend>
    </fieldset>
    <div class="control-group">
        <label class="control-label">服务名称:</label>
        <div class="controls">
            <label class="lbl">${consulting.basicService.name}</label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">客户性质:</label>
        <div class="controls">
        	<label class="lbl">${fns:getDictLabel(consulting.customerType, 'customer_type', '无')}</label>
        </div>
    </div>
    <c:if test="${consulting.customerType == '1'}">
    	<div class="control-group">
	        <label class="control-label">企业名称:</label>
	        <div class="controls">
	            <label class="lbl">${consulting.companyName}</label>
	        </div>
	    </div>
    </c:if>
    <div class="control-group">
        <label class="control-label">联系人:</label>
        <div class="controls">
            <label class="lbl">${consulting.person}</label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">联系方式:</label>
        <div class="controls">
            <label class="lbl">${consulting.phone}</label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">咨询内容:</label>
        <div class="controls">
            <label class="lbl">${consulting.content}</label>
        </div>
    </div>
    
    <div class="control-group">
        <label class="control-label">咨询时间:</label>
        <div class="controls">
            <label class="lbl"><fmt:formatDate value="${consulting.time}" pattern="yyyy-MM-dd hh:mm:ss"/></label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">处理状态:</label>
        <div class="controls">
            <label class="lbl">${fns:getDictLabel(consulting.dealStatus, 'consulting_status', '无')}</label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">咨询反馈:</label>
        <div class="controls">
            <label class="lbl">${consulting.dealBack}</label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">处理时间:</label>
        <div class="controls">
            <label class="lbl"><fmt:formatDate value="${consulting.dealTime}" pattern="yyyy-MM-dd hh:mm:ss"/></label>
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
            <label class="lbl">${consulting.customer.name}</label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">客户性质:</label>
        <div class="controls">
            <label class="lbl">${fns:getDictLabel(consulting.customer.customerType, 'customer_type', '无')}</label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">联系人:</label>
        <div class="controls">
            <label class="lbl">${consulting.customer.contact}</label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">联系电话:</label>
        <div class="controls">
            <label class="lbl">${consulting.customer.phone}</label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">联系地址:</label>
        <div class="controls">
            <label class="lbl">${consulting.customer.address}</label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">备注:</label>
        <div class="controls">
            <label class="lbl">${consulting.customer.mark}</label>
        </div>
    </div>


    <div class="form-actions">
        <input id="btnCancel" class="btn" type="button" value="<spring:message code='return' />"
               onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>