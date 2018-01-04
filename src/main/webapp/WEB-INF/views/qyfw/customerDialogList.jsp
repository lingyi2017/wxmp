<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>客户列表</title>
    <meta name="decorator" content="default"/>
    <script src="${ctxStatic}/artDialog/artDialog.js?skin=blue"></script>
    <script src="${ctxStatic}/artDialog/plugins/iframeTools.js"></script>
    <script type="text/javascript">
        function page(n, s) {
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }

        function selectCustomer(id, name, customerType, contact, phone, address, mark) {
            var origin = artDialog.open.origin;

            var customerId = origin.document.getElementById("customer.id");
            customerId.value = id;

            var customerName = origin.document.getElementById('customer.name');
            customerName.value = name;

            var customerType = origin.document.getElementById('customer.customerType');
            customerType.value = customerType;

            var customerContact = origin.document.getElementById('customer.contact');
            customerContact.value = contact;

            var customerPhone = origin.document.getElementById('customer.phone');
            customerPhone.value = phone;

            var customerAddress = origin.document.getElementById('customer.address');
            customerAddress.value = address;

            var customerMark = origin.document.getElementById('customer.mark');
            customerMark.value = mark;

            art.dialog.close();
        }
    </script>
</head>
<body>
<form:form id="searchForm" modelAttribute="customer" action="${ctx}/qyfw/customer/dialogList" method="post"
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
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="customer">
        <tr ondblclick="selectCustomer('${customer.id}', '${customer.name}', '${customer.customerType}', '${customer.contact}',
                '${customer.phone}', '${customer.address}', '${customer.mark}')">
            <td>${customer.name}</td>
            <td>${customer.contact}</td>
            <td>${customer.phone}</td>
            <td>${fns:getDictLabel(customer.customerType, 'customer_type', '无')}</td>
            <td><fmt:formatDate value="${customer.createDate}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>