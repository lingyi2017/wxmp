<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>配送订单管理</title>
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
    <li class="active"><a>配送订单列表</a></li>
    <%-- <shiro:hasPermission name="dcxt:account:edit">
        <li><a href="${ctx}/dcxt/account/form">用户修改</a></li>
    </shiro:hasPermission> --%>
</ul>
<form:form id="searchForm" modelAttribute="orderByDay" action="${ctx}/dcxt/order/" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <input id="orderBy" name="orderBy" type="hidden" value="${page.orderBy}"/>

    <div style="margin-top:8px;">
        <label>用户姓名：</label><form:input path="person" htmlEscape="false" maxlength="50" class="input-small"/>&nbsp;
        <label>用户电话：</label><form:input path="phone" htmlEscape="false" maxlength="50" class="input-small"/>&nbsp;
        <label>配送日期：</label>
	    <label>
	        <form:input path="deliveryDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
	               onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
	    </label>
	    <input id="btnSubmit" class="btn btn-primary" type="submit" value="<spring:message code='query' />"
               onclick="return page();"/>
    </div>
</form:form>
<tags:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>订单号</th>
        <th>产品</th>
        <th>收货人</th>
        <th>收货电话</th>
        <th>收货地址</th>
        <th>配送日期</th>
        <th>配送状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="entity">
        <tr>
            <td>${entity.orderNumber}</td>
            <td>${entity.orderTime}</td>
            <td>${entity.person}</td>
            <td>${entity.phone}</td>
            <td>${entity.address}</td>
            <td>${entity.deliveryDate}</td>
            <td>${fns:getDictLabel(entity.status, 'order_delivery_status', '无')}</td>
            <td>
                <a href="${ctx}/dcxt/accountaddress/formByOrderId?orderId=${entity.id}">查看主订单</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>