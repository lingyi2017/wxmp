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
                            dishesTdHTM += "<span class='label label-success' style='margin-right: 5px;' id='" + dish.id + "'>" + dish.name +
                                " <i class='icon-remove-sign icon-white' style='cursor: pointer;' onclick='removeDish(this)'></i>" +
                                "</span>";
                        });
                        $("#" + dishesTdId).append(dishesTdHTM);
                    });

                } else {
                    alert("获取数据失败！");
                }
            }
        },
        error: function () {
            alert("获取数据失败！");
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
    $(".warnDiv").html("");
    nowProductId = productId;
    nowMealId = mealId;

    // 清除之前选择的菜品
    $(".dishesModal").find("input").each(function () {
        $(this).prop("checked", false);
    });

    // 回显当前TD中选中的菜品
    var dishesTdId = nowProductId + "-" + nowMealId;
    var dishIdArray = new Array();
    $("#" + dishesTdId).find("span").each(function () {
        dishIdArray.push($(this).prop("id"));
    });
    $(".dishesModal").find("input").each(function () {
        if (isInArray(dishIdArray, $(this).prop("value"))) {
            $(this).prop("checked", true);
        }
    });
}

/**
 * 添加菜品
 *
 */
function addDish() {

    var dishesTdId = nowProductId + "-" + nowMealId;
    var dishIdArray = new Array();
    $("#" + dishesTdId).find("span").each(function () {
        dishIdArray.push($(this).prop("id"));
    });
    var isExist = false;
    $(".dishesModal").find("input").each(function () {
        if ($(this).prop("checked")) {
            if (isInArray(dishIdArray, $(this).prop("value"))) {
                isExist = true;
                return false;
            }
        }
    });
    if (isExist) {
        var warnHTM = "<div class='alert'>" +
            "<button type='button' class='close' data-dismiss='alert'>&times;</button>" +
            "菜品不能重复添加" +
            "</div>"
        $(".warnDiv").html(warnHTM);
        return false;
    }

    var dishesTdHTM = "";
    $(".dishesModal").find("input").each(function () {
        if ($(this).prop("checked")) {
            dishesTdHTM += "<span class='label label-success' style='margin-right: 5px;' id='" + $(this).prop("value") + "'>" +
                $(this).prop("name") +
                " <i class='icon-remove-sign icon-white' style='cursor: pointer;' onclick='removeDish(this)'></i>" +
                "</span>";
        }
    });
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

    var addDate = $("#addDate").val();
    if (validateData(addDate)) {
        alert(addDate + "日菜单已上架");
        return false;
    }

    var foodMenuDto = {};

    var foodMenuId = $("#foodMenuId").val();
    foodMenuDto['id'] = foodMenuId;

    foodMenuDto['addDate'] = addDate;

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

function isInArray(array, value) {

    for (var i = 0; i < array.length; i++) {
        if (value == array[i]) {
            return true;
        }
    }
    return false;
}

function validateData(date) {

    var isExist = true;
    var data = JSON.stringify({"date": date});
    $.ajax({
        contentType: "application/json",
        type: "post",
        data: data,
        url: "/wxmp/rs/dcxt/foodMenu/isFoodMenuExist",
        async: false,
        dataType: "json",
        success: function (data) {
            if (data) {
                if ('200' == data.status) {
                    isExist = data.content;
                }
            }
        },
        error: function () {

        }
    });
    return isExist;

}