<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/wx/_head.jsp" %>
<html>
<head>
    <title><spring:message code='wx.title'/></title>
    <style type="text/css">
    </style>
</head>
<body>

<div class="weui-panel weui-panel_access" style="margin-top: 20px;">
    <div class="weui-panel__bd">
        <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
            <div class="weui-media-box__hd">
                <img class="weui-media-box__thumb" src="${wxUser.headImgUrl}" alt="">
            </div>
            <div class="weui-media-box__bd">
                <h4 class="weui-media-box__title" style="color: black;">${wxUser.nickname }</h4>
                <!-- <p class="weui-media-box__desc" style="margin-top: 10px; color: orange;">性质：个人</p> -->
            </div>
        </a>
    </div>
</div>
<div class="weui-cells">
    <a class="weui-cell weui-cell_access"
       href="${pageContext.request.contextPath}/qyfw/customer/wx_order_list?openid=${openid}">
        <div class="weui-cell__hd"><img src="${pageContext.request.contextPath}/static/images/wx/icon-msg-1.png" alt=""
                                        style="width:20px;margin-right:5px;display:block"></div>
        <div class="weui-cell__bd weui-cell_primary ml10">
            <p style="color: #666;">订单列表</p>
        </div>
        <div class="weui-cell__ft">
        </div>
    </a>
    <a class="weui-cell weui-cell_access"
       href="${pageContext.request.contextPath}/qyfw/customer/wx_consulting_list?openid=${openid}">
        <div class="weui-cell__hd"><img src="${pageContext.request.contextPath}/static/images/wx/icon-msg-2.png" alt=""
                                        style="width:20px;margin-right:5px;display:block"></div>
        <div class="weui-cell__bd weui-cell_primary ml10">
            <p style="color: #666;">咨询列表</p>
        </div>
        <div class="weui-cell__ft">
        </div>
    </a>
</div>

<%@ include file="/WEB-INF/views/wx/_foot.jsp" %>
<script type="text/javascript">
</script>
</body>
</html>