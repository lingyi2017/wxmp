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