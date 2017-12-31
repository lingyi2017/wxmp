<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>套餐查询</title>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
		<link rel="stylesheet" href="https://cdn.bootcss.com/weui/1.1.2/style/weui.min.css">
		<link rel="stylesheet" href="https://cdn.bootcss.com/jquery-weui/1.2.0/css/jquery-weui.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/weixin/calendar-price-jquery.min.css">
		<style>
		    body {
		      margin: 0; padding: 0; font-family: "Microsoft YaHei UI";
		    }
		</style>
	</head>

<body>
<div class="container"></div>

<script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
		<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/jquery-weui.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/weixin/calendar-price-jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/weixin/fastclick.js"></script>
<!--<script src="src/js/calendar-price-jquery.js"></script>-->

<script>
	
  function goBack(){
  	$(location).attr('href', 'http://www.baidu.com');
  }
  
  $(function () {

    var mockData = [
      {
        date: "2017-12-31",
        taocan: "增肌",
        zaocan: "鸡蛋",
        zhongcan: "稀饭",
        wancan: "牛奶"
      }
    ];

    for (var i = 0; i < 100; i++) {
      mockData.push({
        date: '2018-'+ fd(i%8 + 1) +'-' + fd(randNum(30)),
        taocan: "增肌"
      });
    }

    $.CalendarPrice({
      el: '.container',
//        startDate: '2017-08-02',
      endDate: '2018-2-20',
      data: mockData,
      // 配置需要设置的字段名称
      config: [
        {
          key: 'taocan',
          name: '套餐'
        },{
          key: 'zaocan',
          name: '早餐'
        },{
          key: 'zhongcan',
          name: '中餐'
        },{
          key: 'wancan',
          name: '晚餐'
        },
      ],
      // 配置在日历中要显示的字段
      show: [
        {
          key: 'taocan',
          name: ''
        }
      ],
      callback: function (data) {
        console.log('callback ....');
        console.log(data);
      },
      cancel: function () {
        console.log('取消设置 ....');
        // 取消设置
        // 这里可以触发关闭设置窗口
        // ...
      },
      reset: function () {
        console.log('数据重置成功！');
      },
      error: function (err) {
        console.error(err.msg);
        alert(err.msg);
      },
      // 自定义颜色
      style: {
        // 头部背景色
        headerBgColor: '#098cc2',
        // 头部文字颜色
        headerTextColor: '#fff',
        // 周一至周日背景色，及文字颜色
        weekBgColor: '#098cc2',
        weekTextColor: '#fff',
        // 周末背景色，及文字颜色
        weekendBgColor: '#098cc2',
        weekendTextColor: '#fff',
        // 有效日期颜色
        validDateTextColor: '#333',
        validDateBgColor: '#fff',
        validDateBorderColor: '#eee',
        // Hover
        validDateHoverBgColor: '#098cc2',
        validDateHoverTextColor: '#fff',
        // 无效日期颜色
        invalidDateTextColor: '#ccc',
        invalidDateBgColor: '#fff',
        invalidDateBorderColor: '#eee',
        // 底部背景颜色
        footerBgColor: '#fff',
        // 重置按钮颜色
        resetBtnBgColor: '#77c351',
        resetBtnTextColor: '#fff',
        resetBtnHoverBgColor: '#55b526',
        resetBtnHoverTextColor: '#fff',
        // 确定按钮
        confirmBtnBgColor: '#098cc2',
        confirmBtnTextColor: '#fff',
        confirmBtnHoverBgColor: '#00649a',
        confirmBtnHoverTextColor: '#fff',
        // 取消按钮
        cancelBtnBgColor: '#fff',
        cancelBtnBorderColor: '#bbb',
        cancelBtnTextColor: '#999',
        cancelBtnHoverBgColor: '#fff',
        cancelBtnHoverBorderColor: '#bbb',
        cancelBtnHoverTextColor: '#666'
      }
      // 点击有效的某一触发的回调函数
      // 注意：配置了此参数，设置窗口无效，即不能针对日期做参数设置
      // 返回每天的数据
//        everyday: function (dayData) {
//            console.log('点击某日，返回当天的数据');
//            console.log(dayData);
//        },
      // 隐藏底部按钮（重置、确定、取消），前台使用该插件时，则需要隐藏底部按钮
//        hideFooterButton: true
    });

  });

  function randNum(max) {
    return Math.round(Math.random() * max);
  }

  function fd(n) {
    n = n.toString();
    return n[1] ? n : '0' + n;
  }
</script>

</body>
</html>