<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>菜单信息</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript" charset="utf-8"
            src="${ctx}/static/js/dcxt/addFoodMenu.js?d=<%=new java.util.Date() %>"></script>
    <script type="text/javascript">

        $("#inputForm").validate();

        $(function () {
            $("[data-toggle='popover']").popover();
        });

    </script>
</head>
<body>

<ul class="nav nav-tabs">
    <li><a href="${ctx}/dcxt/foodMenu/">菜单列表</a></li>
    <shiro:hasPermission name="dcxt:foodMenu:edit">
        <li class="active"><a>菜单添加</a></li>
    </shiro:hasPermission>
</ul>

<form:form id="inputForm" method="post" class="form-horizontal">
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
                                              data-container="body" data-toggle="popover" data-placement="bottom"
                                              data-content="<div><table class='table'>
                                              <tr>
                                                <td style='width:60px;'>价格</td><td>${combo.price}</td>
                                              </tr>
                                              <tr>
                                                <td>获得积分</td><td>${combo.gainIntegral}</td>
                                              </tr>
                                              <tr>
                                                <td>兑换积分</td><td>${combo.exchangeIntegral}</td>
                                              </tr>
                                              <tr>
                                                <td>适用人群</td><td>${combo.applicablePeople}</td>
                                              </tr>
                                              </table><div>">${combo.name}</span>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="row-fluid">
                                <div class="span1" style="margin-top: 8px;">餐标</div>
                                <div class="span11">
                                    <table class="table">
                                        <tr>
                                            <c:forEach items="${meals}" var="meal" varStatus="status">
                                                <td <c:if
                                                        test="${!status.last}"> style="width: ${mealTdWidth}%;" </c:if>>
                                                        ${meal.type}（${meal.description}）
                                                    <i class="icon-plus-sign"
                                                       style="cursor: pointer;margin-top: 2px;"
                                                       onclick="showFoodMenu('${product.id}', '${meal.id}');"></i>
                                                </td>
                                            </c:forEach>
                                        </tr>
                                        <tr>
                                            <c:forEach items="${meals}" var="meal">
                                                <td id="${product.id}-${meal.id}" class="dishesTd">
                                                </td>
                                            </c:forEach>
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
                                    <input id="addDate" name="addDate" type="text" readonly="readonly"
                                           maxlength="20" class="input-large Wdate"
                                           value="${addDate}"
                                           onclick="WdatePicker({dateFmt:'yyyy-MM-dd', isShowClear:false, minDate:'${minDate}', disabledDays: [0,6]});"/>
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
            <input id="btnSubmit" class="btn btn-primary" type="button" onclick="saveFoodMenu()"
                   value="<spring:message code='save' />"/>&nbsp;
        </shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="<spring:message code='return' />"
               onclick="history.go(-1)"/>
    </div>
</form:form>

<!-- 引入菜品页面 -->
<jsp:include page="dishModal.jsp" flush="true"/>
</body>
</html>