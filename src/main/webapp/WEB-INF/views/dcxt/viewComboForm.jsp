<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>份量查看</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $("#name").focus();
        $("#inputForm").validate();
    </script>
</head>
<body>

<ul class="nav nav-tabs">
    <li><a href="${ctx}/dcxt/combo/">份量列表</a></li>
    <li class="active"><a>份量查看</a></li>
</ul>

<form:form id="inputForm" modelAttribute="combo" action="${ctx}/dcxt/combo/save" method="post"
           class="form-horizontal">
    <form:hidden path="id"/>
    <tags:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">产品:</label>
        <div class="controls">
            <label class="lbl">${combo.product.name}</label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">名称:</label>
        <div class="controls">
            <label class="lbl">${combo.name}</label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">状态:</label>
        <div class="controls">
            <label class="lbl">${fns:getDictLabel(combo.state, 'dcxt_state', '无')}</label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">价格:</label>
        <div class="controls">
            <label class="lbl">${combo.price}</label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">序号:</label>
        <div class="controls">
            <label class="lbl">${combo.sort}</label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">购买获得积分:</label>
        <div class="controls">
            <label class="lbl">${combo.gainIntegral}</label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">兑换所需积分:</label>
        <div class="controls">
            <label class="lbl">${combo.exchangeIntegral}</label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">适用人群:</label>
        <div class="controls">
            <label class="lbl">${combo.applicablePeople}</label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">备注:</label>
        <div class="controls">
            <label class="lbl">${combo.remarks}</label>
        </div>
    </div>
    <div class="form-actions">
        <input id="btnCancel" class="btn" type="button" value="<spring:message code='return' />"
               onclick="history.go(-1)"/>
    </div>
</form:form>

</body>
</html>