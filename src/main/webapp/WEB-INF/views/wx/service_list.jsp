<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/wx/_head.jsp" %>
<html>
<head>
    <title><spring:message code='wx.title'/></title>
    <style type="text/css">
    </style>
</head>
<body>
<header>
    <h3>服务列表</h3>
</header>
<div id="container">
</div>
<%@ include file="/WEB-INF/views/wx/_foot.jsp" %>

<script type="text/javascript">

    $(function () {
        $.ajax({
            url: "${pageContext.request.contextPath}/qyfw/serviceCategory/wx_service_list",
            type: "post",
            dataType: "json",
            data: {wxMenuId: "gszc"},
            /*data : {wxMenuId:"${wxMenuId}"},*/
            cache: false,
            async: false,
            success: function (data) {
                if (data.result) {
                    var service_list = data.obj;
                    var serviceHTM = "";
                    for (var i = 0; i < service_list.length; i++) {
                        serviceHTM += "<div class='mt20 bg-color-white'><div class='service-title'><h3>" + service_list[i].serviceCategoryName + "</h3></div>";
                        serviceHTM += "<div class='weui-grids'>";
                        var basic_service_list = {};
                        if (typeof(service_list[i].basicServiceDTOs) == "undefined") {
                            basic_service_list.length = 0;
                        } else {
                            basic_service_list = service_list[i].basicServiceDTOs;
                        }
                        if (basic_service_list.length > 0) {
                            for (var j = 0; j < basic_service_list.length; j++) {
                                serviceHTM += "<a href='${pageContext.request.contextPath}/qyfw/basicService/wx_service_form?openid=${openid}&basicServiceId=" + basic_service_list[j].basicServiceId + "' class='weui-grid js_grid'>";
                                if (basic_service_list[j].isHot) {
                                    serviceHTM += "<p class='weui-grid__label red'>" + basic_service_list[j].basicServiceName + "</p>";
                                } else {
                                    serviceHTM += "<p class='weui-grid__label'>" + basic_service_list[j].basicServiceName + "</p>";
                                }
                                serviceHTM += "</a>";
                            }
                        } else {
                            serviceHTM += "<div class='weui-flex'><div class='weui-flex__item'><div class='no-service'>暂无服务</div></div></div>";
                        }
                        serviceHTM += "</div></div>";
                    }
                    $("#container").html(serviceHTM);
                }
            },
            error: function (err) {

            }
        });
    });

</script>
</body>
</html>
