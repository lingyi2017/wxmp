<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>菜单信息</title>
    <meta name="decorator" content="default"/>
    <style>


    </style>

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
        <li class="active"><a>菜单${not empty foodMenu.id ? '修改' : '添加'}</a></li>
    </shiro:hasPermission>
</ul>

<form:form id="inputForm" modelAttribute="foodMenu" action="${ctx}/dcxt/foodMenu/save" method="post"
           class="form-horizontal">
    <form:hidden path="id"/>
    <tags:message content="${message}"/>

    <!-- 页面布局 Start -->
    <div class="accordion" id="accordion2">
        <div class="accordion-group">
            <div class="accordion-heading">
                <a class="accordion-toggle" data-toggle="collapse" href="#collapseOne">
                    增肌
                </a>
            </div>
            <div id="collapseOne" class="accordion-body collapse in">
                <div class="accordion-inner">
                    <div class="container-fluid">
                        <div class="row-fluid">
                            <div class="span1">份量</div>
                            <div class="span11">
                                <span class="badge badge-info" data-html="true" data-trigger="hover"
                                      data-container="body" data-toggle="popover" data-placement="top"
                                      data-content="<div><label>价格：</label><label>18¥</label></div><div>">套餐一</span>
                                <span class="badge badge-info" data-html="true" data-trigger="hover"
                                      data-container="body" data-toggle="popover" data-placement="top"
                                      data-content="<div><label>价格：</label><label>15¥</label></div><div>">套餐一</span>
                            </div>
                        </div>
                        <div class="row-fluid">
                            <div class="span1" style="margin-top: 8px;">餐标</div>
                            <div class="span11">
                                <table class="table">
                                    <tbody>
                                    <tr>
                                        <td>
                                            早餐（主菜+2个配菜+例汤+米饭）
                                            <i class="icon-plus-sign"
                                               style="cursor: pointer;margin-top: 2px;"
                                               onclick="showFoodMenu();"></i>
                                        </td>
                                        <td>午餐（双主菜+2个配菜+例汤+米饭）<i class="icon-plus-sign"
                                                                 style="cursor: pointer;margin-top: 2px;"></i></td>
                                        <td>晚餐（主菜+1个配菜+粥）<i class="icon-plus-sign"
                                                            style="cursor: pointer;margin-top: 2px;"></i></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <span class="label" style="cursor: pointer;">粥</span>
                                            <span class="label" style="cursor: pointer;">酱肉包</span>
                                            <span class="label" style="cursor: pointer;">咸菜</span>
                                        </td>
                                        <td>
                                            <span class="label" style="cursor: pointer;">鱼香肉丝</span>
                                            <span class="label" style="cursor: pointer;">宫保鸡丁</span>
                                            <span class="label" style="cursor: pointer;">海带汤</span>
                                        </td>
                                        <td>
                                            <span class="label" style="cursor: pointer;">米饭</span>
                                            <span class="label" style="cursor: pointer;">炝炒莲白</span>
                                            <span class="label" style="cursor: pointer;">番茄蛋汤</span>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="accordion-group">
            <div class="accordion-heading">
                <a class="accordion-toggle" data-toggle="collapse" href="#collapseOne">
                    塑形
                </a>
            </div>
            <div id="collapseTwo" class="accordion-body collapse in">
                <div class="accordion-inner">
                    <div class="container-fluid">
                        <div class="row-fluid">
                            <div class="span1">份量</div>
                            <div class="span11">
                                <span class="badge badge-info" data-html="true" data-trigger="hover"
                                      data-container="body" data-toggle="popover" data-placement="top"
                                      data-content="<div><label>价格：</label><label>18¥</label></div><div>">套餐一</span>
                                <span class="badge badge-info" data-html="true" data-trigger="hover"
                                      data-container="body" data-toggle="popover" data-placement="top"
                                      data-content="<div><label>价格：</label><label>15¥</label></div><div>">套餐一</span>
                            </div>
                        </div>
                        <div class="row-fluid">
                            <div class="span1" style="margin-top: 8px;">餐标</div>
                            <div class="span11">
                                <table class="table">
                                    <tbody>
                                    <tr>
                                        <td>
                                            早餐（主菜+2个配菜+例汤+米饭）
                                            <i class="icon-plus-sign"
                                               style="cursor: pointer;margin-top: 2px;"
                                               data-toggle="modal"
                                               onclick="showFoodMenu();"></i>
                                        </td>
                                        <td>午餐（双主菜+2个配菜+例汤+米饭）<i class="icon-plus-sign"
                                                                 style="cursor: pointer;margin-top: 2px;"></i></td>
                                        <td>晚餐（主菜+1个配菜+粥）<i class="icon-plus-sign"
                                                            style="cursor: pointer;margin-top: 2px;"></i></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <span class="label">粥</span>
                                            <span class="label">酱肉包</span>
                                            <span class="label">咸菜</span>
                                        </td>
                                        <td>
                                            <span class="label">鱼香肉丝</span>
                                            <span class="label">宫保鸡丁</span>
                                            <span class="label">海带汤</span>
                                        </td>
                                        <td>
                                            <span class="label">米饭</span>
                                            <span class="label">炝炒莲白</span>
                                            <span class="label">番茄蛋汤</span>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="accordion-group">
            <div class="accordion-heading">
                <a class="accordion-toggle" data-toggle="collapse" href="#collapseOne">
                    减脂
                </a>
            </div>
            <div id="collapseThree" class="accordion-body collapse in">
                <div class="accordion-inner">
                    <div class="container-fluid">
                        <div class="row-fluid">
                            <div class="span1">份量</div>
                            <div class="span11">
                                <span class="badge badge-info" data-html="true" data-trigger="hover"
                                      data-container="body" data-toggle="popover" data-placement="top"
                                      data-content="<div><label>价格：</label><label>18¥</label></div><div>">套餐一</span>
                                <span class="badge badge-info" data-html="true" data-trigger="hover"
                                      data-container="body" data-toggle="popover" data-placement="top"
                                      data-content="<div><label>价格：</label><label>15¥</label></div><div>">套餐一</span>
                            </div>
                        </div>
                        <div class="row-fluid">
                            <div class="span1" style="margin-top: 8px;">餐标</div>
                            <div class="span11">
                                <table class="table">
                                    <tbody>
                                    <tr>
                                        <td>早餐（主菜+2个配菜+例汤+米饭）<i class="icon-plus-sign"
                                                                style="cursor: pointer;margin-top: 2px;"></i></td>
                                        <td>午餐（双主菜+2个配菜+例汤+米饭）<i class="icon-plus-sign"
                                                                 style="cursor: pointer;margin-top: 2px;"></i></td>
                                        <td>晚餐（主菜+1个配菜+粥）<i class="icon-plus-sign"
                                                            style="cursor: pointer;margin-top: 2px;"></i></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <span class="label">粥</span>
                                            <span class="label">酱肉包</span>
                                            <span class="label">咸菜</span>
                                        </td>
                                        <td>
                                            <span class="label">鱼香肉丝</span>
                                            <span class="label">宫保鸡丁</span>
                                            <span class="label">海带汤</span>
                                        </td>
                                        <td>
                                            <span class="label">米饭</span>
                                            <span class="label">炝炒莲白</span>
                                            <span class="label">番茄蛋汤</span>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
    </div>
    <!-- 页面布局 End -->

    <div class="form-actions">
        <shiro:hasPermission name="dcxt:foodMenu:edit">
            <input id="btnSubmit" class="btn btn-primary" type="submit" value="<spring:message code='save' />"/>&nbsp;
        </shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="<spring:message code='return' />"
               onclick="history.go(-1)"/>
    </div>
</form:form>

<!-- 菜单页面 Start -->
<div id="menuModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="menuLabel"
     aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="menuLabel">菜单</h3>
    </div>
    <div class="modal-body">
        <span class="badge badge-inverse"><input type="checkbox" name="" id="1" value="">鱼香肉丝</span>
        <span class="badge badge-inverse"><input type="checkbox" name="" id="2" value="">番茄炒蛋</span>
        <span class="badge badge-inverse"><input type="checkbox" name="" id="3" value="">宫保鸡丁</span>
        <span class="badge badge-inverse"><input type="checkbox" name="" id="4" value="">麻辣酸菜鱼</span>
    </div>
    <div class="modal-footer">
        <button class="btn btn-primary">保存</button>
    </div>
</div>
<!-- 菜单页面 End -->

</body>
</html>