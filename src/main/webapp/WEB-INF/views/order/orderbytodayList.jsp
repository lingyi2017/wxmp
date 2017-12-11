<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>配送订单管理</title>
    <meta name="decorator" content="default"/>
    <%@include file="/WEB-INF/views/include/dialog.jsp" %>
    <style type="text/css">.sort {
        color: #0663A2;
        cursor: pointer;
    }</style>
    <script type="text/javascript">
        $(document).ready(function () {
            // 表格排序
            var orderBy = $("#orderBy").val().split(" ");
            $("#contentTable th.sort").each(function () {
                if ($(this).hasClass(orderBy[0])) {
                    orderBy[1] = orderBy[1] && orderBy[1].toUpperCase() == "DESC" ? "down" : "up";
                    $(this).html($(this).html() + " <i class=\"icon icon-arrow-" + orderBy[1] + "\"></i>");
                }
            });
            $("#contentTable th.sort").click(function () {
                var order = $(this).attr("class").split(" ");
                var sort = $("#orderBy").val().split(" ");
                for (var i = 0; i < order.length; i++) {
                    if (order[i] == "sort") {
                        order = order[i + 1];
                        break;
                    }
                }
                if (order == sort[0]) {
                    sort = (sort[1] && sort[1].toUpperCase() == "DESC" ? "ASC" : "DESC");
                    $("#orderBy").val(order + " DESC" != order + " " + sort ? "" : order + " " + sort);
                } else {
                    $("#orderBy").val(order + " ASC");
                }
                page();
            });
        });
        function page(n, s) {
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").attr("action", "${ctx}/dcxt/orderbyday/");
            $("#searchForm").submit();
            return false;
        }
        
        function allCheck(){
        	var nn = $("#all_order_id").is(":checked"); //判断th中的checkbox是否被选中，如果被选中则nn为true，反之为false
            if(nn == true) {
                var namebox = $("input[name='order_id']");  //获取name值为boxs的所有input
                for(i = 0; i < namebox.length; i++) {
                    namebox[i].checked=true;    //js操作选中checkbox
                }
            }
            if(nn == false) {
                var namebox = $("input[name='order_id']");
                for(i = 0; i < namebox.length; i++) {
                	namebox[i].checked=false;
                }
            }
        }
        
        function check_delivery(){
        	var namebox = $("input[name='order_id']");  //获取name值为boxs的所有input
        	var orderIds = new Array();
            for(i = 0; i < namebox.length; i++) {
            	if(namebox[i].checked){
            		orderIds.push(namebox[i].value);
            	}
                
            }
            if(orderIds.length == 0){
            	$("#alert_true").css("display", "none");
            	$("#alert_false").css("display", "");
            	return;
            }else{
            	$("#alert_false").css("display", "none");
            }
        	$.ajax({
        	    url:'${ctx}/dcxt/orderbyday/deliveryByDay',
        	    type:'POST',
        	    async:true,
        	    data:{
        	    	orderIds:orderIds
        	    },
        	    timeout:5000,
        	    dataType:'json', 
        	    beforeSend:function(xhr){
        	        
        	    },
        	    success:function(data){
        	    	console.info(data);
        	        if(data){
        	        	$("#alert_true").css("display", "");
        	        	$("#searchForm").submit();
        	        }else{
        	        	alert("操作失败");
        	        }
        	    }
        	})
        }
        
    </script>
</head>
<body>

<ul class="nav nav-tabs">
    <li class="active"><a>配送订单列表</a></li>
    <%-- <shiro:hasPermission name="dcxt:account:edit">
        <li><a href="${ctx}/dcxt/account/form">用户修改</a></li>
    </shiro:hasPermission> --%>
</ul>
<form:form id="searchForm" modelAttribute="orderQueryDTO" action="${ctx}/dcxt/orderbyday/todayList" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <input id="orderBy" name="orderBy" type="hidden" value="${page.orderBy}"/>

    	<button type="button" class="btn btn-primary" onclick="check_delivery()">  
        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>全部出餐  
    </button>
</form:form>
<div style="margin-top:10px;margin-bottom: 10px">

</div>

<div id="alert_false" class="alert alert-danger" style="display: none">
         <strong>请选择记录!</strong>
</div>
<div id="alert_true" class="alert alert-success" style="display: none">
         <strong>出餐成功!</strong>
</div>

<tags:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
    	<th><input id="all_order_id" type="checkbox" onclick="allCheck()"/></th>
        <th>订单号</th>
        <th>产品</th>
        <th>收货人</th>
        <th>收货电话</th>
        <th>收货地址</th>
        <th>配送日期</th>
        <th>配送状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="entity">
        <tr>
        	<td><input type="checkbox" name="order_id" value="${entity.id }"/></td>
            <td>${entity.orderNumber}</td>
            <td></td>
            <td>${entity.person}</td>
            <td>${entity.phone}</td>
            <td>${entity.address}</td>
            <td>${entity.deliveryDate}</td>
            <td>${fns:getDictLabel(entity.status, 'order_delivery_status', '无')}</td>
            <td>
                <a href="${ctx}/dcxt/accountaddress/formByOrderId?orderId=${entity.id}">查看主订单</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>