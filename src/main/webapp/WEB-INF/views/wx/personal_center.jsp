<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html class="pixel-ratio-1">
<head>
    <title>企明星</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

    <link href="https://cdn.bootcss.com/weui/1.1.2/style/weui.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/jquery-weui/1.2.0/css/jquery-weui.min.css" rel="stylesheet">

    <style type="text/css">

        body {
            font-size: 14px;
            line-height: 1;
            overflow-x: hidden;
            max-width: 640px;
            margin: 0 auto;
            color: #333;
            background-color: #f5f5fa;
            -webkit-overflow-scrolling: touch;
            -webkit-touch-callout: none;
        }

    </style>
</head>
<body>

<div class="weui-panel weui-panel_access" >
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
    <a class="weui-cell weui-cell_access" href="${pageContext.request.contextPath}/qyfw/customer/wx_order_list?openid=${openid}">
        <div class="weui-cell__bd">
            <p style="color: #666;">订单列表</p>
        </div>
        <div class="weui-cell__ft">
        </div>
    </a>
    <a class="weui-cell weui-cell_access" href="${pageContext.request.contextPath}/qyfw/customer/wx_consulting_list?openid=${openid}">
        <div class="weui-cell__bd">
            <p style="color: #666;">咨询列表</p>
        </div>
        <div class="weui-cell__ft">
        </div>
    </a>
</div>

<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/jquery-weui.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/swiper.min.js"></script>
<script src="https://cdn.bootcss.com/fastclick/1.0.6/fastclick.min.js"></script>

<script type="text/javascript">
    $(function () {
        FastClick.attach(document.body);
    });
</script>
</body>
</html>