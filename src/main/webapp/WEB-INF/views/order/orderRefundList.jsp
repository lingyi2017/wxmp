<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>订单退款管理</title>
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
            $("#searchForm").attr("action", "${ctx}/dcxt/orderrefund/");
            $("#searchForm").submit();
            return false;
        }
    </script>
</head>
<body>

<ul class="nav nav-tabs">
    <li class="active"><a>订单退款列表</a></li>
</ul>
<form:form id="searchForm" modelAttribute="orderQueryDTO" action="${ctx}/dcxt/orderrefund/" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <input id="orderBy" name="orderBy" type="hidden" value="${page.orderBy}"/>

    <div style="margin-top:8px;">
        <label>订单号：</label><form:input path="orderNumber" htmlEscape="false" maxlength="50" class="input-small"/>&nbsp;
        <label>退款状态:</label>
            <form:select path="status">
                <form:options items="${fns:getDictList('order_refund_status')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        <label>退款申请时间：</label>
	    <label>
	        <input id="beginDate" name="beginDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
	               value="${orderQueryDTO.beginDate}" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/> ~
	        <input id="endDate" name="endDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
	               value="${orderQueryDTO.endDate}" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
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
        <th>订单时间</th>
        <th>用户姓名</th>
        <th>用户电话</th>
        <th>购买产品</th>
        <th>订单总金额</th>
        <th>退款原因</th>
        <th>退款时间</th>
        <th>退款金额</th>
        <th>退款状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="entity">
        <tr>
            <td>${entity.order.orderNumber}</td>
            <td>${entity.order.orderTime}</td>
            <td>${entity.order.account.name}</td>
            <td>${entity.order.account.phone}</td>
            <td></td>
            <td>${entity.order.orderMoney}</td>
            <td>${entity.refundReason}</td>
            <td>${entity.refundTime}</td>
            <td>${entity.refundMoney}</td>
            <td>${fns:getDictLabel(entity.status, 'order_refund_status', '无')}</td>
            <td>
            	<a href="${ctx}/dcxt/order/pause?id=${entity.id}">详情</a>
            	<c:if test="${entity.status == 1 }">
            	<a href="${ctx}/dcxt/orderrefund/form?id=${entity.id}">处理</a>
            	</c:if>
            	
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>