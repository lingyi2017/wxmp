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
    <h3>小额贷款</h3>
</div>
<div class="weui-form-preview">
    <div class="weui-form-preview__hd">
        <label class="weui-form-preview__label">价格</label>
        <span class="weui-form-preview__value">¥8888</span>
    </div>
    <div class="weui-form-preview__bd">
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">服务名称</label>
            <span class="weui-form-preview__value">车辆信用贷</span>
        </div>
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">支持客户性质</label>
            <span class="weui-form-preview__value">个人、企业</span>
        </div>
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">是否支持购买</label>
            <span class="weui-form-preview__value">支持</span>
        </div>
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">个人材料</label>
            <span class="weui-form-preview__value">身份证、户口簿</span>
        </div>
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">企业材料</label>
            <span class="weui-form-preview__value">身份证、营业执照</span>
        </div>
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">服务介绍</label>
            <span class="weui-form-preview__value">
                车身侧面采用双腰线设计，强调车身线条在三位空间的变化，让光影形成从上而下流淌、从前到后流转的丰富变化，呈现完美的视觉效果。
            </span>
        </div>
    </div>
    <div class="weui-form-preview__ft">
        <a class="weui-form-preview__btn weui-form-preview__btn_default" style="color: #3475eb;" href="javascript:">我要咨询</a>
        <button type="submit" class="weui-form-preview__btn weui-form-preview__btn_primary"
                style="background-color: #3475eb; color: white;" href="javascript:">我要购买
        </button>
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
