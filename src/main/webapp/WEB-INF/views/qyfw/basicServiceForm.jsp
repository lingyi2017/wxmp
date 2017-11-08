<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>基础服务管理</title>
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
		<li><a href="${ctx}/qyfw/basicService/">基础服务列表</a></li>
		<li class="active">添加基础服务<a href="${ctx}/qyfw/basicService/form"></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="basicService" action="${ctx}/qyfw/basicService/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<tags:message content="${message}"/>
		<div class="control-group">
			<label class="control-label">基础服务名称:</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="50" class="required"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">支持客户性质:</label>
			<div class="controls">
				<form:select path="customerType">
                <form:options items="${fns:getDictList('customer_type')}" itemLabel="label"
                              itemValue="value" htmlEscape="false"/>
            	</form:select>
			</div>
		</div>
		<div class="control-group">
        <label class="control-label">上级分类:</label>
	        <div class="controls">
	            <tags:treeselect id="serviceCategory" name="serviceCategory.id" value="${serviceCategory.parent.id}"
	                             labelName="parent.name" labelValue="${serviceCategory.parent.name}"
	                             title="服务分类" url="/qyfw/serviceCategory/treeData" extId="${serviceCategory.id}"
	                             cssClass="required"/>
	        </div>
    	</div>
    	<div class="control-group">
			<label class="control-label">是否显示:</label>
			<div class="controls">
				<form:select path="isEnable">
				<form:option value="1">是</form:option>
				<form:option value="0">否</form:option>
            	</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">热点服务:</label>
			<div class="controls">
				<form:select path="isHot">
				<form:option value="0">否</form:option>
				<form:option value="1">是</form:option>
            	</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">支持购买:</label>
			<div class="controls">
				<form:select path="isBuy">
				<form:option value="0">否</form:option>
				<form:option value="1">是</form:option>
            	</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">服务价格:</label>
			<div class="controls">
				<form:input path="price" htmlEscape="false" maxlength="50"/>
			</div>
		</div>
		<%-- <div class="control-group">
			<label class="control-label">所需个人材料:</label>
			<div class="controls">
				<form:checkboxes path="basicServiceMaterials" items="${peopleMaterialList}" itemLabel="name" itemValue="id" htmlEscape="false" class="required"/>
			</div>
		</div> --%>
		<%-- <div class="control-group">
			<label class="control-label">所需公司材料:</label>
			<div class="controls">
				<form:checkboxes path="basicServiceMaterials" items="${companyMaterialList}" itemLabel="name" itemValue="id" htmlEscape="false" class="required"/>
			</div>
		</div> --%>
		
		<div class="control-group">
			<label class="control-label">排序:</label>
			<div class="controls">
				<form:input path="sort" htmlEscape="false" maxlength="50" class="required"/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="qyfw:basicService:edit">
				<input id="btnSubmit" class="btn btn-primary" type="submit" value="<spring:message code='save' />"/>&nbsp;
			</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="<spring:message code='return' />" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>