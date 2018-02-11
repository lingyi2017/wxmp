<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>餐标管理</title>
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
            $("#searchForm").attr("action", "${ctx}/dcxt/meal/");
            $("#searchForm").submit();
            return false;
        }
    </script>
</head>
<body>

<ul class="nav nav-tabs">
    <li class="active"><a>餐标列表</a></li>
    <shiro:hasPermission name="dcxt:meal:edit">
        <li><a href="${ctx}/dcxt/meal/form">餐标添加</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="meal" action="${ctx}/dcxt/meal/" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <input id="orderBy" name="orderBy" type="hidden" value="${page.orderBy}"/>

    <div style="margin-top:8px;">
        <label>餐标名称：</label>
        <form:input path="type" cssClass="input-small"/>&nbsp;
        <label>状态：</label>
        <form:select path="state" cssClass="input-small">
            <form:option value="" label=""/>
            <form:options items="${fns:getDictList('dcxt_meal_state')}" itemLabel="label" itemValue="value"
                          htmlEscape="false"/>
        </form:select>&nbsp;&nbsp;
        <input id="btnSubmit" class="btn btn-primary" type="submit" value="<spring:message code='query' />"
               onclick="return page();"/>
    </div>
</form:form>
<tags:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>餐标名称</th>
        <th>状态</th>
        <th class="sort createDate">添加时间</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="entity">
        <tr>
            <td>${entity.type}</td>
            <td>${fns:getDictLabel(entity.state, 'dcxt_meal_state', '无')}</td>
            <td><fmt:formatDate value='${entity.createDate}' type="both"/></td>
            <shiro:hasPermission name="dcxt:meal:edit">
                <td>
                    <c:if test="${entity.state == 1}">
                        <a href="${ctx}/dcxt/meal/updateState?id=${entity.id}&state=2"
                           onclick="return confirmx('确认要启用该餐标吗？', this.href)">启用</a>
                        <a href="${ctx}/dcxt/meal/form?id=${entity.id}"><spring:message code='update'/></a>
                    </c:if>
                    <c:if test="${entity.state == 2}">
                        <a href="${ctx}/dcxt/meal/updateState?id=${entity.id}&state=3"
                           onclick="return confirmx('确认要启用该餐标吗？', this.href)">不启用</a>
                    </c:if>
                    <a href="${ctx}/dcxt/meal/viewForm?id=${entity.id}"><spring:message code='check'/></a>
                    <a href="${ctx}/dcxt/meal/delete?id=${entity.id}"
                       onclick="return confirmx('确认要删除该餐标吗？', this.href)"><spring:message code='delete'/></a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>