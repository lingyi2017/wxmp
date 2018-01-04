<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>客户管理</title>
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
    <li class="active"><a href="${ctx}/qyfw/customer/">客户列表</a></li>
    <shiro:hasPermission name="qyfw:customer:edit">
        <li><a href="${ctx}/qyfw/customer/form">客户添加</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="customer" action="${ctx}/qyfw/customer/" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>

    <label>客户性质：</label>
    <label>
        <form:select path="customerType" class="input-small">
            <form:option value="" label=""/>
            <form:options items="${fns:getDictList('customer_type')}" itemLabel="label" itemValue="value"
                          htmlEscape="false"/>
        </form:select>&nbsp;&nbsp;
    </label>
    <label>客户名称 ：</label><label><form:input path="name" htmlEscape="false" maxlength="50" class="input-small"/></label>&nbsp;
    <label>联系人 ：</label><label><form:input path="contact" htmlEscape="false" maxlength="50" class="input-small"/></label>&nbsp;
    <label>联系电话 ：</label><label><form:input path="phone" htmlEscape="false" maxlength="50" class="input-small"/></label>&nbsp;
    <input id="btnSubmit" class="btn btn-primary" type="submit" value="<spring:message code='query'/>"/>
</form:form>
<tags:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>客户名称</th>
        <th>联系人</th>
        <th>联系方式</th>
        <th>客户性质</th>
        <th>添加时间</th>
        <shiro:hasPermission name="qyfw:customer:edit">
            <th>操作</th>
        </shiro:hasPermission></tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="customer">
        <tr>
            <td><a href="${ctx}/qyfw/customer/form?id=${customer.id}">${customer.name}</a></td>
            <td>${customer.contact}</td>
            <td>${customer.phone}</td>
            <td>${fns:getDictLabel(customer.customerType, 'customer_type', '无')}</td>
            <td><fmt:formatDate value="${customer.createDate}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
            <td>
                <shiro:hasPermission name="qyfw:customer:edit">
                    <a href="${ctx}/qyfw/customer/form?id=${customer.id}"><spring:message code='update'/></a>
                    <a href="${ctx}/qyfw/customer/delete?id=${customer.id}"
                       onclick="return confirmx('确认要删除该客户吗？', this.href)"><spring:message code='delete'/></a>
                </shiro:hasPermission>
                <a href="${ctx}/qyfw/customer/detail?id=${customer.id}"><spring:message code='order.details'/></a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>