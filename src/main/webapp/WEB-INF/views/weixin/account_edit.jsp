<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>个人资料</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="stylesheet" href="https://cdn.bootcss.com/weui/1.1.2/style/weui.min.css">
	<link rel="stylesheet" href="https://cdn.bootcss.com/jquery-weui/1.2.0/css/jquery-weui.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/weixin/style.css">
</head>
<body ontouchstart>
<!--主体-->
<form>
  <div class="weui-cells__title">我的资料</div>
<div class="weui-cells weui-cells_form">
    <div class="weui-cell">
        <div class="weui-cell_hd">
            <label class="weui-label">昵称</label>
        </div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui-input" name="name" type="text" />
        </div>
    </div>
    <div class="weui-cell">
        <div class="weui-cell_hd">
            <label class="weui-label">性别</label>
        </div>
        <div class="weui_cell_bd weui_cell_primary">
        	<input class="weui-input" name="age" type="text" />
        </div>
    </div>
    <div class="weui-cell">
        <div class="weui-cell_hd">
            <label class="weui-label">年龄</label>
        </div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui-input" name="age" type="text" />
        </div>
    </div>
    <div class="weui-cell">
        <div class="weui-cell_hd">
            <label class="weui-label">身高(CM)</label>
        </div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui-input" name="name" type="text" />
        </div>
    </div>
    <div class="weui-cell">
        <div class="weui-cell_hd">
            <label class="weui-label">体重(KG)</label>
        </div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui-input" name="name" type="text" />
        </div>
    </div>
    <div class="weui-cell">
        <div class="weui-cell_hd">
            <label class="weui-label">我的需求</label>
        </div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui-input" name="name" type="text" />
        </div>
    </div>
</div>
<div class="weui-btn_area">
    <a class="weui-btn weui-btn_primary" id="button" href="javascript:">保存</a>
</div>
</form>


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
