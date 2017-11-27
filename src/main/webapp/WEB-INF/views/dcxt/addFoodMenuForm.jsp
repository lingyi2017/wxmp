<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>菜单信息</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">

        $("#type").focus();
        $("#inputForm").validate();

        $(function () {
            $("[data-toggle='popover']").popover();
        });

        function showFoodMenu() {
            $("#menuModal").modal('show');
        }

    </script>
</head>
<body>

<ul class="nav nav-tabs">
    <li><a href="${ctx}/dcxt/foodMenu/">菜单列表</a></li>
    <shiro:hasPermission name="dcxt:foodMenu:edit">
        <li class="active"><a>菜单添加</a></li>
    </shiro:hasPermission>
</ul>

<form:form id="inputForm" modelAttribute="foodMenu" action="${ctx}/dcxt/foodMenu/save" method="post"
           class="form-horizontal">
    <tags:message content="${message}"/>

    <!-- 菜单布局 Start -->
    <div class="accordion" id="accordion2">
        <c:forEach items="${products}" var="product" varStatus="status">
            <div class="accordion-group">
                <div class="accordion-heading">
                    <a class="accordion-toggle" data-toggle="collapse" href="#collapse${status.index}">
                            ${product.name}
                    </a>
                </div>
                <div id="collapse${status.index}" class="accordion-body collapse in">
                    <div class="accordion-inner">
                        <div class="container-fluid">
                            <div class="row-fluid">
                                <div class="span1">份量</div>
                                <div class="span11">
                                    <c:forEach items="${product.combos}" var="combo">
                                        <span class="badge badge-info" data-html="true" data-trigger="hover"
                                              data-container="body" data-toggle="popover" data-placement="top"
                                              data-content="<div><label>价格：</label><label>${combo.price}</label></div><div>">${combo.name}</span>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="row-fluid">
                                <div class="span1" style="margin-top: 8px;">餐标</div>
                                <div class="span11">
                                    <table class="table">
                                        <tr>
                                            <c:forEach items="${meals}" var="meal">
                                                <td>
                                                        ${fns:getDictLabel(meal.type, 'dcxt_meal_type', '无')}（${meal.description}）
                                                    <i class="icon-plus-sign"
                                                       style="cursor: pointer;margin-top: 2px;"
                                                       onclick="showFoodMenu();"></i>
                                                </td>
                                            </c:forEach>
                                        </tr>
                                        <tr>
                                            <c:forEach items="${meals}" var="meal">
                                                <td>
                                                    <span class="label" style="cursor: pointer;">粥</span>
                                                    <span class="label" style="cursor: pointer;">酱肉包</span>
                                                    <span class="label" style="cursor: pointer;">咸菜</span>
                                                </td>
                                            </c:forEach>
                                                <%--<td>
                                                    <span class="label" style="cursor: pointer;">粥</span>
                                                    <span class="label" style="cursor: pointer;">酱肉包</span>
                                                    <span class="label" style="cursor: pointer;">咸菜</span>
                                                </td>--%>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

        <c:if test="${null != products}">
            <div class="accordion-group">
                <div class="accordion-body collapse in">
                    <div class="accordion-inner">
                        <div class="container-fluid">
                            <div class="row-fluid">
                                <div class="span1">时间</div>
                                <div class="span11">
                                    <input id="createDate1" name="createDate1" type="text" readonly="readonly"
                                           maxlength="20" class="input-small Wdate"
                                           value="${createDate}"
                                           onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
    </div>
    <!-- 菜单布局 End -->

    <div class="form-actions">
        <shiro:hasPermission name="dcxt:foodMenu:edit">
            <input id="btnSubmit" class="btn btn-primary" type="submit" value="<spring:message code='save' />"/>&nbsp;
        </shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="<spring:message code='return' />"
               onclick="history.go(-1)"/>
    </div>
</form:form>

<!-- 菜品页面 Start -->
<div id="menuModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="menuLabel"
     aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="menuLabel">菜品</h3>
    </div>
    <div class="modal-body">
        <c:forEach items="${dishes}" var="dish">
            <span class="badge badge-inverse">
                <input type="checkbox" id="${dish.id}" value="${dish.id}">${dish.name}
            </span>
        </c:forEach>
    </div>
    <div class="modal-footer">
        <button class="btn btn-primary">保存</button>
    </div>
</div>
<!-- 菜品页面 End -->

</body>
</html>