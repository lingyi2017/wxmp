<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title><spring:message code='production.name' /> <spring:message code='login' /></title>
	<meta name="decorator" content="default"/>
    <link rel="stylesheet" href="${ctxStatic}/common/typica-login.css">
	<style type="text/css">
		.control-group{border-bottom:0px;}
	</style>
    <script src="${ctxStatic}/common/backstretch.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$.backstretch([
 		      "${ctxStatic}/images/bg1.jpg", 
 		      "${ctxStatic}/images/bg2.jpg",
 		      "${ctxStatic}/images/bg3.jpg"
 		  	], {duration: 10000, fade: 2000});
			$("#loginForm").validate({
				rules: {
					validateCode: {remote: "${pageContext.request.contextPath}/servlet/validateCodeServlet"}
				},
				messages: {
					username: {required: "请填写用户名."},password: {required: "请填写密码."},
					validateCode: {remote: "验证码不正确.", required: "请填写验证码."}
				},
				errorLabelContainer: "#messageBox",
				errorPlacement: function(error, element) {
					error.appendTo($("#loginError").parent());
				} 
			});
		});
		// 如果在框架中，则跳转刷新上级页面
		if(self.frameElement && self.frameElement.tagName=="IFRAME"){
			parent.location.reload();
		}
	</script>
</head>
<body>
    <div class="container">
		<!--[if lte IE 6]><br/><div class='alert alert-block' style="text-align:left;padding-bottom:10px;"><a class="close" data-dismiss="alert">x</a><h4>温馨提示：</h4><p>你使用的浏览器版本过低。为了获得更好的浏览体验，我们强烈建议您 <a href="http://browsehappy.com" target="_blank">升级</a> 到最新版本的IE浏览器，或者使用较新版本的 Chrome、Firefox、Safari 等。</p></div><![endif]-->
		<%String error = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);%>
		<div id="messageBox" class="alert alert-error <%=error==null?"hide":""%>"><button data-dismiss="alert" class="close">×</button>
			<label id="loginError" class="error"><%=error==null?"":"CaptchaException".equals(error)?"验证码错误, 请重试.":"用户或密码错误, 请重试." %></label>
		</div>
        <div id="login-wraper">
            <form id="loginForm"  class="form login-form" action="${ctx}/login" method="post">
                <fieldset><legend><span style="color:#08c;"><spring:message code='production.name' /></span></legend></fieldset>
                <div class="body">
					<div class="control-group">
						<div class="controls">
							<input type="text" id="username" name="username" class="required" value="${username}" placeholder="登录名">
						</div>
					</div>
					<div class="control-group">
						<div class="controls">
							<input type="password" id="password" name="password" class="required" placeholder="密码"/>
						</div>
					</div>
					<c:if test="${isValidateCodeLogin}">
						<div class="validateCode">
							<label for="validateCode">验证码：</label>
							<tags:validateCode name="validateCode" inputCssStyle="margin-bottom:0;"/>
						</div>
					</c:if>
                </div>
                <div class="footer">
                    <input class="btn btn-primary" type="submit" value="登 录"/>
                </div>
				<div id="themeSwitch" class="dropdown pull-right">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">${fns:getDictLabel(cookie.theme.value,'theme','默认主题')}<b class="caret"></b></a>
					<ul class="dropdown-menu">
					  <c:forEach items="${fns:getDictList('theme')}" var="dict"><li><a href="#" onclick="location='${pageContext.request.contextPath}/theme/${dict.value}?url='+location.href">${dict.label}</a></li></c:forEach>
					</ul>
					<!--[if lte IE 6]><script type="text/javascript">$('#themeSwitch').hide();</script><![endif]-->
				</div>
            </form>
        </div>
    </div>
  </body>
</html>