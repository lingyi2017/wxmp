<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>订单管理</title>
    <meta name="decorator" content="default"/>
    <%@include file="/WEB-INF/views/include/dialog.jsp" %>
    <style type="text/css">.sort {
        color: #0663A2;
        cursor: pointer;
    }</style>
    <script type="text/javascript">
        $(document).ready(function () {
            // 表格排序
            var orderBy = $("#orderBy").val().split(" ");
            $("#contentTable th.sort").each(function () {
                if ($(this).hasClass(orderBy[0])) {
                    orderBy[1] = orderBy[1] && orderBy[1].toUpperCase() == "DESC" ? "down" : "up";
                    $(this).html($(this).html() + " <i class=\"icon icon-arrow-" + orderBy[1] + "\"></i>");
                }
            });
            $("#contentTable th.sort").click(function () {
                var order = $(this).attr("class").split(" ");
                var sort = $("#orderBy").val().split(" ");
                for (var i = 0; i < order.length; i++) {
                    if (order[i] == "sort") {
                        order = order[i + 1];
                        break;
                    }
                }
                if (order == sort[0]) {
                    sort = (sort[1] && sort[1].toUpperCase() == "DESC" ? "ASC" : "DESC");
                    $("#orderBy").val(order + " DESC" != order + " " + sort ? "" : order + " " + sort);
                } else {
                    $("#orderBy").val(order + " ASC");
                }
                page();
            });
        });
        function page(n, s) {
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").attr("action", "${ctx}/dcxt/order/");
            $("#searchForm").submit();
            return false;
        }
    </script>
</head>
<body>

<ul class="nav nav-tabs">
    <li class="active"><a>订单列表</a></li>
    <%-- <shiro:hasPermission name="dcxt:account:edit">
        <li><a href="${ctx}/dcxt/account/form">用户修改</a></li>
    </shiro:hasPermission> --%>
</ul>
<form:form id="searchForm" modelAttribute="queryDTO" action="${ctx}/dcxt/order/" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <input id="orderBy" name="orderBy" type="hidden" value="${page.orderBy}"/>

    <div style="margin-top:8px;">
        <label>用户姓名：</label><form:input path="accountName" htmlEscape="false" maxlength="50" class="input-small"/>&nbsp;
        <label>用户电话：</label><form:input path="accountPhone" htmlEscape="false" maxlength="50" class="input-small"/>&nbsp;
        <input id="btnSubmit" class="btn btn-primary" type="submit" value="<spring:message code='query' />"
               onclick="return page();"/>
    </div>
</form:form>
<tags:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>订单号</th>
        <th>下单时间</th>
        <th>客户姓名</th>
        <th>客户电话</th>
        <th>购买产品</th>
        <th>支付方式</th>
        <th>购买天数</th>
        <th>已完成天数</th>
        <th>订单总金额</th>
        <th>订单实付金额</th>
        <th>订单状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="entity">
        <tr>
            <td>${entity.orderNumber}</td>
            <td>${entity.orderTime}</td>
            <td>${entity.account.name}</td>
            <td>${entity.account.phone}</td>
            <td></td>
            <td>${fns:getDictLabel(entity.payWay, 'pay_way', '无')}</td>
            <td>${entity.days}</td>
            <td>${entity.finishDays}</td>
            <td>${entity.orderMoney}</td>
            <td>${entity.paidMoney}</td>
            <td>${fns:getDictLabel(entity.orderStatus, 'order_status', '无')}</td>
            <shiro:hasPermission name="dcxt:order:edit">
                <td>
                	<c:if test="${entity.orderStatus == 1 }">
                    <a href="${ctx}/dcxt/accountaddress/formByOrderId?orderId=${entity.id}">修改收货地址</a>
                	<a href="${ctx}/dcxt/order/pause?id=${entity.id}">暂停</a>
                	</c:if>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>