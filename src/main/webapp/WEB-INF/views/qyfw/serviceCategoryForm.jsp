<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>分类管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#name").focus();
            $("#inputForm").validate({
                submitHandler: function (form) {
                    loading('正在提交，请稍等...');
                    form.submit();
                },
                errorContainer: "#messageBox",
                errorPlacement: function (error, element) {
                    $("#messageBox").text("输入有误，请先更正。");
                    if (element.is(":checkbox") || element.is(":radio") || element.parent().is(".input-append")) {
                        error.appendTo(element.parent().parent());
                    } else {
                        error.insertAfter(element);
                    }
                }
            });
        });
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/qyfw/serviceCategory/">分类列表</a></li>
    <li class="active"><a
            href="form?id=${serviceCategory.id}&parent.id=${serviceCategory.parent.id}">分类<shiro:hasPermission
            name="qyfw:serviceCategory:edit">${not empty serviceCategory.id?'修改':'添加'}</shiro:hasPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="serviceCategory" action="${ctx}/qyfw/serviceCategory/save" method="post"
           class="form-horizontal">
    <form:hidden path="id"/>
    <tags:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">上级分类:</label>
        <div class="controls">
            <tags:treeselect id="serviceCategory" name="parent.id" value="${serviceCategory.parent.id}"
                             labelName="parent.name" labelValue="${serviceCategory.parent.name}"
                             title="服务分类" url="/qyfw/serviceCategory/treeData" extId="${serviceCategory.id}"
                             cssClass="required"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">名称:</label>
        <div class="controls">
            <form:input path="name" htmlEscape="false" maxlength="50" class="required"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">是否显示:</label>
        <div class="controls">
            <form:select path="isEnable">
                <form:options items="${fns:getDictList('service_category_is_enable')}" itemLabel="label"
                              itemValue="value" htmlEscape="false"/>
            </form:select>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">是否重点显示:</label>
        <div class="controls">
            <form:select path="isImportant">
                <form:options items="${fns:getDictList('service_category_is_important')}" itemLabel="label"
                              itemValue="value" htmlEscape="false"/>
            </form:select>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">序号:</label>
        <div class="controls">
            <form:input path="sort" htmlEscape="false"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">微信菜单ID:</label>
        <div class="controls">
            <form:input path="wxMenuId" htmlEscape="false"/>
        </div>
    </div>
    <div class="form-actions">
        <shiro:hasPermission name="qyfw:serviceCategory:edit">
            <input id="btnSubmit" class="btn btn-primary" type="submit" value="<spring:message code='save' />"/>&nbsp;
        </shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="<spring:message code='return' />"
               onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>