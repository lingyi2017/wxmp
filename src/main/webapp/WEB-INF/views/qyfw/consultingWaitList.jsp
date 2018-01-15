<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>待办咨询</title>
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
    <li class="active"><a href="${ctx}/qyfw/consulting/">待办列表</a></li>
</ul>
<form:form id="searchForm" modelAttribute="consulting" action="${ctx}/qyfw/consulting/wait/list" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>

    <label>咨询时间：</label>
    <label>
        <input id="beginDate" name="beginDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
               value="${queryDto.beginDate}" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/> ~
        <input id="endDate" name="endDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
               value="${queryDto.endDate}" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
    </label>
    <label>联系人 ：</label><label><input type="text" id="contact" name="contact" value="${queryDto.contact}"
                                      maxlength="50" class="input-small"/></label>
    <label>服务名称 ：</label><label><input type="text" id="serviceName" name="serviceName" value="${queryDto.serviceName}"
                                       maxlength="50" class="input-small"/></label>

    <label><input id="btnSubmit" class="btn btn-primary" type="submit" value="<spring:message code='query'/>"/></label>
</form:form>
<tags:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th style="width: 130px">服务名称</th>
        <th style="width: 50px">客户性质</th>
        <th style="width: 150px">企业名称</th>
        <th style="width: 50px">咨询人</th>
        <th style="width: 80px">联系电话</th>
        <th>咨询内容</th>
        <th style="width: 130px">咨询时间</th>
        <shiro:hasPermission name="qyfw:consulting:edit">
            <th style="width: 80px">操作</th>
        </shiro:hasPermission></tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="consulting">
        <tr>
            <td>${consulting.basicService.name}</td>
            <td>
                <c:if test="${consulting.customer.id == null}">
                    ${fns:getDictLabel(consulting.customerType, 'customer_type', '无')}
                </c:if>
                <c:if test="${consulting.customer.id != null}">
                    ${fns:getDictLabel(consulting.customer.customerType, 'customer_type', '无')}
                </c:if>
            </td>
            <td>
            	<c:if test="${empty consulting.companyName}">--</c:if>
            	<c:if test="${not empty consulting.companyName}">${order.companyName}</c:if>
            </td>
            <td>${consulting.person}</td>
            <td>${consulting.phone}</td>
            <td>${consulting.content}</td>
            <td><fmt:formatDate value="${consulting.time}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
            <shiro:hasPermission name="qyfw:consulting:edit">
                <td>
                    <a href="${ctx}/qyfw/consulting/deal?id=${consulting.id}">处理</a>
                    <a href="${ctx}/qyfw/consulting/detail?id=${consulting.id}"><spring:message code='order.details'/></a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>