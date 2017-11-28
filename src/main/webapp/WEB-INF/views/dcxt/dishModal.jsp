<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<div id="menuModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="menuLabel"
     aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="menuLabel">菜品</h3>
    </div>
    <div class="modal-body">
        <c:forEach items="${dishTypeVos}" var="dishTypeVo">
            <div class="container-fluid">
                <div class="row-fluid">
                    <div class="span12">
                        <fieldset>
                            <legend style="font-size: 15px;">
                                <strong>${fns:getDictLabel(dishTypeVo.type, 'dcxt_dish_type', '无')}</strong>
                            </legend>
                        </fieldset>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <div class="row-fluid">
                    <div class="span12">
                        <c:forEach items="${dishTypeVo.dishes}" var="dish">
                        <span class="badge badge-inverse">
                            <input type="checkbox" id="${dish.id}" value="${dish.id}">${dish.name}
                        </span>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <div class="modal-footer">
        <button class="btn btn-primary">保存</button>
    </div>
</div>