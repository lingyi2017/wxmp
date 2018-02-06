<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
		<title>商品详情</title>
		<link rel="stylesheet" href="lib/weui.min.css">
		<link rel="stylesheet" href="css/jquery-weui.css">
		<link rel="stylesheet" href="css/style.css">
		<link rel="stylesheet" href="css/ft-carousel.css" />
		<style>
			.example {
				width: 624px;
				height: 336px;
				font-size: 40px;
				text-align: center;
				margin: 20px auto;
				background-color: #464576;
			}
			
			.carousel-item{
				line-height: 336px;
				color: #fff;
				font-family:  Arial Black;
			}
			
			.detailStyle {
				width: 60%;
				margin-left: 20%;
				font-size: large;
			}
			
			.detailActive {
				color: orangered;
				border-bottom: 1px solid orangered;
			}
			
			.commentStyle {
				float: left;
				width: 80px;
				border:1px solid orange;
				text-align: center;
				color: orange;
				border-radius: 45px;
				-moz-border-radius: 45px;
				-webkit-border-radius: 45px;
				margin-right: 5px;
			}
			
			.commentActive {
				background-color: orange;
				color: white;
			}
		</style>
	</head>
	<body style="height: 100%;font-family:'黑体';background-color: #F5F5F5;width: 100%;margin-top: -5%;">
		<div class="weui-cells" style="width: 100%;margin-top: -8%;">
			<div class="weui-cell">
				<div class="example" style="text-align: center;">
					<div class="ft-carousel" id="carousel_1" style="width: 100%;height: 347px;">
						<ul class="carousel-inner" style="width: 100%;height: 100%;">
							<li style="width: 100%;height: 100%;" class="carousel-item"><img style="width: 100%;height: 100%;" src="images/alipay.png" /></li>
							<li style="width: 100%;height: 100%;" class="carousel-item"><img style="width: 100%;height: 100%" src="images/wxpay.png" /></li>
							<li style="width: 100%;height: 100%;" class="carousel-item"><img style="width: 100%;height: 100%;" src="images/alipay.png" /></li>
							<li style="width: 100%;height: 100%;" class="carousel-item"><img style="width: 100%;height: 100%;" src="images/wxpay.png" /></li>
							<li style="width: 100%;height: 100%;" class="carousel-item"><img style="width: 100%;height: 100%;" src="images/alipay.png" /></li>
							<li style="width: 100%;height: 100%;" class="carousel-item"><img style="width: 100%;height: 100%;" src="images/wxpay.png" /></li>
						</ul>
					</div>
				</div>
			</div>
			
			<div class="weui-cell" style="width: 100%;margin-top: -5%;height: 80px;">
				<div style="margin-top: -27%;">
					<div style="width: 100%;height: 60%;">
						<div style="position: absolute;left: 1%; width: 70%;height: 60%;padding-left: 3%;padding-top: 2%;">这是一件商品这是一件商品这是一件商品这是一件商品这是一件商品</div>
						<div style="position: absolute;right: 8%;width: 20%;height: 60%;padding-top: 2%;text-align: center;">
							<img src="images/fx.jpg" style="width: 40%;height: 40%;" />
							<div>分享</div>
						</div>
					</div>
					<div style="width: 100%;height: 40%;color: orangered;font-weight: bold;">
						<div style="position: absolute;left: 3%;bottom: 0.5%;height: 40%;">
							￥30.00/300积分
						</div>
					</div>
				</div>
			</div>
			<div class="weui-cell" style="width: 100%;color: gray;font-size: small;">
				<div style="float: left;width: 30%;">月销：<label style="font-size: smaller;color: black;">233</label></div>
				<div style="float: left;width: 30%;">快递：<label style="font-size: smaller;color: black;">免邮</label></div>
				<div style="float: left;width: 39%;">发货地：<label style="font-size: smaller;color: black;">四川·成都</label></div>
			</div>
			<div class="weui-cell" style="width: 100%;font-size: smaller;">
				<div style="float: left;width: 30%;">
					<div style="color: deepskyblue; float: left;border: 1px solid deepskyblue; height: 15px;width: 15px;border-radius: 50%;-moz-border-radius: 50%;-webkit-border-radius: 50%;">
						<label style="text-align: center;position: absolute;top: 23%;left: 4.3%;">✔</label>
					</div>
					<div style="float: left;">&nbsp;担保交易</div>
				</div>
				<div style="float: left;width: 30%;">
					<div style="color: deepskyblue; float: left;border: 1px solid deepskyblue; height: 15px;width: 15px;border-radius: 50%;-moz-border-radius: 50%;-webkit-border-radius: 50%;">
						<label style="text-align: center;position: absolute;top: 23%;left: 32.3%;">✔</label>
					</div>
					<div style="float: left;">&nbsp;支持退货</div>
				</div>
			</div>
			<div class="weui-cell" style="width: 100%;">
				<div style="float: left;width: 14%;border: 1px solid orangered;text-align: center;color: orangered;border-radius: 5px;-moz-border-radius: 5px;-webkit-border-radius: 5px;">积分</div>
				<div style="float: left;margin-left: 20px;">购买可得10积分</div>
			</div>
		</div>
		<div style="height: 10px;width: 5%;"></div>
		<div class="weui-cells" style="width: 100%;height: 32px;padding-top: 3%;padding-left: 10px;margin-top: -1%;">查看一周食谱</div>
		<div style="height: 10px;width: 5%;"></div>
		<div class="weui-cells" style="width: 100%;padding-top: 3%;padding-left: 10px;margin-top: -1%;">
			<div class="weui-cell" style="width: 100%;">
				<div style="float: left;width: 40%;text-align: center;">
					<div class="detailStyle detailActive" onclick="changePan(0)">今日菜谱</div>
				</div>
				<div style="float: left;width: 40%;text-align: center;">
					<div class="detailStyle" onclick="changePan(1)">商品评价</div>
				</div>
			</div>
			<div id="comment" style="width: 100%;display: none;margin-bottom: -10px;min-height: 100px;">
				<div class="weui-cell" style="width: 100%;margin-left: -3%;">
					<div><label style="color: orangered;font-size: large;">4.8</label>分 &nbsp;共125个评论&nbsp;<a id="star" style="color: orange;"></a></div>
				</div>
				<div class="weui-cell" style="width: 100%;margin-left: -3%;">
					<div class="commentStyle commentActive" onclick="changeComment(0)">全部</div>
					<div class="commentStyle" onclick="changeComment(1)">好评 123</div>
					<div class="commentStyle" onclick="changeComment(2)">中评 66</div>
					<div class="commentStyle" onclick="changeComment(3)">差评 0</div>
				</div>
				<div>
					<div class="weui-cell" style="width: 100%;margin-left: -3%;">
						<div style="float: left;width: 20%;">
							<img src="images/alipay.png" style="width: 40px;height: 40px;border-radius: 50%;-moz-border-radius: 50%;-webkit-border-radius: 50%;" />
						</div>
						<div style="float: left;width: 80%;padding-bottom: 3%;">
							<div style="width: 100%;">
								<div style="float: left; position: relative;left: 10%;color: dimgray;">123</div>
								<div style="float: left; position: relative;left: 50%;color: slategray;font-size: smaller;">2018-01-21</div>
							</div>
							<div style="margin-top: 10%;width: 95%;">
								评价内容评价内容评价内容评价内容评价内容评价内容评价内容评价内容评价内容
							</div>
							<div style="margin-top: 2%;width: 95%;">
								<img onclick="showImage(this.src)" src="images/alipay.png" style="width: 50px;height: 50px;" />
								<img onclick="showImage(this.src)" src="images/alipay.png" style="width: 50px;height: 50px;" />
								<img onclick="showImage(this.src)" src="images/alipay.png" style="width: 50px;height: 50px;" />
								<img onclick="showImage(this.src)" src="images/alipay.png" style="width: 50px;height: 50px;" />
								<img onclick="showImage(this.src)" src="images/alipay.png" style="width: 50px;height: 50px;" />
							</div>
						</div>
					</div>
					<div class="weui-cell" style="width: 100%;margin-left: -3%;">
						<div style="float: left;width: 20%;">
							<img src="images/alipay.png" style="width: 40px;height: 40px;border-radius: 50%;-moz-border-radius: 50%;-webkit-border-radius: 50%;" />
						</div>
						<div style="float: left;width: 80%;padding-bottom: 3%;">
							<div style="width: 100%;">
								<div style="float: left; position: relative;left: 10%;color: dimgray;">123</div>
								<div style="float: left; position: relative;left: 50%;color: slategray;font-size: smaller;">2018-01-21</div>
							</div>
							<div style="margin-top: 10%;width: 95%;">
								评价内容评价内容评价内容评价内容评价内容评价内容评价内容评价内容评价内容
							</div>
							<div style="margin-top: 2%;width: 95%;">
								<img onclick="showImage(this.src)" src="images/alipay.png" style="width: 50px;height: 50px;" />
								<img onclick="showImage(this.src)" src="images/alipay.png" style="width: 50px;height: 50px;" />
								<img onclick="showImage(this.src)" src="images/alipay.png" style="width: 50px;height: 50px;" />
							</div>
						</div>
					</div>
					<div class="weui-cell" style="width: 100%;margin-left: -3%;">
						<div style="float: left;width: 20%;">
							<img src="images/alipay.png" style="width: 40px;height: 40px;border-radius: 50%;-moz-border-radius: 50%;-webkit-border-radius: 50%;" />
						</div>
						<div style="float: left;width: 80%;padding-bottom: 3%;">
							<div style="width: 100%;">
								<div style="float: left; position: relative;left: 10%;color: dimgray;">123</div>
								<div style="float: left; position: relative;left: 50%;color: slategray;font-size: smaller;">2018-01-21</div>
							</div>
							<div style="margin-top: 10%;width: 95%;">
								评价内容评价内容评价内容评价内容评价内容评价内容评价内容评价内容评价内容
							</div>
							<div style="margin-top: 2%;width: 95%;">
								<img onclick="showImage(this.src)" src="images/alipay.png" style="width: 50px;height: 50px;" />
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="zzw">
				<div class="weui-cell" style="width: 100%;margin-left: -3%;">
					<div style="width: 100%;">
						<div style="float: left;width: 20%;height: 100%;">
							<div style="margin-top: 10%; float: left; height: 7px;width: 7px;background-color: limegreen;border-radius: 50%;-moz-border-radius: 50%;-webkit-border-radius: 50%;"></div>
							<div style="float: left;">&nbsp;早餐：</div>
						</div>
						<div style="float: left;width: 80%;font-size: small;text-align: left;">
							<div style="float: left;height: 80px;width: 30%;text-align: center;position: relative;left: 2%;">
								<img src="images/alipay.png" style="width: 50%;height: 50%;" />
								<div>支付宝</div>
							</div>
							<div style="float: left;height: 80px;width: 30%;text-align: center;position: relative;left: 2%;">
								<img src="images/alipay.png" style="width: 50%;height: 50%;" />
								<div>支付宝</div>
							</div>
							<div style="float: left;height: 80px;width: 30%;text-align: center;position: relative;left: 2%;">
								<img src="images/alipay.png" style="width: 50%;height: 50%;" />
								<div>支付宝</div>
							</div>
						</div>
					</div>
				</div>
				<div class="weui-cell" style="width: 100%;margin-left: -3%;">
					<div style="width: 100%;">
						<div style="float: left;width: 20%;height: 100%;">
							<div style="margin-top: 10%; float: left; height: 7px;width: 7px;background-color: limegreen;border-radius: 50%;-moz-border-radius: 50%;-webkit-border-radius: 50%;"></div>
							<div style="float: left;">&nbsp;午餐：</div>
						</div>
						<div style="float: right;width: 80%;font-size: small;text-align: left;">
							<div style="float: left;height: 80px;width: 30%;text-align: center;">
								<img src="images/alipay.png" style="width: 50%;height: 50%;position: relative;left: 5%;" />
								<div>支付宝</div>
							</div>
							<div style="float: left;height: 80px;width: 30%;text-align: center;">
								<img src="images/alipay.png" style="width: 50%;height: 50%;position: relative;left: 5%;" />
								<div>支付宝</div>
							</div>
							
						</div>
					</div>
				</div>
				<div class="weui-cell" style="width: 100%;margin-left: -3%;">
					<div style="width: 100%;">
						<div style="float: left;width: 20%;height: 100%;">
							<div style="margin-top: 10%; float: left; height: 7px;width: 7px;background-color: limegreen;border-radius: 50%;-moz-border-radius: 50%;-webkit-border-radius: 50%;"></div>
							<div style="float: left;">&nbsp;晚餐：</div>
						</div>
						<div style="float: left;width: 80%;font-size: small;text-align: left;">
							<div style="float: left;height: 80px;width: 30%;text-align: center;">
								<img src="images/alipay.png" style="width: 50%;height: 50%;position: relative;left: 5%;" />
								<div>支付宝</div>
							</div>
							<div style="float: left;height: 80px;width: 30%;text-align: center;">
								<img src="images/alipay.png" style="width: 50%;height: 50%;position: relative;left: 5%;" />
								<div>支付宝</div>
							</div>
							<div style="float: left;height: 80px;width: 30%;text-align: center;">
								<img src="images/alipay.png" style="width: 50%;height: 50%;position: relative;left: 5%;" />
								<div>支付宝</div>
							</div>
							<div style="float: left;height: 80px;width: 30%;text-align: center;">
								<img src="images/alipay.png" style="width: 50%;height: 50%;position: relative;left: 5%;" />
								<div>支付宝</div>
							</div>
						</div>
					</div>
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
		
		<div class="weui-cells" style="width: 100%;margin-bottom: -10px;" id="wareDetail">
			<div class="weui-cell" style="font-size: large;font-weight: bold;width: 100%;">
				<div style="padding-left: 35%;">商品详情</div>
			</div>
			<div class="weui-cell">
				<div style="width: 100%;min-height: 500px;"></div>
			</div>
		</div>
		
		<div class="weui-cells" style="width: 99.5%;height: 50px;text-align: center;color:white;background-color: orange;border: 1px solid white; font-family: '宋体';">
			<div style="position: absolute;width: 50%;height: 100%;background-color: green;display: flex;text-align: center;">
				<div style="font-size: x-large;margin: 6% auto;">积分购买</div>
			</div>
			<div style="font-size: x-large;margin-top: 3%;margin-left: 50%;">现金购买</div>
		</div>
		
		<script src="lib/jquery-2.1.4.js"></script> 
		<script src="lib/fastclick.js"></script> 
		<script src="js/jquery-weui.js"></script>
		<script src="js/ft-carousel.min.js"></script>
		<script type="text/javascript">
			function showImage(src) {
				$("#showImg").children("span").css("background-image", "url(" + src + ")");
				$("#showImg").css("display", "block");
			}
	
			function imgHidden() {
				$("#showImg").css("display", "none");
			}
		
			var starCode = 4.8;
			$("#carousel_1").FtCarousel({
				time: 2000
			});
			
			function changePan(num){
				$(".detailStyle").each(function(){
				    $(this).removeClass("detailActive");
				  });
				$($(".detailStyle").get(num)).addClass("detailActive");
				if(num==0){
					$("#zzw").css("display","block");
					$("#wareDetail").css("display","block");
					$("#comment").css("display","none");
				}else{
					$("#zzw").css("display","none");
					$("#wareDetail").css("display","none");
					$("#comment").css("display","block");
				}
			}
			var nowCode = 0;
			$(function(){
				for(var i = 1;i<6;i++){
					if(i<starCode){
						$("#star").append("★");
					}else{
						if(nowCode+i+1){
							
						}else{
							$("#star").append("☆");
						}
					}
				}
			});
			
			function changeComment(num){
				$(".commentStyle").each(function(){
					$(this).removeClass("commentActive");
				});
				$($(".commentStyle").get(num)).addClass("commentActive");
			}
		</script>
	</body>
</html>