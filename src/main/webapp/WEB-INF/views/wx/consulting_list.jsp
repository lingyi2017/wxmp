<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fns" uri="/WEB-INF/tlds/fns.tld" %>
<html class="pixel-ratio-1">
<head>
    <title>咨询列表</title>
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
<div class="weui-panel">
    <div class="weui-panel__bd">
    </div>
</div>
<c:forEach items="${consultingList }" var="consulting">
<div class="weui-panel">
    <div class="weui-panel__bd" onclick="consulting_form('${consulting.id}')">
        <div class="weui-flex">
            <div class="weui-flex__item">
                <div class="placeholder left" style="color: #000;">${consulting.basicService.name }</div>
            </div>
            <div class="weui-flex__item">
                <div class="placeholder right" style="color: red;">${fns:getDictLabel(consulting.dealStatus, 'consulting_status', '无')}</div>
            </div>
        </div>
        <div class="weui-flex">
            <div class="weui-flex__item">
                <div class="placeholder left" style="color: #BBB;">${consulting.time }</div>
            </div>
        </div>
    </div>
</div>
</c:forEach>

<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/jquery-weui.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/swiper.min.js"></script>
<script src="https://cdn.bootcss.com/fastclick/1.0.6/fastclick.min.js"></script>

<script type="text/javascript">
    $(function () {
        FastClick.attach(document.body);
    });
    function consulting_form(consultingId){
    	window.location.href="${pageContext.request.contextPath}/qyfw/consulting/wx_consulting_form?consultingId="+consultingId;
    };
</script>
</body>
</html>