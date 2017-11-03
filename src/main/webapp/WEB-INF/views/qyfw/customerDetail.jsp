<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>客户详情</title>
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

        $('#myTab a').click(function (e) {
            e.preventDefault();
            $(this).tab('show');
        })
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/qyfw/customer/">客户列表</a></li>
    <li class="active"><a href="${ctx}/qyfw/customer/detail?id=${customer.id}">客户详情</a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="customer" action="${ctx}/qyfw/customer/save" method="post"
           class="form-horizontal">
    <form:hidden path="id"/>
    <tags:message content="${message}"/>

    <fieldset>
        <legend>
            <strong>客户信息</strong>
        </legend>
    </fieldset>
    <div class="control-group">
        <label class="control-label">客户名称:</label>
        <div class="controls">
            <label class="lbl">${customer.name}</label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">客户性质:</label>
        <div class="controls">
            <label class="lbl">${fns:getDictLabel(customer.customerType, 'customer_type', '无')}</label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">联系人:</label>
        <div class="controls">
            <label class="lbl">${customer.contact}</label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">联系电话:</label>
        <div class="controls">
            <label class="lbl">${customer.phone}</label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">联系地址:</label>
        <div class="controls">
            <label class="lbl">${customer.address}</label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">备注:</label>
        <div class="controls">
            <label class="lbl">${customer.mark}</label>
        </div>
    </div>

    <fieldset>
        <legend>
            <strong>交易记录</strong>
        </legend>
    </fieldset>
    <ul class="nav nav-tabs" id="myTab">
        <li class="active"><a href="#orderList" data-toggle="tab">订单列表</a></li>
        <li><a href="#consultingList" data-toggle="tab">咨询列表</a></li>
    </ul>
    <div class="tab-content">
            <%-- 订单列表 --%>
        <div class="tab-pane active" id="orderList">
            <table id="contentTable" class="table table-striped table-condensed">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>服务名称</th>
                    <th>支付金额</th>
                    <th>状态</th>
                    <th>购买时间</th>
                    <th>操作</th>
                </thead>
                <tbody>
                <c:forEach items="${customer.orders}" var="order" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>${order.basicService.name}</td>
                        <td>${order.money}</td>
                        <td>${fns:getDictLabel(order.status, 'order_status', '无')}</td>
                        <td><fmt:formatDate value="${order.createDate}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
                        <td>
                            <a href="${ctx}/qyfw/order/detail?id=${order.id}"><spring:message code='order.details'/></a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
            <%-- 咨询列表 --%>
        <div class="tab-pane" id="consultingList">
            <table id="contentTable2" class="table table-striped table-condensed">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>咨询人</th>
                    <th>联系方式</th>
                    <th>状态</th>
                    <th>咨询时间</th>
                    <th>操作</th>
                </thead>
                <tbody>
                <c:forEach items="${customer.consultings}" var="consulting" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>${consulting.person}</td>
                        <td>${consulting.phone}</td>
                        <td>${fns:getDictLabel(consulting.dealStatus, 'consulting_status', '无')}</td>
                        <td><fmt:formatDate value="${consulting.time}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
                        <td>
                            <a href="${ctx}/qyfw/consulting/detail?id=${order.id}"><spring:message
                                    code='order.details'/></a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <div class="form-actions">
        <input id="btnCancel" class="btn" type="button" value="<spring:message code='return' />"
               onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>