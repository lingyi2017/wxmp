<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>模板下载</title>
    <meta name="decorator" content="default"/>
    <script src="${ctxStatic}/artDialog/artDialog.js?skin=blue"></script>
    <script src="${ctxStatic}/artDialog/plugins/iframeTools.js"></script>
    <script type="text/javascript">

    </script>
</head>
<body>

<div class="row" style="margin-top: 40px; margin-bottom: 40px; text-align: center">
    <c:forEach items="${pathList}" var="path" varStatus="index">
        <a href="${ctx}/file/download?path=${path}" title="点击下载" style="padding-left: 10px;">
            <img src="${ctx}/${path}" style="width: 140px;height: 140px" class="img-rounded">
        </a>
    </c:forEach>
</div>

</body>
</html>