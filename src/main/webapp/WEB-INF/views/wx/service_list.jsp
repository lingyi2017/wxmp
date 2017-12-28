<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="pixel-ratio-1">
<head>
    <title>企明星</title>
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

        .header{
            background-color: #3475eb;
            height: 50px;
            line-height: 35px;
            top: 0px;
            width: 100%;
            margin-bottom: 20px;
        }

        .header h3{
            color: white;
            margin-left: 40%;
        }

        .weui-media-box {
            padding: 10px;
            position: relative;
        }

        .service_container h3 {
            color: #333;
        }

        .placeholder {
            margin: 5px;
            padding: 0 10px;
            height: 2em;
            line-height: 2.3em;
            text-align: center;
        }

        .red {
            color: red;
        }

        .mt20 {
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div class="weui-search-bar header" id="searchBar">
    <h3>服务列表</h3>
</div>


<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/jquery-weui.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/swiper.min.js"></script>

<script type="text/javascript">
	$(function(){
		$.ajax({
	        url : "${pageContext.request.contextPath}/qyfw/serviceCategory/wx_service_list",
	        type : "post",
	        dataType : "json",
	        data : {wxMenuId:"${state}"},
	        cache : false,
	        async : false,
	        success : function(data) {
	            if(data.result){
	            	var service_list = data.obj;
	            	var div = "<div class='service_container'><div class='weui-panel weui-panel_access mt20'>";
	            	for(var i = 0; i< service_list.length; i++){
	            		div = div + "<div class='weui-panel__hd'><h3>"+service_list[i].serviceCategoryName+"</h3></div>";
	            		div = div + "<div class='weui-panel__bd'>";
	            		div = div + "<div class='weui-media-box weui-media-box_text'>";
	            		var basic_service_list = service_list[i].basicServiceDTOs;
	            		for(var j = 0; j < basic_service_list.length; j++){
	            			if((j+1) % 3 ==1){//每一行
	            				div = div + "<div class='weui-flex'>";
	            			}

            				div = div + "<div class='weui-flex__item'>";
            				div = div + "<a href='${pageContext.request.contextPath}/qyfw/basicService/wx_service_form?openid=${openid}&basicServiceId="+basic_service_list[j].basicServiceId+"'>";
            				if(basic_service_list[j].isHot){
            					div = div + "<div class='placeholder red' style='font-size:12px'>"+basic_service_list[j].basicServiceName+"</div>";
            				}else{
            					div = div + "<div class='placeholder' style='font-size:12px'>"+basic_service_list[j].basicServiceName+"</div>";
            				}
            				div = div + "</a></div>";
            				if((j+1) % 3 ==0){//每一行
	            				div = div + "</div>";
	            			}
	            		}
	            		div = div + "</div></div>";
	            	}
	            	
	            	div = div + "</div></div>";
	            	$("#searchBar").after(div);
	            	
	            }
	        },
	        error : function(err) {
	            
	        }
	    });
	});
	
</script>
</body>
</html>
