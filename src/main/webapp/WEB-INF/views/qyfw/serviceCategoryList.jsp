<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>服务分类</title>
    <meta name="decorator" content="default"/>
    <%@include file="/WEB-INF/views/include/treetable.jsp" %>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#treeTable").treeTable({expandLevel: 2});
        });
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
    <li class="active"><a href="${ctx}/qyfw/serviceCategory/">分类列表</a></li>
    <shiro:hasPermission name="qyfw:serviceCategory:edit">
        <li><a href="${ctx}/qyfw/serviceCategory/form">分类添加</a></li>
    </shiro:hasPermission>
</ul>
<tags:message content="${message}"/>
<table id="treeTable" class="table table-striped table-bordered table-condensed">
    <tr>
        <th>服务名称</th>
        <th>是否显示</th>
        <th>重点标记</th>
        <th>序号</th>
        <th>微信菜单ID</th>
        <shiro:hasPermission name="qyfw:serviceCategory:edit">
            <th><spring:message code='operation'/></th>
        </shiro:hasPermission></tr>
    <c:forEach items="${list}" var="serviceCategory">
        <tr id="${serviceCategory.id}"
            pId="${serviceCategory.parent.id ne requestScope.serviceCategory.id?serviceCategory.parent.id:'0'}">
            <td><a href="${ctx}/qyfw/serviceCategory/form?id=${serviceCategory.id}">${serviceCategory.name}</a></td>
            <td>2</td>
            <td>1</td>
            <td>${serviceCategory.sort}</td>
            <td>${serviceCategory.wxMenuId}</td>
            <shiro:hasPermission name="qyfw:serviceCategory:edit">
                <td>
                    <a href="${ctx}/qyfw/serviceCategory/form?id=${serviceCategory.id}"><spring:message
                            code='update'/></a>
                    <a href="${ctx}/qyfw/serviceCategory/delete?id=${serviceCategory.id}"
                       onclick="return confirmx('要删除该分类及所有子分类吗？', this.href)"><spring:message code='delete'/></a>
                    <a href="${ctx}/qyfw/serviceCategory/form?parent.id=${serviceCategory.id}">添加下级分类</a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
</table>
</body>
</html>