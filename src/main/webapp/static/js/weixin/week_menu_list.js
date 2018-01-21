var loadmoreHTM =
    "<div class='weui-loadmore'>" +
    "<i class='weui-loading'></i>" +
    "<span class='weui-loadmore__tips'>正在加载</span>" +
    "</div>";

var loadFailHTM =
    "<div class='weui-loadmore'>" +
    "<span class='weui-loadmore__tips'>加载失败</span>" +
    "</div>";

var noneDataHTM =
    "<div class='weui-loadmore'>" +
    "<span class='weui-loadmore__tips'>暂无数据</span>" +
    "</div>";

var initSelectedDay;
var initSelectedProduct;

$(function () {

    initWeekDays();

    initProducts();

    initMeals();

});

/**
 * 初始化本周时间
 *
 */
function initWeekDays() {

    $.ajax({
        contentType: "application/json",
        type: "post",
        url: "/wxmp/rs/wx/foodMenu/weekDays/1",
        async: false, // 同步加载
        dataType: "json",
        success: function (data) {
            if (data) {
                if ('200' == data.status) {

                    var weekDays = data.content;
                    if (weekDays == undefined) {
                        $(".js-day-panel").html(noneDataHTM);
                        return;
                    }

                    var weekDaysHTM = "";
                    $(weekDays).each(function (index, day) {
                        if (0 == index) {
                            weekDaysHTM += "<div class='weekStyle' onclick='selectedOneDay(this, \"" + day.date + "\")'>" +
                                "<div>" + day.chnName + "</div>" +
                                "<div class='numberStyle numberActive'>" + day.num + "</div></div>";
                            initSelectedDay = day.date;
                        } else {
                            weekDaysHTM += "<div class='weekStyle' onclick='selectedOneDay(this, \"" + day.date + "\")'>" +
                                "<div>" + day.chnName + "</div>" +
                                "<div class='numberStyle'>" + day.num + "</div></div>";
                        }
                    });
                    $(".js-day-panel").html(weekDaysHTM);

                } else {
                    $(".js-day-panel").html(loadFailHTM);
                }
            }
        },
        error: function () {
            $(".js-day-panel").html(loadFailHTM);
        }
    });

}

/**
 * 初始化本商品
 *
 */
function initProducts() {

    $.ajax({
        contentType: "application/json",
        type: "post",
        url: "/wxmp/rs/wx/product/list",
        async: false, // 同步加载
        dataType: "json",
        success: function (data) {
            if (data) {
                if ('200' == data.status) {

                    var products = data.content;
                    if (products == undefined) {
                        $(".js-product").html(noneDataHTM);
                        return;
                    }

                    var productsHTM = "";
                    $(products).each(function (index, product) {
                        if (0 == index) {
                            productsHTM += "<div class='packStyle packActive' onclick='selectedOneProduct(this, \"" + product.id + "\")'>" + product.name + "</div>";
                            initSelectedProduct = product.id;
                        } else {
                            productsHTM += "<div class='packStyle' onclick='selectedOneProduct(this, \"" + product.id + "\")'>" + product.name + "</div>";
                        }
                    });
                    $(".js-product-panel").html(productsHTM);

                } else {
                    $(".js-product").html(loadFailHTM);
                }
            }
        },
        error: function () {
            $(".js-product").html(loadFailHTM);
        }
    });

}

/**
 * 初始化餐标
 *
 */
function initMeals() {

    if (null != initSelectedDay && null != initSelectedProduct) {

    }

}

/**
 * 选中某一天
 *
 * @param obj 选中元素
 * @param date 选中日期
 */
function selectedOneDay(obj, date) {

    $(obj).siblings().children('.numberStyle').removeClass('numberActive');
    $(obj).children('.numberStyle').addClass('numberActive');
    $('.js-product-panel').first().children('.packStyle').removeClass('packActive');
    $('.js-product-panel').first().children().first().addClass('packActive');

}

/**
 * 选中某个产品
 *
 * @param obj 选中元素
 * @param productId 选中产品ID
 */
function selectedOneProduct(obj, productId) {

    $(obj).siblings().removeClass('packActive');
    $(obj).addClass('packActive');
}