<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>材料管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#value").focus();
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
		<li><a href="${ctx}/qyfw/material/">材料列表</a></li>
		<li class="active">添加材料<a href="${ctx}/qyfw/customer/form"></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="material" action="${ctx}/qyfw/material/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<tags:message content="${message}"/>
		<div class="control-group">
			<label class="control-label">材料名称:</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="50" class="required"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">客户性质:</label>
			<div class="controls">
				<form:select path="customerType">
                <form:options items="${fns:getDictList('customer_type')}" itemLabel="label"
                              itemValue="value" htmlEscape="false"/>
            	</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">附件模板上传:</label>
			<div class="controls">
				<form:input path="path" htmlEscape="false" maxlength="255"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">序号:</label>
			<div class="controls">
				<form:input path="sort" htmlEscape="false" maxlength="50" class="required"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">材料说明:</label>
			<div class="controls">
				<form:textarea path="descption" htmlEscape="false" rows="3" maxlength="200" class="input-xlarge"/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="qyfw:customer:edit">
				<input id="btnSubmit" class="btn btn-primary" type="submit" value="<spring:message code='save' />"/>&nbsp;
			</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="<spring:message code='return' />" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>