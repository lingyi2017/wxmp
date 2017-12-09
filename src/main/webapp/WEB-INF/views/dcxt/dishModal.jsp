<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<div id="menuModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="menuLabel"
     aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 id="menuLabel">菜品</h4>
    </div>
    <div class="warnDiv">
    </div>
    <div class="modal-body dishesModal">
        <c:forEach items="${dishTypeVos}" var="dishTypeVo">
            <div class="container-fluid">
                <div class="row-fluid">
                    <div class="span12">
                        <fieldset>
                            <legend style="font-size: 15px;">
                                    ${fns:getDictLabel(dishTypeVo.type, 'dcxt_dish_type', '无')}
                            </legend>
                        </fieldset>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <div class="row-fluid">
                    <div class="span12">
                        <c:forEach items="${dishTypeVo.dishes}" var="dish">
                        <span class="badge badge-success">
                            <input type="checkbox" value="${dish.id}" name="${dish.name}">${dish.name}
                        </span>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <div class="modal-footer">
        <button class="btn btn-primary" onclick="addDish()">保存</button>
    </div>
</div>