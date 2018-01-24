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
		<style type="text/css">
		.weekStyle {
			float:left;
			text-align:center;
			display:inline;
			color:gray;
			margin: auto;
		}
		
		.numberStyle {
			border-radius: 50%;      
			-moz-border-radius: 50%;      
			-webkit-border-radius: 50%;
			padding-top:2px;
			height: 25px;
			width: 25px;
		}
		
		.numberActive{
			color:white;
			background-color: orange;
		}
		
		.packStyle {
			border-radius: 45%;      
			-moz-border-radius: 45%;      
			-webkit-border-radius: 45%;
			float: left;
			width:60px;
			margin-right: 10%;
		}
		.packActive{
			color:white;
			background-color: #59DA7D;
		}
		</style>
	</head>

	<body ontouchstart style="height: 100%;background-color: #F5F5F5;font-family:'黑体';">
		<!--主体-->
		<div class="weui-cells" style="margin-bottom: -3%;margin-top: -1px;">
			 <div class="weui-cell">
			   <div class="weui-cell__bd" style="text-align:center;height: 20px;">
			     <div style="float: left;position: absolute;left: 3%;top: 5%;">←</div>
				 <div style="float: left;position: absolute;left: 35%;top: 5%;">&lt;&nbsp;2018年1月&nbsp;&gt;</div>
			   </div>
			 </div>
			 <div class="weui-cell">
			 	<div class="weekStyle" style="color: lightgray;" id="zri">
			 		<div>日</div>
			 	</div>
			 	<div class="weekStyle" id="zyi">
			 		<div>一</div>
			 	</div>
			 	<div class="weekStyle" id="zer">
			 		<div>二</div>
			 	</div>
			 	<div class="weekStyle" id="zsan">
			 		<div>三</div>
			 		<div style="height: 4px;width: 4px;background-color: orange;margin-left: 45%;display: none;"></div>
			 	</div>
			 	<div class="weekStyle" id="zsi">
			 		<div>四</div>
			 	</div>
			 	<div class="weekStyle" id="zwu">
			 		<div>五</div>
			 	</div>
			 	<div class="weekStyle" style="color: lightgray;" id="zliu">
			 		<div>六</div>
			 	</div>
			 </div>
			 <div class="weui-cell" style="height: 20px;">
				<div style="height: 4px;width: 4px;background-color: orange;margin-right: 10px;"></div>橙色代表已用餐
			</div>
		</div>
		<div class="weui-cells" style="margin-bottom: -3%;">
			<div class="weui-cell">
				<div class="weui-cell__bd" style="text-align:center;margin-left: 15%;">
					<div class="packStyle packActive">塑形</div>
				</div>
			</div>
			<div class="weui-cells" style="margin-top: -8px;">
				<div class="weui-cell">
					<div class="weui-cell__bd">早餐</div>
				</div>
				<div class="weui-cell">
					<div class="weui-cell__bd"><img onclick="showImage(this.src)" style="width: 60px;height: 60px;" src="https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=611116088,4106962857&fm=27&gp=0.jpg"></div>
					<div class="weui-cell__bd">
						<div style="margin-left: -55%;">红薯粉</div>
						<div style="margin-left: -55%;font-size: smaller;color:graytext;">1份</div>
					</div>
				</div>
				<div class="weui-cell">
					<div class="weui-cell__bd"><img onclick="showImage(this.src)" style="width: 60px;height: 60px;" src="https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=611116088,4106962857&fm=27&gp=0.jpg"></div>
					<div class="weui-cell__bd">
						<div style="margin-left: -55%;">红薯粉</div>
						<div style="margin-left: -55%;font-size: smaller;color:graytext;">1份</div>
					</div>
				</div>
			</div>
		</div>
		<div class="weui-cells" style="margin-bottom: -3%;">
				<div class="weui-cell">
					<div class="weui-cell__bd">中餐</div>
				</div>
				<div class="weui-cell">
					<div class="weui-cell__bd"><img onclick="showImage(this.src)" style="width: 60px;height: 60px;" src="https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=200987110,409871336&fm=27&gp=0.jpg"></div>
					<div class="weui-cell__bd">
						<div style="margin-left: -55%;">三文鱼</div>
						<div style="margin-left: -55%;font-size: smaller;color:graytext;">1份</div>
					</div>
				</div>
				<div class="weui-cell">
					<div class="weui-cell__bd"><img onclick="showImage(this.src)" style="width: 60px;height: 60px;" src="https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=200987110,409871336&fm=27&gp=0.jpg"></div>
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
					<div class="weui-cell__bd"><img onclick="showImage(this.src)" style="width: 60px;height: 60px;" src="https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=616201987,518688217&fm=58"></div>
					<div class="weui-cell__bd">
						<div style="margin-left: -55%;">小粥</div>
						<div style="margin-left: -55%;font-size: smaller;color:graytext;">1份</div>
					</div>
				</div>
				<div class="weui-cell">
					<div class="weui-cell__bd"><img onclick="showImage(this.src)" style="width: 60px;height: 60px;" src="https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=616201987,518688217&fm=58"></div>
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
		
		

<script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/jquery-weui.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/weixin/fastclick.js"></script>
		<script>
		$(function(){
			getData();
		});
		function showImage(src) {
			$("#showImg").children("span").css("background-image", "url(" + src + ")");
			$("#showImg").css("display", "block");
		}

		function imgHidden() {
			$("#showImg").css("display", "none");
		}
		function getData(){
			$.ajax({
	            type:"POST",
	            async:false,
	            url:"${ctx}/dcxt/orderbyday/wx_eat_history_data",
	            data:{
	            	year : "${year}",
	            	month : "${month}"
	            	
	            },
	            datatype: "json",//"xml", "html", "script", "json", "jsonp", "text".
	            beforeSend:function(){
		            
		        },
	            success:function(data){
	            	if(data.result){
	            		console.info(data.obj);
	            		initData(data.obj);
	            	}
	            },
	            error: function(){
	                //请求出错处理
	            	$.toptip("修改失败");
	            }         
	         });
		}
		function initData(data){
			var activeDay = '15,16';
			var eatDay = '18,19';
			
			for(var i = 1;i<=31;i++){
				var nowOneDay = new Date(new Date().getFullYear(), new Date().getMonth(), i);
				var lastDay = new Date(new Date().getFullYear(), new Date().getMonth()+1,0).getDate();
				var dday = (nowOneDay.getDate()+"").length<2?'0'+nowOneDay.getDate():nowOneDay.getDate();
				if(nowOneDay<new Date(new Date().getFullYear(), new Date().getMonth()+1, 1)){
					if(nowOneDay.getDay()==0){
						if(lastDay==(dday)){
							$("#zyi").append("<div class='numberStyle'>&nbsp;</div>");
							$("#zer").append("<div class='numberStyle'>&nbsp;</div>");
							$("#zsan").append("<div class='numberStyle'>&nbsp;</div>");
							$("#zsi").append("<div class='numberStyle'>&nbsp;</div>");
							$("#zwu").append("<div class='numberStyle'>&nbsp;</div>");
							$("#zliu").append("<div class='numberStyle'>&nbsp;</div>");
						}
						$("#zri").append("<div class='numberStyle'>"+dday+"</div>");
					}
					if(nowOneDay.getDay()==1){
						if('01'==(dday)){
							$("#zri").append("<div class='numberStyle'>&nbsp;</div>");
						}
						if(lastDay==(dday)){
							$("#zer").append("<div class='numberStyle'>&nbsp;</div>");
							$("#zsan").append("<div class='numberStyle'>&nbsp;</div>");
							$("#zsi").append("<div class='numberStyle'>&nbsp;</div>");
							$("#zwu").append("<div class='numberStyle'>&nbsp;</div>");
							$("#zliu").append("<div class='numberStyle'>&nbsp;</div>");
						}
						if(activeDay.indexOf(dday)>-1){
							$("#zyi").append("<div class='numberStyle numberActive'>"+dday+"</div>");
						}else{
							$("#zyi").append("<div class='numberStyle'>"+dday+"</div>");
						}
						if(eatDay.indexOf(dday)>-1){
							$("#zyi").append("<div style='height: 4px;width: 4px;background-color: orange;margin-left: 45%;'></div>");
						}
					}
					if(nowOneDay.getDay()==2){
						if('01'==(dday)){
							$("#zri").append("<div class='numberStyle'>&nbsp;</div>");
							$("#zyi").append("<div class='numberStyle'>&nbsp;</div>");
						}
						if(lastDay==(dday)){
							$("#zsan").append("<div class='numberStyle'>&nbsp;</div>");
							$("#zsi").append("<div class='numberStyle'>&nbsp;</div>");
							$("#zwu").append("<div class='numberStyle'>&nbsp;</div>");
							$("#zliu").append("<div class='numberStyle'>&nbsp;</div>");
						}
						if(activeDay.indexOf(dday)>-1){
							$("#zer").append("<div class='numberStyle numberActive'>"+dday+"</div>");
						}else{
							$("#zer").append("<div class='numberStyle'>"+dday+"</div>");
						}
						if(eatDay.indexOf(dday)>-1){
							$("#zer").append("<div style='height: 4px;width: 4px;background-color: orange;margin-left: 45%;'></div>");
						}
					}
					if(nowOneDay.getDay()==3){
						if('01'==(dday)){
							$("#zri").append("<div class='numberStyle'>&nbsp;</div>");
							$("#zyi").append("<div class='numberStyle'>&nbsp;</div>");
							$("#zer").append("<div class='numberStyle'>&nbsp;</div>");
						}
						if(lastDay==(dday)){
							$("#zsi").append("<div class='numberStyle'>&nbsp;</div>");
							$("#zwu").append("<div class='numberStyle'>&nbsp;</div>");
							$("#zliu").append("<div class='numberStyle'>&nbsp;</div>");
						}
						if(activeDay.indexOf(dday)>-1){
							$("#zsan").append("<div class='numberStyle numberActive'>"+dday+"</div>");
						}else{
							$("#zsan").append("<div class='numberStyle'>"+dday+"</div>");
						}
						if(eatDay.indexOf(dday)>-1){
							$("#zsan").append("<div style='height: 4px;width: 4px;background-color: orange;margin-left: 45%;'></div>");
						}
					}
					if(nowOneDay.getDay()==4){
						if('01'==(dday)){
							$("#zri").append("<div class='numberStyle'>&nbsp;</div>");
							$("#zyi").append("<div class='numberStyle'>&nbsp;</div>");
							$("#zer").append("<div class='numberStyle'>&nbsp;</div>");
							$("#zsan").append("<div class='numberStyle'>&nbsp;</div>");
						}
						if(lastDay==(dday)){
							$("#zwu").append("<div class='numberStyle'>&nbsp;</div>");
							$("#zliu").append("<div class='numberStyle'>&nbsp;</div>");
						}
						if(activeDay.indexOf(dday)>-1){
							$("#zsi").append("<div class='numberStyle numberActive'>"+dday+"</div>");
						}else{
							$("#zsi").append("<div class='numberStyle'>"+dday+"</div>");
						}
						if(eatDay.indexOf(dday)>-1){
							$("#zsi").append("<div style='height: 4px;width: 4px;background-color: orange;margin-left: 45%;'></div>");
						}
					}
					if(nowOneDay.getDay()==5){
						if('01'==(dday)){
							$("#zri").append("<div class='numberStyle'>&nbsp;</div>");
							$("#zyi").append("<div class='numberStyle'>&nbsp;</div>");
							$("#zer").append("<div class='numberStyle'>&nbsp;</div>");
							$("#zsan").append("<div class='numberStyle'>&nbsp;</div>");
							$("#zsi").append("<div class='numberStyle'>&nbsp;</div>");
						}
						if(lastDay==(dday)){
							$("#zliu").append("<div class='numberStyle'>&nbsp;</div>");
						}
						if(activeDay.indexOf(dday)>-1){
							$("#zwu").append("<div class='numberStyle numberActive'>"+dday+"</div>");
						}else{
							$("#zwu").append("<div class='numberStyle'>"+dday+"</div>");
						}
						if(eatDay.indexOf(dday)>-1){
							$("#zwu").append("<div style='height: 4px;width: 4px;background-color: orange;margin-left: 45%;'></div>");
						}
					}
					if(nowOneDay.getDay()==6){
						if('01'==(dday)){
							$("#zri").append("<div class='numberStyle'>&nbsp;</div>");
							$("#zyi").append("<div class='numberStyle'>&nbsp;</div>");
							$("#zer").append("<div class='numberStyle'>&nbsp;</div>");
							$("#zsan").append("<div class='numberStyle'>&nbsp;</div>");
							$("#zsi").append("<div class='numberStyle'>&nbsp;</div>");
							$("#zwu").append("<div class='numberStyle'>&nbsp;</div>");
						}
						$("#zliu").append("<div class='numberStyle'>"+dday+"</div>");
					}
				}
			}
		
			
		}
		</script>
	</body>
</html>