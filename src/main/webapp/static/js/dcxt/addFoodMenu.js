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