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
	<body style="height: 100%;font-family:'黑体';background-color: #F5F5F5;width: 100%;">
	<form action="">
	<div class="weui-cells weui-cells_form">
		<div class="weui-cells" style="margin-top: -0.7%;margin-bottom: -5px;">
			<div class="weui-cell">
			    <div class="weui-cell__bd" style="text-align:center;height: 40px;">
					<div style="float: left;position: absolute;left: 40%;top: 35%;text-align: center;font-size: large;">个人信息</div>
			    </div>
			</div>
			<div class="weui-cell" style="width: 100%;">
				<div style="float: left;width: 30%;">头像</div>
				<div style="float: left;width: 65%;text-align: right;">
					<img src="${account.imageBase64 }" class="toux" id="image"/> 
				</div>
				<div style="float: left;margin-left: 3%;">
					<input type="file"  id="imageBase64" name="imageBase64" style="opacity:0;" onchange="read_file(this)" />&gt;
				</div>
					
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
		
			<div class="weui-cell">
				<div class="weui-cell__bd">
					<a href="javascript:;" class="weui-btn weui-btn_primary" style="background-color: orange;">按钮</a>
				</div>
			</div>
	</div>
	</form>
<script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/jquery-weui.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/weixin/fastclick.js"></script>
<script>
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
	    }   
	}
	
	function edit_nickname(value){
		/* $.prompt({
			  title: '修改昵称',
			  text: '2-16位字母、汉字、下划线',
			  input: value,
			  empty: false,
			  autoClose:false,
			  onOK: function (input) {
				  var reg = /^[\u4e00-\u9fff\w]{2,16}$/;
				  if(reg.test(input)){
				      $("#nickName").val(input);
				      $.closeModal();
				  }
			  },
			  onCancel: function () {
			  }
			}); */
		/* $.modal({
			  title: "修改昵称",
			  text: "<input type='text' id='input' value='"+value+"'/>",
			  buttons: [
			    { text: "取消",  className: "default", onClick: function(){ $.closeModal();} },
			    { text: "确定", onClick: function(){ 
			    	var input = $("#input").val();
			    	var reg = / ^[a-zA-Z]{1}[-_a-zA-Z0-9]{5,19}$/;
					  if(reg.test(input)){
					      $("#nickName").val(input);
					      $.closeModal();
					  }else{
						  alert("昵称不合法");
					  }
			    } }
			  ]
			});  */
	}
</script>
</body>
</html>