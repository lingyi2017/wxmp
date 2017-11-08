<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>材料</title>
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
 	<li class="active"><a href="${ctx}/qyfw/material/">材料列表</a></li>
	<shiro:hasPermission name="qyfw:material:edit">
    <li><a href="${ctx}/qyfw/material/form">分类添加</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="material" action="${ctx}/qyfw/material/" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>

    <label>客户性质 ：</label><label><form:select path="customerType">
                <form:options items="${fns:getDictList('customer_type')}" itemLabel="label"
                              itemValue="value" htmlEscape="false"/>
            	</form:select></label>
    <label>材料名称 ：</label><label><form:input path="name" htmlEscape="false" maxlength="50" class="input-small"/></label>&nbsp;
    <input id="btnSubmit" class="btn btn-primary" type="submit" value="<spring:message code='query'/>"/>
</form:form>
<tags:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>材料名称</th>
        <th>客户性质</th>
        <th>附件模板路径</th>
        <th>材料说明</th>
        <th>排序号</th>
        <shiro:hasPermission name="qyfw:material:edit">
            <th>操作</th>
        </shiro:hasPermission></tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="material">
        <tr>
            <td><a href="${ctx}/qyfw/material/form?id=${material.id}">${material.name}</a></td>
            <td>${fns:getDictLabel(material.customerType, 'customer_type', '无')}</td>
            <td>${material.path}</td>
            <td>${material.descption}</td>
            <td>${material.sort}</td>
            <shiro:hasPermission name="qyfw:material:edit">
                <td>
                    <a href="${ctx}/qyfw/material/form?id=${material.id}"><spring:message code='update'/></a>
                    <a href="${ctx}/qyfw/material/delete?id=${material.id}"
                       onclick="return confirmx('确认要删除该材料吗？', this.href)"><spring:message code='delete'/></a>
                    <a href="#"><spring:message code='download'/></a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<br/>
<div class="pagination">${page}</div>
</body>