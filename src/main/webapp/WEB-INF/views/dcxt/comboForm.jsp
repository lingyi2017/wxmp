<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>份量信息</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $("#name").focus();
        $("#inputForm").validate();
    </script>
</head>
<body>

<ul class="nav nav-tabs">
    <li><a href="${ctx}/dcxt/combo/">份量列表</a></li>
    <shiro:hasPermission name="dcxt:combo:edit">
        <li class="active"><a>份量${not empty combo.id ? '修改' : '添加'}</a></li>
    </shiro:hasPermission>
</ul>

<form:form id="inputForm" modelAttribute="combo" action="${ctx}/dcxt/combo/save" method="post"
           class="form-horizontal">
    <form:hidden path="id"/>
    <tags:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">产品:</label>
        <div class="controls">
            <form:select path="product.id">
                <form:option value="" label=""/>
                <c:forEach items="${products}" var="product">
                    <form:option value="${product.id}" label="${product.name}"/>
                </c:forEach>
            </form:select>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">名称:</label>
        <div class="controls">
            <form:input path="name" htmlEscape="false" maxlength="50" class="required"/>
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
        <label class="control-label">价格:</label>
        <div class="controls">
            <form:input path="price" htmlEscape="false" maxlength="50" class="required"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">购买获得积分:</label>
        <div class="controls">
            <form:input path="gainIntegral" htmlEscape="false" maxlength="50" class="required"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">兑换所需积分:</label>
        <div class="controls">
            <form:input path="exchangeIntegral" htmlEscape="false" maxlength="50" class="required"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">适用人群:</label>
        <div class="controls">
            <form:textarea path="applicablePeople" htmlEscape="false" rows="3" maxlength="200" class="input-xlarge"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">备注:</label>
        <div class="controls">
            <form:textarea path="remarks" htmlEscape="false" rows="2" maxlength="200" class="input-xlarge"/>
        </div>
    </div>
    <div class="form-actions">
        <shiro:hasPermission name="dcxt:combo:edit">
            <input id="btnSubmit" class="btn btn-primary" type="submit" value="<spring:message code='save' />"/>&nbsp;
        </shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="<spring:message code='return' />"
               onclick="history.go(-1)"/>
    </div>
</form:form>

</body>
</html>