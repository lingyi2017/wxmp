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
<c:forEach items="${pathList}" var="path">
    ${path}
</c:forEach>
</body>
</html>