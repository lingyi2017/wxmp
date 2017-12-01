/**
 * Created by Ecloud on 2017/11/28.
 */

var nowProductId;

var nowMealId;

/**
 * 打开菜品模态框
 *
 * @param productId 产品ID
 * @param mealId 餐标ID
 */
function showFoodMenu(productId, mealId) {

    $("#menuModal").modal('show');
    $(".dishesModal").find("input").each(function () {
        $(this).prop("checked", false);
    });
    nowProductId = productId;
    nowMealId = mealId;

}

/**
 * 添加菜品
 *
 */
function addDish() {

    var dishesTdHTM = "";
    $(".dishesModal").find("input").each(function () {
        if ($(this).prop("checked")) {
            dishesTdHTM += "<span class='label label-inverse' style='margin-right: 5px;' id='" + $(this).prop("value") + "'>" +
                $(this).prop("name") +
                " <i class='icon-remove-sign icon-white' style='cursor: pointer;' onclick='removeDish(this)'></i>" +
                "</span>";
        }
    });
    var dishesTdId = nowProductId + "-" + nowMealId;
    if (dishesTdHTM != "") {
        if ($("#" + dishesTdId + " span").size() > 0) {
            $("#" + dishesTdId + " span:last").after(dishesTdHTM);
        } else {
            $("#" + dishesTdId).append(dishesTdHTM);
        }
    }
    $("#menuModal").modal('hide');

}

/**
 * 删除菜品
 *
 * @param dish
 */
function removeDish(dish) {
    $(dish).parent().remove();
}

/**
 * 保存菜单信息
 *
 */
function saveFoodMenu() {

    var foodMenuDto = {};

    var createDate = $("#createDate").val();
    foodMenuDto['createDate'] = createDate;

    var foodMenuItemDtos = new Array();
    $(".dishesTd").each(function () {
        var foodMenuItemDto = {};
        var dishesTdId = $(this).prop("id");
        var idArray = dishesTdId.split("-");
        var productId = idArray[0];
        var mealId = idArray[1];
        foodMenuItemDto['productId'] = productId;
        foodMenuItemDto['mealId'] = mealId;
        var dishIds = new Array();
        $(this).find("span").each(function () {
            var dishId = $(this).prop("id");
            dishIds.push(dishId);
        })
        foodMenuItemDto['dishIds'] = dishIds;

        foodMenuItemDtos.push(foodMenuItemDto);
    });

    foodMenuDto['foodMenuItemDtos'] = foodMenuItemDtos;

    var foodMenuDtoStr = JSON.stringify(foodMenuDto);
    $.ajax({
        contentType: "application/json",
        type: "post",
        data: foodMenuDtoStr,
        url: "${ctx}/dcxt/foodMenu/save",
        async: true,
        dataType: "json",
        success: function (data) {
            alert('操作成功');
            if (data) {
                if ('200' == data.code) {

                } else {

                }
            }
        },
        error: function (data) {
            alert('操作失败');
        }
    });

}