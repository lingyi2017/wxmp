<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                        <p>企明星</p>
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
            <em class="weui-form-preview__value">¥8888</em>
        </div>
    </div>
    <div class="weui-form-preview__bd">
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">当前状态</label>
            <span class="weui-form-preview__value">已购买</span>
        </div>
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">服务名称</label>
            <span class="weui-form-preview__value">车辆信用贷</span>
        </div>
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">商户全称</label>
            <span class="weui-form-preview__value">成都企明星咨询管理有限公司</span>
        </div>
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">支付时间</label>
            <span class="weui-form-preview__value">2017-12-29 23:23:23</span>
        </div>
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">支付方式</label>
            <span class="weui-form-preview__value">微信支付</span>
        </div>
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">交易单号</label>
            <span class="weui-form-preview__value">1111111222222223333</span>
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