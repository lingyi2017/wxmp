<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>基础服务</title>
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
 	<li class="active"><a href="${ctx}/qyfw/basicService/">服务列表</a></li>
	<shiro:hasPermission name="qyfw:basicService:edit">
    <li><a href="${ctx}/qyfw/basicService/form">基础服务添加</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="basicService" action="${ctx}/qyfw/basicService/" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>

    <label>客户性质 ：</label><label><form:select path="customerType">
                <form:options items="${fns:getDictList('customer_type')}" itemLabel="label"
                              itemValue="value" htmlEscape="false"/>
            	</form:select></label>
    <label>基础服务名称 ：</label><label><form:input path="name" htmlEscape="false" maxlength="50" class="input-small"/></label>&nbsp;
    <input id="btnSubmit" class="btn btn-primary" type="submit" value="<spring:message code='query'/>"/>
</form:form>
<tags:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>基础服务名称</th>
        <th>支持性质</th>
        <th>服务分类</th>
        <th>是否显示</th>
        <th>热点服务</th>
        <th>支持购买</th>
        <th>服务价格</th>
        <th>排序号</th>
        <shiro:hasPermission name="qyfw:basicService:edit">
            <th>操作</th>
        </shiro:hasPermission></tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="basicService">
        <tr>
            <td><a href="${ctx}/qyfw/basicService/form?id=${basicService.id}">${basicService.name}</a></td>
            <td>${fns:getDictLabel(basicService.customerType, 'customer_type', '无')}</td>
            <td></td>
            <td>${fns:getDictLabel(basicService.isEnable, 'public_yesorno', '无')}</td>
            <td>${fns:getDictLabel(basicService.isHot, 'public_yesorno', '无')}</td>
            <td>${fns:getDictLabel(basicService.isBuy, 'public_yesorno', '无')}</td>
            <td>${basicService.price }</td>
            <td>${basicService.sort }</td>
            <shiro:hasPermission name="qyfw:basicService:edit">
                <td>
                    <a href="${ctx}/qyfw/basicService/form?id=${basicService.id}"><spring:message code='update'/></a>
                    <a href="${ctx}/qyfw/basicService/delete?id=${basicService.id}"
                       onclick="return confirmx('确认要删除该基础服务吗？', this.href)"><spring:message code='delete'/></a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<br/>
<div class="pagination">${page}</div>
</body>