<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/wx/_head.jsp" %>
<html>
<head>
    <title>订单列表</title>
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
<c:if test="${!empty orderList}">
    <div class="weui-panel">
        <div class="weui-panel__bd">
        </div>
    </div>
    <c:forEach items="${orderList }" var="order">
        <div class="weui-panel">
            <div class="weui-panel__bd">

                <div class="weui-flex" onclick="order_form('${order.id}')">
                    <div class="weui-flex__item">
                        <div class="placeholder left" style="color: #000;">${order.basicService.name }</div>
                    </div>
                    <div class="weui-flex__item">
                        <div class="placeholder right" style="font-weight: bold; font-size: 16px">${order.money }</div>
                    </div>
                </div>
                <div class="weui-flex">
                    <div class="weui-flex__item">
                        <div class="placeholder left" style="color: #BBB;">${order.createDate}</div>
                    </div>
                </div>


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