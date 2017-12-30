<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>菜单管理</title>
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
            $("#searchForm").attr("action", "${ctx}/dcxt/foodMenu/");
            $("#searchForm").submit();
            return false;
        }
    </script>
</head>
<body>

<ul class="nav nav-tabs">
    <li class="active"><a>菜单列表</a></li>
    <shiro:hasPermission name="dcxt:foodMenu:edit">
        <li><a href="${ctx}/dcxt/foodMenu/addForm">菜单添加</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="foodMenu" action="${ctx}/dcxt/foodMenu/" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <input id="orderBy" name="orderBy" type="hidden" value="${page.orderBy}"/>

    <div style="margin-top:8px;">
        <label>状态：</label>
        <form:select path="state" cssClass="input-small">
            <form:option value="" label=""/>
            <form:options items="${fns:getDictList('dcxt_state')}" itemLabel="label" itemValue="value"
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
        <th class="sort createDate">时间</th>
        <th>状态</th>
        <th style="width:150px;">操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="entity">
        <tr>
            <td>${entity.addDate}</td>
            <td>${fns:getDictLabel(entity.state, 'dcxt_state', '无')}</td>
            <shiro:hasPermission name="dcxt:foodMenu:edit">
                <td>
                    <c:if test="${entity.state == 1}">
                        <a href="${ctx}/dcxt/foodMenu/updateState?id=${entity.id}&state=2"
                           onclick="return confirmx('确认要上架该菜单吗？', this.href)">上架</a>
                        <a href="${ctx}/dcxt/foodMenu/editForm?id=${entity.id}"><spring:message code='update'/></a>
                    </c:if>
                    <c:if test="${entity.state == 2}">
                        <a href="${ctx}/dcxt/foodMenu/updateState?id=${entity.id}&state=3"
                           onclick="return confirmx('确认要下架该菜单吗？', this.href)">下架</a>
                    </c:if>
                    <a href="${ctx}/dcxt/foodMenu/viewForm?id=${entity.id}"><spring:message code='check'/></a>
                    <a href="${ctx}/dcxt/foodMenu/delete?id=${entity.id}"
                       onclick="return confirmx('确认要删除该菜单吗？', this.href)"><spring:message code='delete'/></a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>