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
					var chk_value =[]; 
					$('input[name="customerTypeBox"]:checked').each(function(){ 
						chk_value.push($(this).val()); 
					});
					$("#customerType").val(chk_value);
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
			//初始化服务价格状态
			changeBuy();
			//初始化材料状态
			$("#peopleMaterialIds").css("display", "none");
			$("#companyMaterialIds").css("display", "none");
			var customerType = $("#customerType").val();
			if(customerType !==null && customerType !== undefined && customerType != ""){
				var value = customerType.split(",");
				for(var i=0;i<value.length;i++){  
			        $(":checkbox[value='"+value[i]+"']").prop("checked",true);
			        if(value[i] == '1'){
						$("#peopleMaterialIds").css("display", "");
					}
					if(value[i] == '2'){
						$("#companyMaterialIds").css("display", "");
					}
			    }
			}
		});
		function changeCustomerType(){
			$("#peopleMaterialIds").css("display", "none");
			$("#companyMaterialIds").css("display", "none");
			$('input[name="customerTypeBox"]:checked').each(function(){
				if($(this).val() == '1'){
					$("#peopleMaterialIds").css("display", "");
				}
				if($(this).val() == '2'){
					$("#companyMaterialIds").css("display", "");
				}  
			});
		}
		function changeBuy(){
			if($("#isBuy").val() == "1"){
				$("#price").css("display", "");
			}else{
				$("#price").css("display", "none");
			}
		}
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
				<form:hidden path="customerType"/>
				<input type="checkbox" name="customerTypeBox" value="1" onchange="changeCustomerType()">个人
				<input type="checkbox" name="customerTypeBox" value="2" onchange="changeCustomerType()">企业
			</div>
		</div>
		<div class="control-group">
        	<label class="control-label">上级分类:</label>
	        <div class="controls">
            <tags:treeselect id="serviceCategory" name="serviceCategory.id" value="${basicService.serviceCategory.id}"
                             labelName="serviceCategory.name" labelValue="${basicService.serviceCategory.name}"
                             title="服务分类" url="/qyfw/serviceCategory/treeData" 
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
				<form:select path="isBuy" onchange="changeBuy()">
				<form:option value="0">否</form:option>
				<form:option value="1">是</form:option>
            	</form:select>
			</div>
		</div>
		<div class="control-group" id="price">
			<label class="control-label">服务价格:</label>
			<div class="controls">
				<form:input path="price" htmlEscape="false" maxlength="50"/>
			</div>
		</div>
		<div class="control-group" id="peopleMaterialIds">
			<label class="control-label">所需个人材料:</label>
			<div class="controls">
				<form:checkboxes path="peopleMaterialList" items="${peopleMaterialList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
			</div>
		</div>
		<div class="control-group" id="companyMaterialIds">
			<label class="control-label">所需公司材料:</label>
			<div class="controls">
				<form:checkboxes path="companyMaterialIds" items="${companyMaterialList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
			</div>
		</div>
		
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