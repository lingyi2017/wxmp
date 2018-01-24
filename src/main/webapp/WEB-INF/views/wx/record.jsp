<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
		<title>用餐查询</title>
		<link rel="stylesheet" href="https://cdn.bootcss.com/weui/1.1.2/style/weui.min.css">
		<link rel="stylesheet" href="https://cdn.bootcss.com/jquery-weui/1.2.0/css/jquery-weui.min.css">
		<link rel="stylesheet" href="${ctx}/static/css/weixin/style.css">
<title>äº¤æè®°å½</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
">
<link rel="stylesheet" href="lib/weui.min.css">
<link rel="stylesheet" href="css/jquery-weui.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/calendar.css">
<link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
<style type="text/css">
html {
	font: 500 14px 'roboto';
	color: #333;
	background-color: #fafafa;
}
a {
	text-decoration: none;
}
ul, ol, li {
	list-style: none;
	padding: 0;
	margin: 0;
}
#demo {
	width: 300px;
	margin: 150px auto;
}
p {
	margin: 0;
}
#dt {
	margin: 30px auto;
	height: 28px;
	width: 200px;
	padding: 0 6px;
	border: 1px solid #ccc;
	outline: none;
}
</style>
</head>
<body ontouchstart>
<!--ä¸»ä½-->
<header class="wy-header" style="position:fixed; top:0; left:0; right:0; z-index:200;">
  <a href="mine.html"><div class="wy-header-icon-back"><span></span></div></a>
  <div class="wy-header-title">å¥é¤æ¥è¯¢</div>
</header>
<div class='weui-content'>
  <div class="weui-tab">
    <div class="weui-tab__bd proinfo-tab-con">
      <div id="tab1" class="weui-tab__bd-item weui-tab__bd-item--active">
        <div class="weui-panel jyjl">
        	<div class="weui-panel__bd">
            <div class="weui-media-box weui-media-box_text">
              <h4 class="weui-media-box__title">1<em class="num">1</em></h4>
              <p class="weui-media-box__desc">å¢èï¼</p>
              <ul class="weui-media-box__info" style="padding-left: 10%;">
                <li class="weui-media-box__info__meta">æ©ï¼<em class="num">åå­ ç¨é¥­ é¸è</em></li><br><br>
                <li class="weui-media-box__info__meta">ä¸­ï¼<em class="num">çè</em></li><br><br>
                <li class="weui-media-box__info__meta">æï¼<em class="num">é¸¡è</em></li>
              </ul>
            </div>
          </div>
          
          <div class="weui-panel__bd">
            <div class="weui-media-box weui-media-box_text">
            	<div id="demo"style="margin: 0 auto;">
							  <input type="text" id="date">
							</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>


<script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/jquery-weui.min.js"></script>
<script>
  $(function() {
	  //$("#date").calendar();
	  //$("#date").calendar("closeByOutsideClick", false);
	  $("#date").calendar({
		  closeByOutsideClick: false,
		  closeOnSelect:false,
		  multiple:true
		});
  });
</script>
</body>
</html>
