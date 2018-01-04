<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fns" uri="/WEB-INF/tlds/fns.tld" %>
<c:set var="wxCtxStatic" value="${pageContext.request.contextPath}/static"/>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

<link href="https://cdn.bootcss.com/weui/1.1.2/style/weui.min.css" rel="stylesheet">
<link href="https://cdn.bootcss.com/jquery-weui/1.2.0/css/jquery-weui.min.css" rel="stylesheet">
<link href="${wxCtxStatic}/css/wx-common.css?DEV=<%=new java.util.Random().nextInt()%>" type="text/css" rel="stylesheet"/>
