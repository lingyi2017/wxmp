<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="pixel-ratio-1">
<head>
    <title>产品信息</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

    <link href="https://cdn.bootcss.com/weui/1.1.2/style/weui.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/jquery-weui/1.2.0/css/jquery-weui.min.css" rel="stylesheet">

    <style type="text/css">
        .swiper-container {
            width: 100%;
        }

        .swiper-container img {
            display: block;
            width: 100%;
        }
    </style>
</head>
<body>

<div class="swiper-container" data-space-between='10' data-pagination='.swiper-pagination' data-autoplay="1000"
     style="height: 30%;">
    <div class="swiper-wrapper">
        <div class="swiper-slide"><img src="/wxmp/static/images/wx/prod1.jpg" alt=""></div>
        <div class="swiper-slide"><img src="/wxmp/static/images/wx/prod2.jpg" alt=""></div>
        <div class="swiper-slide"><img src="/wxmp/static/images/wx/prod3.jpg" alt=""></div>
    </div>
</div>
<div class="weui-form-preview">
    <div class="weui-form-preview__hd">
        <label class="weui-form-preview__label">商品名称</label>
        <em class="weui-form-preview__value">增肌</em>
    </div>
    <div class="weui-form-preview__bd">
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">描述</label>
            <span class="weui-form-preview__value">
                肌肉，是男性力量的象征。正如不少女性上健身房的主要目的在于减肥，男士们则寄希望于健身锻炼能够增强肌肉，塑造完美的体形。
                可是，不少人忽视了一点：肌肉不仅仅是练出来，还是“吃出来”的——要想增大肌肉块，就必须给身体提供大量糖类和蛋白质。
            </span>
        </div>
    </div>
    <div class="weui-form-preview__ft">
        <a type="submit" class="weui-form-preview__btn weui-form-preview__btn_primary"
           href="/wxmp/wx/product/weekDishes">本周菜品
        </a>
    </div>
</div>

<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/jquery-weui.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/swiper.min.js"></script>

<script type="text/javascript">
    $(".swiper-container").swiper({
        loop: true,
        autoplay: 3000
    });
</script>
</body>
</html>
