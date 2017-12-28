<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            font-size: 17px;
            line-height: 1;
            overflow-x: hidden;
            max-width: 640px;
            margin: 0 auto;
            color: #333;
            background-color: #f5f5fa;
            -webkit-overflow-scrolling: touch;
            -webkit-touch-callout: none;
        }

        .header {
            background-color: #3475eb;
            height: 50px;
            line-height: 35px;
            top: 0px;
            width: 100%;
        }

        .header h3 {
            color: white;
            margin-left: 40%;
        }

    </style>
</head>
<body>

<div class="weui-search-bar header" id="searchBar">
    <h3>服务购买</h3>
</div>
<div class="weui-form-preview">
    <div class="weui-form-preview__bd">
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label" style="font-size: 17px">价格</label>
            <span class="weui-form-preview__value" style="color: red; font-size: 20px">¥8888</span>
        </div>
    </div>
    <div class="weui-form-preview__bd">
        <div class="weui-form-preview__item" style="font-size: 17px">
            <label class="weui-form-preview__label">名称</label>
            <span class="weui-form-preview__value">
                车辆信用贷
            </span>
        </div>
    </div>
</div>

<div class="weui-cells weui-cells_form">
    <div class="weui-cell" style="font-size: 17px;color: #999;">
        <div class="weui-cell__hd"><label class="weui-label">联系方式</label></div>
        <div class="weui-cell__bd">
            <input class="weui-input">
        </div>
    </div>
</div>
<div class="weui-panel">
    <div class="weui-panel__hd"><p style="font-size: 17px">支付方式</p></div>
    <div class="weui-panel__bd">
        <div class="weui-media-box weui-media-box_small-appmsg">
            <div class="weui-cells">
                <a class="weui-cell weui-cell_access" href="javascript:;">
                    <div class="weui-cell__hd"><i class="weui-icon-success"></i></div>
                    <div class="weui-cell__bd weui-cell_primary">
                        <p style="font-size: 17px; color: #999;">微信支付</p>
                    </div>
                </a>
            </div>
        </div>
    </div>
</div>
<div class="weui-form-preview__ft">
    <button type="submit" class="weui-form-preview__btn weui-form-preview__btn_primary"
            style="background-color: red; color: white;" href="javascript:">确认支付
    </button>
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