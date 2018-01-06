<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/wx/_head.jsp" %>
<html>
<head>
    <title>咨询列表</title>
    <style type="text/css">
        .placeholder {
            margin: 2px;
            padding: 0 12px;
            height: 1.5em;
            line-height: 1.5em;
        }

        .left {
            text-align: left;
        }

        .right {
            text-align: right;
        }

    </style>
</head>
<body>
<c:if test="${!empty consultingList}">
    <div class="weui-panel">
        <div class="weui-panel__bd">
        </div>
    </div>
    <c:forEach items="${consultingList }" var="consulting">
        <div class="weui-panel">
            <div class="weui-panel__bd" onclick="consulting_form('${consulting.id}')">
                <div class="weui-flex">
                    <div class="weui-flex__item">
                        <div class="placeholder left" style="color: #000;">${consulting.basicService.name }</div>
                    </div>
                    <div class="weui-flex__item">
                        <div class="placeholder right" style="color: red;">${fns:getDictLabel(consulting.dealStatus, 'consulting_status', '无')}</div>
                    </div>
                </div>
                <div class="weui-flex">
                    <div class="weui-flex__item">
                        <div class="placeholder left" style="color: #BBB;">${consulting.time }</div>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</c:if>

<c:if test="${empty consultingList}">
    <div style="margin-top: 60%; text-align: center;">
        <div>
            <img src="${pageContext.request.contextPath}/static/images/wx/busideal.png">
        </div>
        <div style="color: #aaa; margin-top: 8px;">
            订单列表为空
        </div>
    </div>
</c:if>

<%@ include file="/WEB-INF/views/wx/_foot.jsp" %>
<script type="text/javascript">
    function consulting_form(consultingId){
    	window.location.href="${pageContext.request.contextPath}/qyfw/consulting/wx_consulting_form?consultingId="+consultingId;
    };
</script>
</body>
</html>