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
<!--选项卡-->
  <div class="weui-tab">
   <div class="weui-navbar">
    <div class="weui-navbar__item weui-bar__item_on" href="#tab1">  
            	收入
        </div>  
        <div class="weui-navbar__item" href="#tab2">  
            	支出
        </div>
   </div>
   <div class="weui-tab__bd">  
        <div id="tab1" class="weui-tab__bd-item weui-tab__bd-item--active infinite">  
            <div class="content-padded">  
  
            </div>  
            <div class="weui-loadmore">  
                <i class="weui-loading"></i>  
                <span class="weui-loadmore__tips">正在加载</span>  
            </div>  
        </div>  
        <div id="tab2" class="weui-tab__bd-item infinite">  
            <div class="content-padded">  
                  
            </div>  
            <div class="weui-loadmore">  
                <i class="weui-loading"></i>  
                <span class="weui-loadmore__tips">正在加载</span>  
            </div>  
        </div>  
    </div>  
  </div>

<script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/jquery-weui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/weixin/city-picker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/weixin/fastclick.js"></script>
<script>

  //初始化变量  
    max=10,page=1;  
    $(function () {  
        //切换tab标签  
        $(".weui-navbar__item").click(function () {  
            $(".weui-loadmore").html('<i class="weui-loading"></i> <span class="weui-loadmore__tips">正在加载</span>')  
            $(".infinite").infinite()  
            max=10,page=1;  
            var findbox=$($(this).attr("href")).find(".content-padded");  
            findbox.empty();  
            ajaxdata(page,findbox);  
        })  
        //第一次进入页面加载  
        ajaxdata(page,$("#tab1").find(".content-padded"))  
        //滚动加载更多  
        $(".infinite").infinite().on("infinite", function() {  
            var self = this;  
            if(self.loading) return;  
            self.loading = true;  
            setTimeout(function() {  
                page=page+1;  
                ajaxdata(page,$(self).find(".content-padded"))  
                self.loading = false;  
            }, 1000);   //模拟延迟  
        });  
    })  
    //ajax加载数据 p为page ele为元素  
    function ajaxdata(p,ele) {  
        //判断不同的tab标签  
        var data;
        var account_id = "${account.id}";
        if(ele.parent().attr("id")=="tab1"){
        	data={"offset":(p-1)*max,"limit":max,"type":1,"accountId":account_id};
        }else{
        	data={"offset":(p-1)*max,"limit":max,"type":2,"accountId":account_id};
        }
        var url="${pageContext.request.contextPath}/dcxt/accountscorehistory/scoreListByWeiXin";  
        console.info("---");
        $.get(url,data,function (res) {
        	console.info(res);
            if(res.length==0){
                //没有数据时  
                $(".infinite").destroyInfinite()  
                $(".weui-loadmore").html('<div class="weui-loadmore weui-loadmore_line"> <span class="weui-loadmore__tips">暂无数据</span> </div>')  
            }  
            for(var i=0;i<res.length;i++){
                ele.append('<a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">'  
                        +'<div class="weui-media-box__bd">'  
                        +'<h4 class="weui-media-box__title">'+res[i].score+'</h4>'  
                        +'</div>'  
                        +'</a>')  
            }  
        })  
        
         
    }  

</script>
</body>
</html>
