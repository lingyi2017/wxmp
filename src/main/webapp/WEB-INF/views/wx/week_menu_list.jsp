<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>企明星企业咨询管理有限公司</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet" href="https://cdn.bootcss.com/weui/1.1.2/style/weui.min.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/jquery-weui/1.2.0/css/jquery-weui.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/weixin/style.css">
    <style type="text/css">
        .weekStyle {
            float: left;
            text-align: center;
            display: inline;
            color: gray;
            margin: auto;
        }

        .numberStyle {
            border-radius: 50%;
            -moz-border-radius: 50%;
            -webkit-border-radius: 50%;
            padding-top: 3px;
            height: 30px;
        }

        .numberActive {
            color: white;
            background-color: orange;
        }

        .packStyle {
            border-radius: 45%;
            -moz-border-radius: 45%;
            -webkit-border-radius: 45%;
            float: left;
            width: 60px;
            margin-right: 10%;
        }

        .packActive {
            color: white;
            background-color: #59DA7D;
        }
    </style>
</head>

<body ontouchstart style="height: 100%;background-color: #F5F5F5;font-family:'黑体';">
<!--主体-->
<div class="weui-cells">
    <div class="weui-cell">
        <div class="weui-cell__bd" style="text-align:center;">
            <p>
            <div>本周菜单</div>
            </p>
        </div>
    </div>
    <div class="weui-cell js-day-panel">
        <jsp:include page="loadmore.jsp" flush="true"/>
    </div>
</div>
<div class="weui-cells js-product">
    <div class="weui-cell">
        <div class="weui-cell__bd js-product-panel" style="text-align:center;margin-left: 15%;">
            <div class="packStyle packActive" onclick="selectedOneProduct(this, '1')">减脂</div>
            <div class="packStyle" onclick="selectedOneProduct(this, '1')">塑形</div>
            <div class="packStyle" onclick="selectedOneProduct(this, '1')">增脂</div>
        </div>
    </div>
</div>
<div class="weui-cells" style="margin-top: 0px;">
    <div class="weui-cell">
        <div class="weui-cell__bd">早餐</div>
    </div>
    <div class="weui-cell">
        <div class="weui-cell__bd"><img onclick="showImage(this.src)" style="width: 60px;height: 60px;"
                                        src="https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=611116088,4106962857&fm=27&gp=0.jpg">
        </div>
        <div class="weui-cell__bd">
            <div style="margin-left: -55%;">红薯粉</div>
            <div style="margin-left: -55%;font-size: smaller;color:graytext;">1份</div>
        </div>
    </div>
    <div class="weui-cell">
        <div class="weui-cell__bd"><img onclick="showImage(this.src)" style="width: 60px;height: 60px;"
                                        src="https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=611116088,4106962857&fm=27&gp=0.jpg">
        </div>
        <div class="weui-cell__bd">
            <div style="margin-left: -55%;">红薯粉</div>
            <div style="margin-left: -55%;font-size: smaller;color:graytext;">1份</div>
        </div>
    </div>
</div>
<div class="weui-cells">
    <div class="weui-cell">
        <div class="weui-cell__bd">中餐</div>
    </div>
    <div class="weui-cell">
        <div class="weui-cell__bd"><img onclick="showImage(this.src)" style="width: 60px;height: 60px;"
                                        src="https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=200987110,409871336&fm=27&gp=0.jpg">
        </div>
        <div class="weui-cell__bd">
            <div style="margin-left: -55%;">三文鱼</div>
            <div style="margin-left: -55%;font-size: smaller;color:graytext;">1份</div>
        </div>
    </div>
    <div class="weui-cell">
        <div class="weui-cell__bd"><img onclick="showImage(this.src)" style="width: 60px;height: 60px;"
                                        src="https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=200987110,409871336&fm=27&gp=0.jpg">
        </div>
        <div class="weui-cell__bd">
            <div style="margin-left: -55%;">三文鱼</div>
            <div style="margin-left: -55%;font-size: smaller;color:graytext;">1份</div>
        </div>
    </div>
</div>
<div class="weui-cells">
    <div class="weui-cell">
        <div class="weui-cell__bd">晚餐</div>
    </div>
    <div class="weui-cell">
        <div class="weui-cell__bd"><img onclick="showImage(this.src)" style="width: 60px;height: 60px;"
                                        src="https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=616201987,518688217&fm=58">
        </div>
        <div class="weui-cell__bd">
            <div style="margin-left: -55%;">小粥</div>
            <div style="margin-left: -55%;font-size: smaller;color:graytext;">1份</div>
        </div>
    </div>
    <div class="weui-cell">
        <div class="weui-cell__bd"><img onclick="showImage(this.src)" style="width: 60px;height: 60px;"
                                        src="https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=616201987,518688217&fm=58">
        </div>
        <div class="weui-cell__bd">
            <div style="margin-left: -55%;">小粥</div>
            <div style="margin-left: -55%;font-size: smaller;color:graytext;">1份</div>
        </div>
    </div>
</div>

<div class="weui-gallery" style="display: none;" id="showImg" onclick="imgHidden()">
    <span class="weui-gallery__img" style="background-image: url(xxx);"></span>
    <div class="weui-gallery__opr">
        <a href="javascript:" class="weui-gallery__del">
            <i class="weui-icon-cancel weui-icon_gallery-cancel"></i>
        </a>
    </div>
</div>

<div class="weui-cells" style="text-align: center;color:gray;font-family: '宋体';font-size: large;">
    <div class="weui-cell">
        <div class="weui-cell__bd">
            查看下周食谱>>
        </div>
    </div>
</div>

<script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/jquery-weui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/weixin/city-picker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/weixin/fastclick.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/static/js/weixin/week_menu_list.js?d=<%=new java.util.Date() %>"></script>
<script>
    function showImage(src) {
        $("#showImg").children("span").css("background-image", "url(" + src + ")");
        $("#showImg").css("display", "block");
    }

    function imgHidden() {
        $("#showImg").css("display", "none");
    }
</script>
</body>
</html>