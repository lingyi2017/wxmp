<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>用户信息</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
	    $(document).ready(function() {
	    	$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
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
    <li><a href="${ctx}/dcxt/account/">用户列表</a></li>
    <shiro:hasPermission name="dcxt:account:edit">
        <li class="active"><a>用户修改</a></li>
    </shiro:hasPermission>
</ul>

<form:form id="inputForm" modelAttribute="account" action="${ctx}/dcxt/account/save" method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <tags:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">姓名:</label>
        <div class="controls">
            <form:input path="name" htmlEscape="false" maxlength="50" class="required"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">电话:</label>
        <div class="controls">
            <form:input path="phone" htmlEscape="false" maxlength="50" cssClass="required phone"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">性别:</label>
        <div class="controls">
            <form:select path="sex">
                <form:options items="${fns:getDictList('dcxt_account_sex')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">年龄:</label>
        <div class="controls">
            <form:input path="age" htmlEscape="false" maxlength="50"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">身高(CM):</label>
        <div class="controls">
            <form:input path="height" htmlEscape="false" maxlength="50"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">体重(KG):</label>
        <div class="controls">
            <form:input path="weight" htmlEscape="false" maxlength="50"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">需求意向:</label>
        <div class="controls">
            <form:input path="intention" htmlEscape="false" maxlength="50"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">用户状态:</label>
        <div class="controls">
            <form:select path="status">
                <form:options items="${fns:getDictList('dcxt_account_status')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </div>
    </div>
    <div class="form-actions">
        <shiro:hasPermission name="dcxt:account:edit">
            <input id="btnSubmit" class="btn btn-primary" type="submit" value="<spring:message code='save' />"/>&nbsp;
        </shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="<spring:message code='return' />"
               onclick="history.go(-1)"/>
    </div>
</form:form>

</body>
</html>