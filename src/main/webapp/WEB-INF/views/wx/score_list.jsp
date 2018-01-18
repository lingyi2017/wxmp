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
		
		<style type="text/css">
		.topShow {
			background-color: white;
			border-top: 1px solid gray;
			position: absolute;
			height: 40%;
			width: 100%;
			bottom: 0px;
			left: 0px;
			border-top-left-radiusï¼135%;
			-moz-border-top-left-radius: 135%;      
			-webkit-border-top-left-radius: 135%;
			border-top-right-radiusï¼135;
			-moz-border-top-right-radius: 135%;      
			-webkit-border-top-right-radius: 135%;
		}
		
		.quan {
			float: left;
			position: absolute;
			width: 30%;
			height: 32%; 
			border: 1px solid white;
			border-radiusï¼90%;
			-moz-border-radius: 90%;      
			-webkit-border-radius: 90%;
			margin-left: 30%;
			text-align: center;
			color: white;
		}
	</style>
	</head>
	<body style="height: 100%;background-color: #F5F5F5;font-family:'黑体';">
		<div class="weui-cells" style="margin-top: -1%;width: 100%;background-color: white;position: relative;">
			<div class="weui-cell" style="height: 300px;background-color: #F6B92A;">
				<div style="height: 60%;">
					<div style="float: left;position: absolute;left: 3%;top: 5%;color: white;" onclick="javascript:history.back(-1)"><img style="width: 30px;height: 30px;" src="${ctx }/static/images/wx/score-back.png"></div>
					<div style="float: left;position: absolute;left: 40%;top: 5%;color: white;">积分查询</div>
					<div class="quan">
						<div style="margin-top: 20%;font-size: small;">当前积分</div>
						<div style="font-size: xx-large;">${account.score }</div>
					</div>
				</div>
				<div class="topShow"></div>
			</div>
			
			<div style="margin-top: -12%;background-color: white;">
				<c:forEach items="${list }" var="entity">
					<div class="weui-cell">
						<div class="weui-cell__bd">
							<div style="">${fns:getDictLabel(entity.type, 'dcxt_score_type', '无')}</div>
							<div style="color: graytext;font-size: small;">${entity.remarks }</div>
						</div>
						<div class="weui-cell__bd" style="margin-right: -60%;">
							<div style="color: red;padding-left: 15%;"><c:if test="${entity.score  > 0}">+</c:if> ${entity.score }</div>
							<div style="color: graytext;font-size: small;"><fmt:formatDate value="${entity.createDate }" pattern="yyyy-MM-dd" /></div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		
<script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/jquery-weui.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/weixin/city-picker.js"></script>
<script type="text/javascript" src="${ctx}/static/js/weixin/fastclick.js"></script>
<script>

</script>
</body>
</html>
