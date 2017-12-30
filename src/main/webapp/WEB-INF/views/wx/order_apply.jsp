<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>确认订单</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<link rel="stylesheet" href="https://cdn.bootcss.com/weui/1.1.2/style/weui.min.css">
	<link rel="stylesheet" href="https://cdn.bootcss.com/jquery-weui/1.2.0/css/jquery-weui.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/weixin/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/weixin/jquery-ui-1.10.3.custom.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/weixin/calendar.css">
	<link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
</head>
<body ontouchstart>
<!--主体-->
<header class="wy-header">
  <div class="wy-header-icon-back"><span></span></div>
  <div class="wy-header-title">确认订单</div>
</header>
<div class="weui-content">
  <div class="wy-media-box weui-media-box_text address-select">
    <div class="weui-media-box_appmsg">
      <div class="weui-media-box__hd proinfo-txt-l" style="width:20px;"><span class="promotion-label-tit"><img src="${pageContext.request.contextPath}/static/images/weixin/icon_nav_city.png" /></span></div>
      <div class="weui-media-box__bd">
        <a href="address_list.html" class="weui-cell_access">
          <h4 class="address-name"><span>杜杰</span><span>13854652512</span></h4>
          <div class="address-txt">宿迁市洋河新区电商产业园105号</div>
        </a>
      </div>
      <div class="weui-media-box__hd proinfo-txt-l" style="width:16px;"><div class="weui-cell_access"><span class="weui-cell__ft"></span></div></div>
    </div>
  </div>
  <div class="wy-media-box weui-media-box_text">
    <div class="weui-media-box__bd">
     <div class="weui-media-box_appmsg ord-pro-list">
        <div class="weui-media-box__hd"><a href="pro_info.html"><img class="weui-media-box__thumb" src="${pageContext.request.contextPath}/static/images/weixin/lx.jpg" alt=""></a></div>
        <div class="weui-media-box__bd">
          <h1 class="weui-media-box__desc"><a href="pro_info.html" class="ord-pro-link">蓝之蓝蓝色瓶装经典Q7浓香型白酒500ml52度高端纯粮食酒2瓶装包邮</a></h1>
          <p class="weui-media-box__desc">规格：<span>红色</span>，<span>23</span></p>
          <div class="clear mg-t-10">
            <div class="wy-pro-pri fl">¥<em class="num font-15">296.00</em></div>
            <div class="pro-amount fr"><span class="font-13">数量×<em class="name">1</em></span></div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="wy-media-box weui-media-box_text">
  	<div id="demo"style="margin: 0 auto; weight:80%;height:70%;">
		<div id="ca"></div>
	</div>
	<div style="margin-top:20px;width:100%;border-top:1px solid black;"><label>选中日期：</label></div>
	<div id="seleted_date" style="padding-left:20px;">0
	</div>
  </div>
  <div class="wy-media-box weui-media-box_text">
    <div class="mg10-0 t-c">总金额：<span class="wy-pro-pri mg-tb-5">¥<em class="num font-20">296.00</em></span></div>
    <div class="mg10-0"><a href="shopcart.html" class="weui-btn weui-btn_primary">微信付款</a></div>
  </div>
</div>
<script src="lib/jquery-2.1.4.js"></script> 
<script src="lib/fastclick.js"></script> 
<script type="text/javascript" src="js/jquery.Spinner.js"></script>
<script>
  $(function() {
    FastClick.attach(document.body);
    $(".Spinner").Spinner({value:1, len:3, max:999});
  });
</script>
<script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/jquery-weui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/weixin/city-picker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/weixin/fastclick.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/weixin/jquery-ui-1.10.3.custom.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/weixin/calendar.js"></script> 
<script>
var dateArray =new Array();
var count = 0;
    $('#ca').calendar({
        width: 350,
        height: 200,
        data: [
		],
        onSelected: function (view, date, data) {
            console.log('view:' + view)
            //alert('date:' + date.format("yyyy-mm-dd"))
            $("#seleted_date").html($(".selected").size());
            var value = ''+date.format("yyyy-mm-dd");
            if($.inArray(value,dateArray)>-1){
            	dateArray.splice($.inArray(value,dateArray),1);
            }else{
            	dateArray.push(value);
            }
            
            console.log('data:' + (data || 'None'));
            console.log(dateArray);
        }
    });

</script>
</body>
</html>
