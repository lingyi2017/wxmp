<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>订单查询</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        function page(n, s) {
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/qyfw/order/">订单列表</a></li>
</ul>
<form:form id="searchForm" modelAttribute="order" action="${ctx}/qyfw/order/" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>

    <label>购买时间：</label>
    <label>
        <input id="beginDate" name="beginDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
               value="${queryDto.beginDate}" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" style="width: 100px"/> ~
        <input id="endDate" name="endDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
               value="${queryDto.endDate}" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" style="width: 100px"/>
    </label>
    <label>企业名称 ：</label><label><input type="text" id="companyName" name="companyName" value="${queryDto.companyName}"
                                      maxlength="50" class="input-small"/></label>
    <label>联系人 ：</label><label><input type="text" id="contact" name="contact" value="${queryDto.contact}"
                                      maxlength="30" class="input-small"/></label>
    <label>联系电话 ：</label><label><input type="text" id="phone" name="phone" value="${queryDto.phone}"
                                      maxlength="30" class="input-small"/></label>
    <label>服务名称 ：</label><label><input type="text" id="serviceName" name="serviceName" value="${queryDto.serviceName}"
                                       maxlength="30" class="input-small"/></label>

    <label><input id="btnSubmit" class="btn btn-primary" type="submit" value="<spring:message code='query'/>"/></label>
</form:form>
<tags:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th style="width: 130px">服务名称</th>
        <th>客户性质</th>
        <th>企业名称</th>
        <th>联系人</th>
        <th>联系电话</th>
        <th>支付金额</th>
        <th>订单状态</th>
        <th>购买时间</th>
        <shiro:hasPermission name="qyfw:order:edit">
            <th>操作</th>
        </shiro:hasPermission></tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="order">
        <tr>
            <td>${order.basicService.name}</td>
            <td>${fns:getDictLabel(order.customerType, 'customer_type', '无')}</td>
            <td>
            	<c:if test="${empty order.companyName}">--</c:if>
            	<c:if test="${not empty order.companyName}">${order.companyName}</c:if>
            </td>
            <td>${order.contact}</td>
            <td>${order.phone}</td>
            <td>${order.money}</td>
            <td>${fns:getDictLabel(order.status, 'order_status', '无')}</td>
            <td><fmt:formatDate value="${order.createDate}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
            <shiro:hasPermission name="qyfw:order:edit">
                <td>
                    <a href="${ctx}/qyfw/order/detail?id=${order.id}"><spring:message code='order.details'/></a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>