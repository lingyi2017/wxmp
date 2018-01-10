<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>材料管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#value").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					var chk_value =[]; 
					$('input[name="customerTypeBox"]:checked').each(function(){ 
						chk_value.push($(this).val()); 
					});
					$("#customerType").val(chk_value);
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
			//如果为修改，多选框赋值
			var customerType = $("#customerType").val();
			if(customerType !==null && customerType !== undefined && customerType != ""){
				var value = customerType.split(",");
				for(var i=0;i<value.length;i++){  
			        $(":checkbox[value='"+value[i]+"']").prop("checked",true);   
			    }
			}
		});


		// 模板上传
        Dropzone.autoDiscover = false;
        $(document).ready(function () {
            $("#name").focus();
            $("#inputForm").validate();

            var myDropzone = new Dropzone(
                "div#fileUpload",
                {
                    url: "${ctx}/file/upload",  // 图片上传的服务器地址
                    addRemoveLinks: true,  // 添加删除连接
                    maxFiles: 4,  // 最多文件数量(需要修改myDropzone.options.maxFiles才能生效)
                    acceptedFiles: "image/*",  // 允许上传的文件类型
                    dictDefaultMessage: "拖拽或点击上传",  // 提示文本
                    dictRemoveFile: "移除文件",  // 移除文件链接的文本
                    dictMaxFilesExceeded: "您不能上传更多的文件"  // 超过最大文件数量的提示文本
                }
            );

            // 文件回显
            var path = $("#path").val();
            var pathArray = path.split(";");  // 模板Url转为数组
            // 展示服务器存在的模板
            if (inputForm.path.value.length != 0) {
                for (var i = 0; i < pathArray.length; i++) {
                    var mockFile = {name: pathArray[i], size: 12345};  // 创建模拟文件
                    myDropzone.emit("addedfile", mockFile);  // 调用默认addedfile事件处理程序
                    myDropzone.emit("thumbnail", mockFile, "${ctx}" + pathArray[i]);  // 显示文件缩略图
                }
            }

            // 上传文件到服务器
            myDropzone.on("success", function (file, responseText) {
                if (responseText.substring(0, 1) == 0) {  // 0表示上传成功(后跟上传后的文件路径);1表示失败(后跟失败描述)
                    path = $("#path").val();  // 获取最新的图片url
                    if (path != "") {
                        path = path + ";" + responseText.substring(2);  // 拼接图片url以 ; 分隔
                    } else {
                        path = responseText.substring(2);
                    }
                    $("#path").attr("value", path);  // 修改图片 url
                    top.$.jBox.tip("模板上传成功", "1", {persistent: true, opacity: 0});
                } else {
                    top.$.jBox.tip("模板上传失败：" + responseText.substring(2), "1", {persistent: true, opacity: 0});
                }
            });

            // 删除图片的操作
            myDropzone.on("removedfile", function (file) {
                var removeFileName = file.name.split(".")[0];  // 获取被删除文件的名称
                path = $("#path").val();  // 获取最新的图片url
                pathArray = path.split(";");  // 图片Url转为数组
                for (var i = 0; i < pathArray.length; i++) {
                    var fileName = pathArray[i].split(".")[0];  // 文件名字
                    // 删除依据：截取文件长度的最后n(被删文件的长度)位，如果截取的字符串和被删文件名相同，则删除
                    if (removeFileName == fileName.slice(-removeFileName.toString().length)) {
                        pathArray.splice(i, 1);  // 第一个参数：要删除第一项的位置；第二个参数：要删除的项数
                    }
                }
                path = pathArray.join(";");  // 转字符串，并以*分隔
                $("#path").attr("value", path);  // 修改图片 url
            });
        });
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/qyfw/material/">材料列表</a></li>
		<li class="active"><a href="${ctx}/qyfw/material/form">添加材料</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="material" action="${ctx}/qyfw/material/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<tags:message content="${message}"/>
		<div class="control-group">
			<label class="control-label">材料名称:</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="50" cssClass="required checkMaterialName"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">客户性质:</label>
			<div class="controls">
				<form:hidden path="customerType"/>
				<input type="checkbox" name="customerTypeBox" value="1" class="required checkMaterialName">个人
				<input type="checkbox" name="customerTypeBox" value="2">企业
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">附件模板上传:</label>
			<div class="controls">
				<input id="path" name="path" type='hidden' value="${material.path}"/>
				<div id="fileUpload" name="fileUpload" class="dropzone" style="height:400px;width:325px;">
				</div>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">序号:</label>
			<div class="controls">
				<form:input path="sort" htmlEscape="false" maxlength="50" class="required"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">材料说明:</label>
			<div class="controls">
				<form:textarea path="descption" htmlEscape="false" rows="3" maxlength="200" class="input-xlarge"/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="qyfw:material:edit">
				<input id="btnSubmit" class="btn btn-primary" type="submit" value="<spring:message code='save' />"/>&nbsp;
			</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="<spring:message code='return' />" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>