<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="pixel-ratio-1">
<head>
    <title>产品菜品</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

    <link href="https://cdn.bootcss.com/weui/1.1.2/style/weui.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/jquery-weui/1.2.0/css/jquery-weui.min.css" rel="stylesheet">

    <style type="text/css">
        body {
            font-size: 12px;
            line-height: 1;
            overflow-x: hidden;
            max-width: 640px;
            margin: 0 auto;
            color: #333;
            background-color: #f0f0f0;
            -webkit-overflow-scrolling: touch;
            -webkit-touch-callout: none;
        }

        .meal {
            border-top: solid #eee 1px;
        }

        .dish {
            margin-right: 5px;
        }
    </style>
</head>
<body>
<div class="weui-tab" style="height: 50%;">
    <div class="weui-navbar">
        <a class="weui-navbar__item weui-bar__item--on" href="#tab1">
            周一
        </a>
        <a class="weui-navbar__item" href="#tab2">
            周二
        </a>
        <a class="weui-navbar__item" href="#tab3">
            周三
        </a>
        <a class="weui-navbar__item" href="#tab4">
            周四
        </a>
        <a class="weui-navbar__item" href="#tab5">
            周五
        </a>
    </div>
    <div class="weui-tab__bd">
        <div id="tab1" class="weui-tab__bd-item weui-tab__bd-item--active meal">
            <div class="weui-panel weui-panel_access">
                <div class="weui-panel__bd">
                    <div class="weui-media-box weui-media-box_text">
                        <div class="weui-media-box__bd">
                            <h4 class="weui-media-box__title">早餐</h4>
                            <p class="weui-media-box__desc">
                                <label class="dish">豆浆</label>
                                <label class="dish">油条</label>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="weui-panel weui-panel_access">
                <div class="weui-panel__bd">
                    <div class="weui-media-box weui-media-box_text">
                        <div class="weui-media-box__bd">
                            <h4 class="weui-media-box__title">午餐</h4>
                            <p class="weui-media-box__desc">
                                <label class="dish">米饭</label>
                                <label class="dish">鱼香肉丝</label>
                                <label class="dish">麻婆豆腐</label>
                                <label class="dish">番茄蛋汤</label>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="weui-panel weui-panel_access">
                <div class="weui-panel__bd">
                    <div class="weui-media-box weui-media-box_text">
                        <div class="weui-media-box__bd">
                            <h4 class="weui-media-box__title">晚餐</h4>
                            <p class="weui-media-box__desc">
                                <label class="dish">米饭</label>
                                <label class="dish">土豆丝</label>
                                <label class="dish">干煸四季豆</label>
                                <label class="dish">小菜汤</label>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="weui-panel weui-panel_access">
                <div class="weui-panel__bd">
                    <div class="weui-media-box weui-media-box_text">
                        <div class="weui-media-box__bd">
                            <h4 class="weui-media-box__title">加餐</h4>
                            <p class="weui-media-box__desc">
                                <label class="dish">苹果</label>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="tab2" class="weui-tab__bd-item">
            <h1>页面二</h1>
        </div>
        <div id="tab3" class="weui-tab__bd-item">
            <h1>页面三</h1>
        </div>
        <div id="tab4" class="weui-tab__bd-item">
            <h1>页面四</h1>
        </div>
        <div id="tab5" class="weui-tab__bd-item">
            <h1>页面五</h1>
        </div>
    </div>
</div>

<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/jquery-weui.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/swiper.min.js"></script>

<script type="text/javascript">

</script>
</body>
</html>
