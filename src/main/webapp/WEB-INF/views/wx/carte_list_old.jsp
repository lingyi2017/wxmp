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
		<style type="text/css">
			.weekStyle {
				width: 20%;
				height: 30px;
				padding-top: 10px;
				margin: 0 auto;
				border-right: 1px gainsboro solid;
			}
			
			.weekActive {
				color: red;
				background-color: gainsboro;
				border-radius: 15%;
			}
		</style>
	</head>

	<body ontouchstart style="height: 100%;">
		<!--主体-->
		<input id="tcType" type="hidden" value="zj" />
		<div class="weui-tab">
			<div class="weui-navbar">
				<a class="weui-navbar__item weui-bar__item--on" href="#tab1" onclick="changeTC('zj')">
					增肌
				</a>
				<a class="weui-navbar__item" href="#tab2" onclick="changeTC('sx')">
					塑形
				</a>
				<a class="weui-navbar__item" href="#tab3" onclick="changeTC('jz')">
					减脂
				</a>
			</div>
			<div class="weui-tab__bd">
				<div id="tab1" class="weui-tab__bd-item weui-tab__bd-item--active">
					<div class="weui-cells">
						<div class="weui-cell" id="zaoc">
							<div class="weui-cell__hd" style="width: 20%;">
								<p>早餐</p>
							</div>
							<div class="weui-cell__bd"><img onclick="showImage(this.src)" style="width: 110px;height: 85px;" src="https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=611116088,4106962857&fm=27&gp=0.jpg"></div>
							<div class="weui-cell__ft" style="padding-right: 5%;font-size: smaller;">主食：红薯粉 <br> 菜：麻辣鸡丁 <br> 汤：紫菜蛋花汤</div>
						</div>
						<div class="weui-cell" id="zhongc">
							<div class="weui-cell__hd" style="width: 20%;">
								<p>中餐</p>
							</div>
							<div class="weui-cell__bd"><img onclick="showImage(this.src)" style="width: 110px;height: 85px;" src="https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=200987110,409871336&fm=27&gp=0.jpg"></div>
							<div class="weui-cell__ft" style="padding-right: 5%;font-size: smaller;">三文鱼</div>
						</div>
						<div class="weui-cell" id="wanc">
							<div class="weui-cell__hd" style="width: 20%;">
								<p>晚餐</p>
							</div>
							<div class="weui-cell__bd"><img onclick="showImage(this.src)" style="width: 110px;height: 85px;" src="https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=616201987,518688217&fm=58"></div>
							<div class="weui-cell__ft" style="padding-right: 5%;font-size: smaller;">小粥</div>
						</div>
						<div class="weui-cell" style="text-align: center;">
							<div class="weui-cell__hd weekStyle weekActive" onclick="changeWeek(1)">
								周一
							</div>
							<div class="weui-cell__hd weekStyle" onclick="changeWeek(2)">
								周二
							</div>
							<div class="weui-cell__hd weekStyle" onclick="changeWeek(3)">
								周三
							</div>
							<div class="weui-cell__hd weekStyle" onclick="changeWeek(4)">
								周四
							</div>
							<div class="weui-cell__hd weekStyle" style="border-right: none;" onclick="changeWeek(5)">
								周五
							</div>
						</div>
						<div class="weui-cell">
							<div class="weui-cell__bd">
								<a href="javascript:;" class="weui-btn weui-btn_default" style="width: 45%;float: left;">下周菜单</a>
								<div style="height: 1px; width: 10%;">&nbsp;</div>
								<a href="javascript:;" class="weui-btn weui-btn_primary" style="width: 45%;float: right;">即刻下单</a>
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

		<script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
		<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/jquery-weui.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/weixin/city-picker.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/weixin/fastclick.js"></script>
		<script>
			var tc = $("#tcType").val();
			$(function() {
				FastClick.attach(document.body);
			});

			function changeTC(txt) {
				tc = txt;
			}

			function changeWeek(number) {
				$(".weekStyle").removeClass("weekActive");
				$(".weekStyle").filter(function(index) {
					return parseInt(index + 1) === number;
				}).addClass("weekActive")
				/*$("#zaoc").html("");
				$("#zhongc").html("");
				$("#wanc").html("");*/
			}

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