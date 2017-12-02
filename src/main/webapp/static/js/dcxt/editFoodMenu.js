/**
 * Created by Ecloud on 2017/12/2.
 */

var nowProductId;

var nowMealId;

$(function () {

    var foodMenuId = $("#foodMenuId").val();
    var foodMenuIdStr = JSON.stringify({"foodMenuId": foodMenuId});
    $.ajax({
        contentType: "application/json",
        type: "post",
        data: foodMenuIdStr,
        url: "/wxmp/rs/dcxt/foodMenu/dishes",
        async: true,
        dataType: "json",
        success: function (data) {
            if (data) {
                if ('200' == data.status) {

                    var dishTds = data.content;
                    if (dishTds == undefined) {
                        return;
                    }

                    $(dishTds).each(function (index, dishTd) {
                        var dishesTdId = dishTd.dishesTdId;
                        var dishesTdHTM = "";
                        var dishes = dishTd.dishes;
                        $(dishes).each(function (index, dish) {
                            dishesTdHTM += "<span class='label label-inverse' style='margin-right: 5px;' id='" + dish.id + "'>" + dish.name +
                                " <i class='icon-remove-sign icon-white' style='cursor: pointer;' onclick='removeDish(this)'></i>" +
                                "</span>";
                        });
                        $("#" + dishesTdId).append(dishesTdHTM);
                    });

                } else {
                    alert("保存失败！");
                }
            }
        },
        error: function () {
            alert("保存失败！");
        }
    });

});

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
 * 修改菜单信息
 *
 */
function editFoodMenu() {

    var foodMenuDto = {};

    var foodMenuId = $("#foodMenuId").val();
    foodMenuDto['id'] = foodMenuId;

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
        url: "/wxmp/rs/dcxt/foodMenu/edit",
        async: true,
        dataType: "json",
        success: function (data) {
            if (data) {
                if ('200' == data.status) {
                    window.location.href = "/wxmp/dcxt/foodMenu";
                } else {
                    alert("保存失败！");
                }
            }
        },
        error: function () {
            alert("保存失败！");
        }
    });

}