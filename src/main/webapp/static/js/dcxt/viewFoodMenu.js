/**
 * Created by Ecloud on 2017/12/2.
 */

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