<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>餐标信息</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">

        $("#type").focus();
        $("#inputForm").validate();

    </script>
</head>
<body>

<ul class="nav nav-tabs">
    <li><a href="${ctx}/dcxt/meal/">餐标列表</a></li>
    <shiro:hasPermission name="dcxt:meal:edit">
        <li class="active"><a>餐标${not empty meal.id ? '修改' : '添加'}</a></li>
    </shiro:hasPermission>
</ul>

<form:form id="inputForm" modelAttribute="meal" action="${ctx}/dcxt/meal/save" method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <tags:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">类型:</label>
        <div class="controls">
            <form:select path="type">
                <form:options items="${fns:getDictList('dcxt_meal_type')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">状态:</label>
        <div class="controls">
            <form:select path="state">
                <form:options items="${fns:getDictList('dcxt_state')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">描述:</label>
        <div class="controls">
            <form:textarea path="description" htmlEscape="false" rows="3" maxlength="200" class="input-xlarge"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">备注:</label>
        <div class="controls">
            <form:textarea path="remarks" htmlEscape="false" rows="2" maxlength="200" class="input-xlarge"/>
        </div>
    </div>
    <div class="form-actions">
        <shiro:hasPermission name="dcxt:meal:edit">
            <input id="btnSubmit" class="btn btn-primary" type="submit" value="<spring:message code='save' />"/>&nbsp;
        </shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="<spring:message code='return' />"
               onclick="history.go(-1)"/>
    </div>
</form:form>

</body>
</html>