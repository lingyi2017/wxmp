<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/wx/_head.jsp" %>
<html>
<head>
    <title>订单列表</title>
    <style type="text/css">
        .placeholder {
            height: 1.5em;
            line-height: 1.5em;
        }
    </style>
</head>
<body>
<c:if test="${!empty orderList}">
    <div class="weui-panel">
        <div class="weui-panel__bd">
        </div>
    </div>
    <c:forEach items="${orderList }" var="order">
        <div class="weui-panel">
            <div class="weui-panel__bd" onclick="order_form('${order.id}')">
                <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
                    <div class="weui-media-box__hd">
                        <img class="weui-media-box__thumb" src="${pageContext.request.contextPath}/static/images/wx/icon-msg-1.png" alt="">
                    </div>
                    <div class="weui-media-box__bd">
                        <div class="weui-flex">
                            <div class="weui-flex__item">
                                <div class="placeholder left" style="color: #000;">${order.basicService.name }</div>
                            </div>
                            <div class="weui-flex__item">
                                <div class="placeholder right" style="font-weight: bold; font-size: 16px">${order.money}</div>
                            </div>
                        </div>
                        <div class="weui-flex">
                            <div class="weui-flex__item">
                                <div class="placeholder left" style="color: #BBB;"><fmt:formatDate value="${order.createDate}" pattern="yyyy-MM-dd hh:mm:ss"/></div>
                            </div>
                        </div>
                    </div>
                </a>


            </div>
        </div>
    </c:forEach>
</c:if>
<c:if test="${empty orderList}">
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
    function order_form(orderId) {
        window.location.href = "${pageContext.request.contextPath}/qyfw/order/wx_order_form?orderId=" + orderId;
    };
</script>
</body>
</html>