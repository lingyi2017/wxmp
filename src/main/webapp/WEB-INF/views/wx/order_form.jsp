<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fns" uri="/WEB-INF/tlds/fns.tld" %>
<html class="pixel-ratio-1">
<head>
    <title>订单详情</title>
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

<div class="weui-panel">
    <div class="weui-panel__bd">
        <div class="weui-media-box weui-media-box_small-appmsg">
            <div class="weui-cells">
                <a class="weui-cell weui-cell_access" href="javascript:;">
                    <div class="weui-cell__bd weui-cell_primary">
                        <p>企明星企业咨询管理有限公司</p>
                    </div>
                </a>
            </div>
        </div>
    </div>
</div>

<div class="weui-form-preview" style="margin-top: 20px">
    <div class="weui-form-preview__hd">
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">付款金额</label>
            <em class="weui-form-preview__value">¥${order.money }</em>
        </div>
    </div>
    <div class="weui-form-preview__bd">
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">当前状态</label>
            <span class="weui-form-preview__value">${fns:getDictLabel(order.status, 'order_status', '无')}</span>
        </div>
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">服务名称</label>
            <span class="weui-form-preview__value">${order.basicService.name }</span>
        </div>
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">联系人</label>
            <span class="weui-form-preview__value">${order.contact }</span>
        </div>
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">联系电话</label>
            <span class="weui-form-preview__value">${order.phone }</span>
        </div>
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">购买时间</label>
            <span class="weui-form-preview__value">${order.createDate }</span>
        </div>
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">支付方式</label>
            <span class="weui-form-preview__value">微信支付</span>
        </div>
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">处理反馈</label>
            <span class="weui-form-preview__value">${order.resp }</span>
        </div>
    </div>
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