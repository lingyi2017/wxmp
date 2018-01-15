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
            $("#selCustomerType").val("${order.customerType}");
        });

        function queryCustomer() {
            var url = encodeURI(encodeURI("${ctx}/qyfw/customer/dialogList?customerType=${order.customerType}&name=${order.companyName}&contact=${order.contact}&phone=${order.phone}"));
            art.dialog.open(url, {width: 1200, height: 410, title: '选择客户', id: 'id'});
        }
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/qyfw/order/">订单列表</a></li>
    <li class="active"><a href="${ctx}/qyfw/order/detail?id=${order.id}">订单处理</a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="order" action="${ctx}/qyfw/order/deal/save" method="post"
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
    <c:if test="${order.customerType } == '1'">
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
        <label class="control-label">购买时间:</label>
        <div class="controls">
            <label class="lbl"><fmt:formatDate value="${order.createDate}" pattern="yyyy-MM-dd hh:mm:ss"/></label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">订单状态:</label>
        <div class="controls">
            <form:select path="status">
                <form:options items="${fns:getDictList('order_status')}" itemLabel="label"
                              itemValue="value" htmlEscape="false"/>
            </form:select>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">处理反馈:</label>
        <div class="controls">
            <form:textarea path="resp" htmlEscape="false" rows="3" maxlength="200" class="input-xlarge"/>
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
            <c:if test="${order.customer.id == null}">
                <form:input path="customer.name" htmlEscape="false" maxlength="100" cssClass="required"
                            value="${order.companyName}"/>
            </c:if>
            <c:if test="${order.customer.id != null}">
                <form:input path="customer.name" htmlEscape="false" maxlength="100" cssClass="required"/>
            </c:if>
            <label><input type="button" class="btn" value="<spring:message code='query'/>"
                          onclick="queryCustomer()"/></label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">客户性质:</label>
        <div class="controls">
            <c:if test="${order.customer.id == null}">
                <form:select path="customer.customerType" id="customer.customerType">
                    <option value="1" <c:if test="${order.customerType == 1}" >selected="selected"</c:if>>企业</option>
                    <option value="2" <c:if test="${order.customerType == 2}">selected="selected"</c:if>>个人</option>
                </form:select>
            </c:if>
            <c:if test="${order.customer.id != null}">
                <form:select path="customer.customerType" id="customer.customerType">
                    <form:options items="${fns:getDictList('customer_type')}" itemLabel="label"
                                  itemValue="value" htmlEscape="false"/>
                </form:select>
            </c:if>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">联系人:</label>
        <div class="controls">
            <c:if test="${order.customer.id == null}">
                <form:input path="customer.contact" id="123" htmlEscape="false" maxlength="100" cssClass="required"
                            value="${order.contact}"/>
            </c:if>
            <c:if test="${order.customer.id != null}">
                <form:input path="customer.contact" htmlEscape="false" maxlength="100" cssClass="required"/>
            </c:if>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">联系电话:</label>
        <div class="controls">
            <c:if test="${order.customer.id == null}">
                <form:input path="customer.phone" id="1234" htmlEscape="false" maxlength="100" cssClass="required"
                            value="${order.phone}"/>
            </c:if>
            <c:if test="${order.customer.id != null}">
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

    <fieldset>
        <legend>
            <strong>材料信息</strong>
        </legend>
    </fieldset>
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

    <div class="form-actions">
        <shiro:hasPermission name="qyfw:order:edit">
            <input id="btnSubmit" class="btn btn-primary" type="submit" value="<spring:message code='save' />"/>&nbsp;
        </shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="<spring:message code='return' />"
               onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>