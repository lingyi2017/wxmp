<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>收货地址修改</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="stylesheet" href="https://cdn.bootcss.com/weui/1.1.2/style/weui.min.css">
	<link rel="stylesheet" href="https://cdn.bootcss.com/jquery-weui/1.2.0/css/jquery-weui.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/weixin/style.css">
</head>
<body ontouchstart>
<!--主体-->
<div class='weui-content'>
  <div class="wy-center-top">
    <div class="weui-media-box weui-media-box_appmsg">
      <div class="weui-media-box__hd"><img class="weui-media-box__thumb radius" src="${pageContext.request.contextPath}/static/images/weixin/headimg.jpg" alt=""></div>
      <div class="weui-media-box__bd">
        <h4 class="weui-media-box__title user-name">${account.name }</h4>
        <p class="user-grade">积分：${account.score }</p>
      </div>
    </div>
  </div>
  <div class="weui-panel weui-panel_access">
    <div class="weui-panel__hd">
      <a href="all_orders.html" class="weui-cell weui-cell_access center-alloder">
        <div class="weui-cell__bd wy-cell">
          <div class="weui-cell__hd"><img src="${pageContext.request.contextPath}/static/images/weixin/center-icon-order-all.png" alt="" class="center-list-icon"></div>
          <div class="weui-cell__bd weui-cell_primary"><p class="center-list-txt">全部订单</p></div>
        </div>
        <span class="weui-cell__ft"></span>
      </a>   
    </div>
    <div class="weui-panel__bd">
      <div class="weui-flex">
        <div class="weui-flex__item">
          <a href="all_orders.html" class="center-ordersModule">
            <span class="weui-badge" style="position: absolute;top:5px;right:10px; font-size:10px;">2</span>
            <div class="imgicon"><img src="${pageContext.request.contextPath}/static/images/weixin/center-icon-order-dfk.png" /></div>
            <div class="name">待付款</div>
          </a>
        </div>
        <div class="weui-flex__item">
          <a href="all_orders.html" class="center-ordersModule">
            <div class="imgicon"><img src="${pageContext.request.contextPath}/static/images/weixin/center-icon-order-dsh.png" /></div>
            <div class="name">进行中</div>
          </a>
        </div>
        <div class="weui-flex__item">
          <a href="all_orders.html" class="center-ordersModule">
            <div class="imgicon"><img src="${pageContext.request.contextPath}/static/images/weixin/center-icon-order-refund.png" /></div>
            <div class="name">退款/售后</div>
          </a>
        </div>
        <div class="weui-flex__item">
          <a href="orders.html" class="center-ordersModule">
            <span class="weui-badge" style="position: absolute;top:5px;right:10px; font-size:10px;">2</span>
            <div class="imgicon"><img src="${pageContext.request.contextPath}/static/images/weixin/center-icon-order-dpj.png" /></div>
            <div class="name">待评价</div>
          </a>
        </div>
      </div>
    </div>
  </div>
  
  
  <div class="weui-panel">
        <div class="weui-panel__bd">
          <div class="weui-media-box weui-media-box_small-appmsg">
            <div class="weui-cells">
              
              <a class="weui-cell weui-cell_access" href="${pageContext.request.contextPath}/dcxt/accountaddress/addressListByWeiXin?accountId=${account.id}">
                <div class="weui-cell__hd"><img src="${pageContext.request.contextPath}/static/images/weixin/center-icon-dz.png" alt="" class="center-list-icon"></div>
                <div class="weui-cell__bd weui-cell_primary">
                  <p class="center-list-txt">地址管理${openId }</p>
                </div>
                <span class="weui-cell__ft"></span>
              </a>
              <a class="weui-cell weui-cell_access" href="shoucang.html">
                <div class="weui-cell__hd"><img src="${pageContext.request.contextPath}/static/images/weixin/center-icon-sc.png" alt="" class="center-list-icon"></div>
                <div class="weui-cell__bd weui-cell_primary">
                  <p class="center-list-txt">我的评价</p>
                </div>
                <span class="weui-cell__ft"></span>
              </a>
              <a class="weui-cell weui-cell_access" href="${pageContext.request.contextPath}/dcxt/accountscorehistory/scoreListViewByWeiXin?accountId=${account.id}">
                <div class="weui-cell__hd"><img src="${pageContext.request.contextPath}/static/images/weixin/center-icon-sc.png" alt="" class="center-list-icon"></div>
                <div class="weui-cell__bd weui-cell_primary">
                  <p class="center-list-txt">积分历史</p>
                </div>
                <span class="weui-cell__ft"></span>
              </a>
              <a class="weui-cell weui-cell_access" href="${pageContext.request.contextPath}/dcxt/account/accountEditByWeiXin?accountId=${account.id}">
                <div class="weui-cell__hd"><img src="${pageContext.request.contextPath}/static/images/weixin/footer04.png" alt="" class="center-list-icon"></div>
                <div class="weui-cell__bd weui-cell_primary">
                  <p class="center-list-txt">个人资料</p>
                </div>
                <span class="weui-cell__ft"></span>
              </a>
            </div>
          </div>
        </div>
      </div>
  
  
  
</div>


<script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/jquery-weui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/weixin/city-picker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/weixin/fastclick.js"></script>
<script>
  $(function() {
    FastClick.attach(document.body);
  });
  
</script>

</body>
</html>
