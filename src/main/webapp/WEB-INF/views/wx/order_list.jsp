<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fns" uri="/WEB-INF/tlds/fns.tld" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
		<title>订单查询</title>
		<link rel="stylesheet" href="https://cdn.bootcss.com/weui/1.1.2/style/weui.min.css">
		<link rel="stylesheet" href="https://cdn.bootcss.com/jquery-weui/1.2.0/css/jquery-weui.min.css">
		<link rel="stylesheet" href="${ctx}/static/css/weixin/style.css">
</head>
<body ontouchstart>
<header class="wy-header" style="position:fixed; top:0; left:0; right:0; z-index:200;">
  <div class="wy-header-icon-back"><span></span></div>
  <div class="wy-header-title">订单查询</div>
</header>
<div class='weui-content'>
  <div class="weui-tab">
    <div class="weui-navbar" style="position:fixed; top:44px; left:0; right:0; height:44px; background:#fff;">
      <a class="weui-navbar__item proinfo-tab-tit font-14 weui-bar__item--on" href="#tab1">全部</a>
      <a class="weui-navbar__item proinfo-tab-tit font-14" href="#tab2">待付款</a>
      <a class="weui-navbar__item proinfo-tab-tit font-14" href="#tab3">进行中</a>
      <a class="weui-navbar__item proinfo-tab-tit font-14" href="#tab4">待评价</a>
    </div>
    <div class="weui-tab__bd proinfo-tab-con" style="padding-top:87px;">
      <div id="tab1" class="weui-tab__bd-item weui-tab__bd-item--active">
      	<!-- 全部订单 -->
      	<c:forEach items="${orderList }" var="entity">
	      	<div class="weui-panel weui-panel_access">
	          <div class="weui-panel__hd"><span>订单号：${entity.orderNumber }</span><span class="ord-status-txt-ts fr">${fns:getDictLabel(entity.status, 'order_status', '无')}</span></div>
	          <div class="weui-media-box__bd  pd-10">
	            <div class="weui-media-box_appmsg ord-pro-list">
	              <div class="weui-media-box__hd"><a href="${ctx}/dcxt/order/wx_order?id=${entity.id}"><img class="weui-media-box__thumb" src="${ctx }/static/images/wx/center-order.png" alt=""></a></div>
	              <div class="weui-media-box__bd">
	                <h1 class="weui-media-box__desc"><a href="${ctx}/dcxt/order/wx_order?id=${entity.id}" class="ord-pro-link">${entity.productName }</a></h1>
	                <p class="weui-media-box__desc">分量：<span>中份</span></p>
	                <div class="clear mg-t-10">
	                  <div class="wy-pro-pri fl">¥<em class="num font-15">${entity.totalMoney }</em></div>
	                  <div class="pro-amount fr"><span class="font-13">天数×<em class="name">${entity.days }</em></span></div>
	                </div>
	              </div>
	            </div>
	          </div>
	          <div class="ord-statistics">
	            <span class="wy-pro-pri">总金额：¥<em class="num font-15">${entity.payMoney }</em></span>
	            <span>(含运费<b>￥0.00</b>)</span>
	          </div>
	          <div class="weui-panel__ft">
	            <div class="weui-cell weui-cell_access weui-cell_link oder-opt-btnbox">
	            	<a href="${ctx}/dcxt/order/wx_order?id=${entity.id}" class="ords-btn-dele">订单详情</a>
	            	<c:if test="${entity.status == 5 }">
	            		<a href="comment.html" class="ords-btn-com">评价</a>
	            	</c:if>
	              
	            </div>    
	          </div>
	        </div>
      	</c:forEach>
      </div>
      <!-- 待付款 -->
      <div id="tab2" class="weui-tab__bd-item">
	      <c:forEach items="${orderList }" var="entity">
	      	<c:if test="${entity.status == 1 }">
			        <div class="weui-panel weui-panel_access">
		          <div class="weui-panel__hd"><span>订单号：${entity.orderNumber }</span><span class="ord-status-txt-ts fr">${fns:getDictLabel(entity.status, 'order_status', '无')}</span></div>
		          <div class="weui-media-box__bd  pd-10">
		            <div class="weui-media-box_appmsg ord-pro-list">
		              <div class="weui-media-box__hd"><a href="${ctx}/dcxt/order/wx_order?id=${entity.id}"><img class="weui-media-box__thumb" src="${ctx }/static/images/wx/center-order.png" alt=""></a></div>
		              <div class="weui-media-box__bd">
		                <h1 class="weui-media-box__desc"><a href="${ctx}/dcxt/order/wx_order?id=${entity.id}" class="ord-pro-link">${entity.productName }</a></h1>
		                <p class="weui-media-box__desc">分量：<span>中份</span></p>
		                <div class="clear mg-t-10">
		                  <div class="wy-pro-pri fl">¥<em class="num font-15">${entity.totalMoney }</em></div>
		                  <div class="pro-amount fr"><span class="font-13">天数×<em class="name">${entity.days }</em></span></div>
		                </div>
		              </div>
		            </div>
		          </div>
		          <div class="ord-statistics">
		            <span class="wy-pro-pri">总金额：¥<em class="num font-15">${entity.payMoney }</em></span>
		            <span>(含运费<b>￥0.00</b>)</span>
		          </div>
		          <div class="weui-panel__ft">
		            <div class="weui-cell weui-cell_access weui-cell_link oder-opt-btnbox">
		            	<a href="${ctx}/dcxt/order/wx_order?id=${entity.id}" class="ords-btn-dele">订单详情</a>
		            	<a href="comment.html" class="ords-btn-com">去付款</a>
		            </div>    
		          </div>
		        </div>
	      	</c:if>
	      </c:forEach>
       </div>
       <!-- 进行中-->
      <div id="tab3" class="weui-tab__bd-item">
      	<c:forEach items="${orderList }" var="entity">
	      	<c:if test="${entity.status != 1 and  entity.status != 5}">
			        <div class="weui-panel weui-panel_access">
		          <div class="weui-panel__hd"><span>订单号：${entity.orderNumber }</span><span class="ord-status-txt-ts fr">${fns:getDictLabel(entity.status, 'order_status', '无')}</span></div>
		          <div class="weui-media-box__bd  pd-10">
		            <div class="weui-media-box_appmsg ord-pro-list">
		              <div class="weui-media-box__hd"><a href="${ctx}/dcxt/order/wx_order?id=${entity.id}"><img class="weui-media-box__thumb" src="${ctx }/static/images/wx/center-order.png" alt=""></a></div>
		              <div class="weui-media-box__bd">
		                <h1 class="weui-media-box__desc"><a href="${ctx}/dcxt/order/wx_order?id=${entity.id}" class="ord-pro-link">${entity.productName }</a></h1>
		                <p class="weui-media-box__desc">分量：<span>中份</span></p>
		                <div class="clear mg-t-10">
		                  <div class="wy-pro-pri fl">¥<em class="num font-15">${entity.totalMoney }</em></div>
		                  <div class="pro-amount fr"><span class="font-13">天数×<em class="name">${entity.days }</em></span></div>
		                </div>
		              </div>
		            </div>
		          </div>
		          <div class="ord-statistics">
		            <span class="wy-pro-pri">总金额：¥<em class="num font-15">${entity.payMoney }</em></span>
		            <span>(含运费<b>￥0.00</b>)</span>
		          </div>
		          <div class="weui-panel__ft">
		            <div class="weui-cell weui-cell_access weui-cell_link oder-opt-btnbox">
		            	<a href="${ctx}/dcxt/order/wx_order?id=${entity.id}" class="ords-btn-dele">订单详情</a>
		            	<c:if test="${entity.status == 2 }">
		            		<a href="comment.html" class="ords-btn-com">暂停</a>
		            	</c:if>
		            	<c:if test="${entity.status == 3 }">
		            		<a href="comment.html" class="ords-btn-com">恢复</a>
		            	</c:if>
		            </div>    
		          </div>
		        </div>
	      	</c:if>
	      </c:forEach>
      </div>
      <!-- 待评价 -->
      <div id="tab4" class="weui-tab__bd-item">
      	<c:forEach items="${orderList }" var="entity">
	      	<c:if test="${entity.status == 5}">
			        <div class="weui-panel weui-panel_access">
		          <div class="weui-panel__hd"><span>订单号：${entity.orderNumber }</span><span class="ord-status-txt-ts fr">${fns:getDictLabel(entity.status, 'order_status', '无')}</span></div>
		          <div class="weui-media-box__bd  pd-10">
		            <div class="weui-media-box_appmsg ord-pro-list">
		              <div class="weui-media-box__hd"><a href="${ctx}/dcxt/order/wx_order?id=${entity.id}"><img class="weui-media-box__thumb" src="${ctx }/static/images/wx/center-order.png" alt=""></a></div>
		              <div class="weui-media-box__bd">
		                <h1 class="weui-media-box__desc"><a href="${ctx}/dcxt/order/wx_order?id=${entity.id}" class="ord-pro-link">${entity.productName }</a></h1>
		                <p class="weui-media-box__desc">分量：<span>中份</span></p>
		                <div class="clear mg-t-10">
		                  <div class="wy-pro-pri fl">¥<em class="num font-15">${entity.totalMoney }</em></div>
		                  <div class="pro-amount fr"><span class="font-13">天数×<em class="name">${entity.days }</em></span></div>
		                </div>
		              </div>
		            </div>
		          </div>
		          <div class="ord-statistics">
		            <span class="wy-pro-pri">总金额：¥<em class="num font-15">${entity.payMoney }</em></span>
		            <span>(含运费<b>￥0.00</b>)</span>
		          </div>
		          <div class="weui-panel__ft">
		            <div class="weui-cell weui-cell_access weui-cell_link oder-opt-btnbox">
		            	<a href="${ctx}/dcxt/order/wx_order?id=${entity.id}" class="ords-btn-dele">订单详情</a>
		            	<a href="comment.html" class="ords-btn-com">去评价</a>
		            </div>    
		          </div>
		        </div>
	      	</c:if>
	      </c:forEach>
        
      </div>
      
    </div>
  </div>
</div>

<script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/jquery-weui.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/weixin/fastclick.js"></script>
<script type="text/javascript" src="${ctx}/static/js/weixin/city-picker-now.js"></script>
<script>
  $(function() {
    FastClick.attach(document.body);
  });
</script> 
<script>

     

</script>
</body>
</html>
