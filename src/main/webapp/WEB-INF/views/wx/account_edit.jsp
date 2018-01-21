<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fns" uri="/WEB-INF/tlds/fns.tld" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	<link rel="stylesheet" href="https://cdn.bootcss.com/weui/1.1.2/style/weui.min.css">
	<link rel="stylesheet" href="https://cdn.bootcss.com/jquery-weui/1.2.0/css/jquery-weui.min.css">
	<link rel="stylesheet" href="${ctx}/static/css/weixin/style.css">
		<style>
			.toux {
				border-radius：90%;
				-moz-border-radius: 90%;      
				-webkit-border-radius: 90%;
				height: 45px;
				width: 45px;
			}
		</style>
	</head>
	<body style="height: 100%;font-family:'黑体';background-color: #F5F5F5;width: 100%;margin-top: -10%;">
	<form id="form" action="${pageContext.request.contextPath}/dcxt/account/wx_save" method="post"
      onsubmit="return sumbit_form()">

	<div class="weui-cells weui-cells_form">
		<div class="weui-cells" style="margin-top: -0.7%;margin-bottom: -5px;">
			<div class="weui-cell">
			    <div class="weui-cell__bd" style="text-align:center;height: 40px;">
					<div style="float: left;position: absolute;left: 40%;top: 35%;text-align: center;font-size: large;">个人信息</div>
			    </div>
			</div>
			<div class="weui-cell" style="width: 100%;">
				<div style="float: left;width: 30%;">头像</div>
				<div style="float: left;width: 60%;text-align: right;" onclick="changeToux()">
					<input type="hidden" name="imageBase64" id="imageBase64"/>
					<img src="${account.imageBase64 }" class="toux" id="image"/> 
				</div>
				<input type="file" id="image_upload" style="display: none;" onchange="read_file(this)" />
					
			</div>
			<div class="weui-cell" style="width: 100%;">
				<div style="float: left;width: 30%;">用户名</div>
				<div style="float: left;margin-left: 30%;">
					<input type="text" name="name" style="width: 90%;text-align: right;color: gray;" value="${account.name }" readonly="readonly"/>
				</div>
			</div>
			<div class="weui-cell" style="width: 100%;">
				<div style="float: left;width: 30%;">昵称</div>
				<div style="float: left;margin-left: 30%;">
					<input type="text" name="nickName" style="width: 90%;text-align: right;" value="${account.nickName }"/>
				</div>
			</div>
			<div class="weui-cell" style="width: 100%;">
				<div style="float: left;width: 30%;">手机号码</div>
				<div style="float: left;margin-left: 30%;">
					<input type="text" name="phone" style="width: 90%;text-align: right;" maxlength="11" value="${account.phone }" />
				</div>
			</div>
			<div class="weui-cell" style="width: 100%;">
				<div style="float: left;width: 30%;">性别</div>
				<div style="float: left;margin-left: 40%;">
					<label><input type="radio" name="sex" value="男" />男</label>&nbsp;&nbsp;
					<label><input type="radio" name="sex" value="女"/>女</label>
				</div>
			</div>
		</div>
	</div>
	
		<div class="weui-cell" style="position:absolute;bottom: 10px;height: 30px;width: 100%;margin-left: -4%;">
			<div class="weui-cell__bd">
				<a href="javascript:sumbit_form()" class="weui-btn weui-btn_primary" style="background-color: orange;">确定</a>
			</div>
		</div>
	</form>
<script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/jquery-weui.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/weixin/fastclick.js"></script>
<script>
	$(function() {
	    FastClick.attach(document.body);
	    console.info();
	    $("input[name='sex'][value='"+"${account.sex}"+"']").attr("checked",true);
	});
	function changeToux(){
		$("#image_upload").click();
	}
	
	function read_file(obj){   
	    var file = obj.files[0];      
	    //判断类型是不是图片  
	    if(!/image\/\w+/.test(file.type)){     
            alert("请确保文件为图像类型");   
            return false;   
	    }   
	    var reader = new FileReader();   
	    reader.readAsDataURL(file);   
	    reader.onload = function(e){   
			$("#image").attr('src',this.result);
			console.info(this.result);
			$("#imageBase64").val(this.result);
	    }   
	}
	
	function sumbit_form() {
		var reg = /^[\u0391-\uFFE5\w]+$/;
		var nickName = $("#nickName").val();
		alert(reg.test(nickName));
		if (!reg.test(nickName)) {
            $.alert('请输入合法的昵称,只能包含中英文,数字,下划线,减号');
            return false;
        }
        var phone = $("#phone").val();
        var tel = /^(((13[0-9]{1})|(15[0-9]{1}))+\d{8})$/;
        if (phone != "" && !tel.test(phone)) {
            $.alert('请输入正确的电话号码');
            return false;
        }
        var data = $('form').serialize();
        var content = JSON.stringify(data).replace(/"/gi, '').replace(/&/gi, '<br>');
        console.info(content);
        //$('form').submit();
    };
	
	
</script>
</body>
</html>