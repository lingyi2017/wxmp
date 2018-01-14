<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>订单处理</title>
    <meta name="decorator" content="default"/>
    <script src="${ctxStatic}/artDialog/artDialog.js?skin=blue"></script>
    <script src="${ctxStatic}/artDialog/plugins/iframeTools.js"></script>
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
            $("#customer.customerType").val("${consulting.customerType}");
        });

        function queryCustomer() {
        	var url = encodeURI(encodeURI("${ctx}/qyfw/customer/dialogList?customerType=${consulting.customerType}&name=${consulting.companyName}&contact=${consulting.person}&phone=${consulting.phone}"));
            art.dialog.open(url, {width: 1200, height: 410, title: '选择客户', id: 'id'});
        }
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/qyfw/consulting/">咨询列表</a></li>
    <li class="active"><a href="${ctx}/qyfw/consulting/detail?id=${consulting.id}">咨询处理</a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="consulting" action="${ctx}/qyfw/consulting/deal/save" method="post"
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
        <label class="control-label">咨询人:</label>
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
        <label class="control-label">咨询状态:</label>
        <div class="controls">
            <form:select path="dealStatus">
                <form:options items="${fns:getDictList('consulting_status')}" itemLabel="label"
                              itemValue="value" htmlEscape="false"/>
            </form:select>
        </div>
    </div>
    
    <div class="control-group">
        <label class="control-label">处理反馈:</label>
        <div class="controls">
            <form:textarea path="dealBack" htmlEscape="false" rows="3" maxlength="200" class="input-xlarge"/>
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
            <form:hidden path="customer.id"/>
            <c:if test="${consulting.customer.id == null}">
                <form:input path="customer.name" htmlEscape="false" maxlength="100" cssClass="required"
                            value="${consulting.person}"/>
            </c:if>
            <c:if test="${consulting.customer.id != null}">
                <form:input path="customer.name" htmlEscape="false" maxlength="100" cssClass="required"/>
            </c:if>
            <label><input type="button" class="btn" value="<spring:message code='query'/>"
                          onclick="queryCustomer()"/></label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">客户性质:</label>
        <div class="controls">
            <form:select path="customer.customerType" id="customer.customerType">
                <form:options items="${fns:getDictList('customer_type')}" itemLabel="label"
                              itemValue="value" htmlEscape="false"/>
            </form:select>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">联系人:</label>
        <div class="controls">
            <c:if test="${consulting.customer.id == null}">
                <form:input path="customer.contact" htmlEscape="false" maxlength="100" cssClass="required"
                            value="${consulting.person}"/>
            </c:if>
            <c:if test="${consulting.customer.id != null}">
                <form:input path="customer.contact" htmlEscape="false" maxlength="100" cssClass="required"/>
            </c:if>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">联系电话:</label>
        <div class="controls">
            <c:if test="${consulting.customer.id == null}">
                <form:input path="customer.phone" htmlEscape="false" maxlength="100" cssClass="required"
                            value="${consulting.phone}"/>
            </c:if>
            <c:if test="${consulting.customer.id != null}">
                <form:input path="customer.phone" htmlEscape="false" maxlength="100" cssClass="required"/>
            </c:if>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">联系地址:</label>
        <div class="controls">
            <form:input path="customer.address"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">备注:</label>
        <div class="controls">
            <form:textarea path="customer.mark" htmlEscape="false" rows="3" maxlength="200" class="input-xlarge"/>
        </div>
    </div>

    <div class="form-actions">
        <shiro:hasPermission name="qyfw:consulting:edit">
            <input id="btnSubmit" class="btn btn-primary" type="submit" value="<spring:message code='save' />"/>&nbsp;
        </shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="<spring:message code='return' />"
               onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>