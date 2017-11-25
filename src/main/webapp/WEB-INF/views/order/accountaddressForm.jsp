<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>收货地址信息</title>
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
     <li class="active"><a>收货地址修改</a></li>
</ul>

<form:form id="inputForm" modelAttribute="accountaddress" action="${ctx}/dcxt/accountaddress/save" method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <tags:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">收货人:</label>
        <div class="controls">
            <form:input path="person" htmlEscape="false" maxlength="50" class="required"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">收货人电话:</label>
        <div class="controls">
            <form:input path="phone" htmlEscape="false" maxlength="50" cssClass="required phone"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">收货地址:</label>
        <div class="controls">
            <form:textarea path="address" htmlEscape="false" rows="2" maxlength="200" class="input-xlarge"/>
        </div>
    </div>
    
    <div class="form-actions">
        <input id="btnSubmit" class="btn btn-primary" type="submit" value="<spring:message code='save' />"/>&nbsp;
        <input id="btnCancel" class="btn" type="button" value="<spring:message code='return' />"
               onclick="history.go(-1)"/>
    </div>
</form:form>

</body>
</html>