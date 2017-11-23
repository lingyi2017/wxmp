<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>用户管理</title>
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
            $("#searchForm").attr("action", "${ctx}/dcxt/account/");
            $("#searchForm").submit();
            return false;
        }
    </script>
</head>
<body>

<ul class="nav nav-tabs">
    <li class="active"><a>用户列表</a></li>
    <shiro:hasPermission name="dcxt:account:edit">
        <li><a href="${ctx}/dcxt/account/form">用户修改</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="dish" action="${ctx}/dcxt/dish/" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <input id="orderBy" name="orderBy" type="hidden" value="${page.orderBy}"/>

    <div style="margin-top:8px;">
        <label>姓名：</label><form:input path="name" htmlEscape="false" maxlength="50" class="input-small"/>&nbsp;
        <label>电话：</label><form:input path="name" htmlEscape="false" maxlength="50" class="input-small"/>&nbsp;
        <input id="btnSubmit" class="btn btn-primary" type="submit" value="<spring:message code='query' />"
               onclick="return page();"/>
    </div>
</form:form>
<tags:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>姓名</th>
        <th>电话</th>
        <th>性别</th>
        <th>年龄</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="entity">
        <tr>
            <td>${entity.name}</td>
            <td>${entity.phone}</td>
            <td>${entity.sex}</td>
            <td>${entity.age}</td>
            <shiro:hasPermission name="dcxt:account:edit">
                <td>
                    <a href="${ctx}/dcxt/account/form?id=${entity.id}">修改</a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>