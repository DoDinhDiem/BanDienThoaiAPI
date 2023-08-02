// ***************************************************
// Shopping Cart functions

// Cart
jQuery('#demo_changer .demo-icon').click(function() {

    if (jQuery('.demo_changer').hasClass("active")) {
        jQuery('.demo_changer').animate({
            "right": "-300px"
        }, function() {
            jQuery('.demo_changer').toggleClass("active");
        });
    } else {
        jQuery('.demo_changer').animate({
            "right": "0px"
        }, function() {
            jQuery('.demo_changer').toggleClass("active");
        });
    }
});
$(".add-item-to-cart").click(function (event) {
    event.preventDefault();
    displayCart();
});
// Increase product quantity

$("#count-cart").html(getCountCart());

//////////////////////////
function displayCart() {
    var cartArray = JSON.parse(localStorage.getItem('cart')) || [];
    console.log(cartArray);
    var output = "";
    if (cartArray.length <= 0) {
        output = "<p style='padding-left: 20px;'>Chưa có sản phẩm nào</p>"
    }
    else {
        for (var i in cartArray) {
            output += "<tr class='cart_item'>"
                + "<td class='product-remove'>"
                + "<div class='bt_remove_product left' data-product-code='" + cartArray[i].maSanPham + "'>" + "</div>"
                + "</td>"
                + "<td class='product-name'>"
                + "<b>" + cartArray[i].tenSanPham + "</b>"
                + "<div class='clr'></div>"
                + "<div class='box_quantity left'>"
                + "<div class='quantity right'>"
                + "<input class='bt_minus' type='button' value='-' data-product-code='" + cartArray[i].maSanPham + "'>"
                + "<input type='text' disabled='' name='product_cart_qty' value='" + cartArray[i].quantity + "' title='Qty' class='input-text qty text product_qty' size='4'>"
                + "<input class='bt_plus' type='button' value='+' data-product-code='" + cartArray[i].maSanPham + "'>"
                + "</div>"
                + "</div>"
                + "</td>"
                + "<td class='product-price' valign='top'>"
                + "<span class='amount'>" + numberWithCommas(cartArray[i].giaGiam) + "</span>"
                + "</td>"
                + "</tr>";
        }
    }
    $("#show-cart").html(output);
    $("#count-cart").html(getCountCart());
    var total = 0;
    for (var i in cartArray) {
        total += cartArray[i].giaGiam * cartArray[i].quantity;
    }
    $("#total_price").html(numberWithCommas(total));
}

//show product in page shoping cart
function displayCartPageCart() {
    var cartArray = JSON.parse(localStorage.getItem('cart')) || [];
    console.log(cartArray);
    var output = "";
    if (cartArray.length <= 0) {
        output = "<tr><td colspan='7' style='text-align: center'><p style='padding-left: 20px;'>Chưa có sản phẩm nào</p></td></tr>"
    }
    else {
        for (var i in cartArray) {
            output
                +="<tr>"
                +"<td class='cart_product'>"
                +"<a href='#'><img src='img/"+cartArray[i].anhDaiDien+"' alt='Product'></a>"
                +"</td>"
                +"<td class='cart_description'>"
                +"<p class='product-name'><a href='#'>"+cartArray[i].tenSanPham+"</a></p>"
                +"<small class='cart_ref'>Product Code : "+cartArray[i].maSanPham+"</small>"
                +"<br>"
                +"</td>"
                +"<td class='price'><span style='color: #e84d1c; font-size: 18px; font-weight: bold;'>" + numberWithCommas(cartArray[i].giaGiam) + "</span></td>"
                +"<td class='qty'>"
                +"<input class='form-control input-sm' type='text' readonly value='" + cartArray[i].quantity + "'>"
                +"<a class='plus' data-product-code='" + cartArray[i].maSanPham + "'><i class='fa fa-caret-up'></i></a>"
                +"<a class='minus' data-product-code='" + cartArray[i].maSanPham + "'><i class='fa fa-caret-down'></i></a>"
                +"</td>"
                +"<td class='price'>"
                +"<span style='color: #e84d1c; font-size: 18px; font-weight: bold;'>" + numberWithCommas(cartArray[i].giaGiam * cartArray[i].quantity) + "</span>"
                +"</td>"
                +"<td class='action'>"
                +"<a class='remove_product' data-product-code='" + cartArray[i].maSanPham + "'>Delete item</a>"
                +"</td>"
                +"</tr>";
        }
    }
    $("#show-item-cart").html(output);
    $("#count-cart").html(getCountCart());
    var total = 0;
    for (var i in cartArray) {
        total += cartArray[i].giaGiam * cartArray[i].quantity;
    }
    $("#total_price").html(numberWithCommas(total));
}

//show product in page checkout
function displayCartPageCheckOut() {
    var cartArray = JSON.parse(localStorage.getItem('cart')) || [];
    console.log(cartArray);
    var total = 0;
    for (var i in cartArray) {
        total += cartArray[i].giaGiam * cartArray[i].quantity;
    }
    var output = "";
    if (cartArray.length <= 0) {
        output = "<tr><td colspan='7' style='text-align: center'><p style='padding-left: 20px;'>Chưa có sản phẩm nào</p></td></tr>"
    }
    else {
        for (var i in cartArray) {
            output
                +="<tr>"
                +"<td class='cart_product'>"
                +"<a href='#'><img src='img/"+cartArray[i].anhDaiDien+"' alt='Product'></a>"
                +"</td>"
                +"<td class='cart_description'>"
                +"<p class='product-name'><a href='#'>"+cartArray[i].tenSanPham+"</a></p>"
                +"<small class='cart_ref'>Product Code : "+cartArray[i].maSanPham+"</small>"
                +"<br>"
                +"</td>"
                +"<td class='price'><span style='color: #e84d1c; font-size: 18px; font-weight: bold;'>" + numberWithCommas(cartArray[i].giaGiam) + "</span></td>"
                +"<td class='qty'>"
                +"<input class='form-control input-sm' type='text' readonly value='" + cartArray[i].quantity + "'>"
                +"</td>"
                +"<td class='price'>"
                +"<span style='color: #e84d1c; font-size: 18px; font-weight: bold;'>" + numberWithCommas(cartArray[i].giaGiam * cartArray[i].quantity) + "</span>"
                +"</td>"
                +"</tr>";
        }
    }
    $("#show-list-order").html(output);
    var total = 0;
    for (var i in cartArray) {
        total += cartArray[i].giaGiam * cartArray[i].quantity;
    }
    $("#show-total_price").html(numberWithCommas(total));
    $("#total_price_all").html(numberWithCommas(total));
}



function increaseProductQty(productCode) {
    var cartArray = JSON.parse(localStorage.getItem('cart')) || [];
    for (var i in cartArray) {
        if (cartArray[i].maSanPham == productCode) {
            cartArray[i].quantity++;
            break; // Stop loop once product is found and updated
        }
    }
    localStorage.setItem('cart', JSON.stringify(cartArray));
     // Update cart display
}

// Decrease product quantity
function decreaseProductQty(productCode) {
    var cartArray = JSON.parse(localStorage.getItem('cart')) || [];
    for (var i in cartArray) {
        if (cartArray[i].maSanPham == productCode) {
            if (cartArray[i].quantity > 1) {
                cartArray[i].quantity--;
            } else {
                cartArray.splice(i, 1); // Remove product from cart if quantity is 1
            }
            break; // Stop loop once product is found and updated
        }
    }
    localStorage.setItem('cart', JSON.stringify(cartArray));
     // Update cart display
}

// Remove product from cart
function removeProduct(productCode) {
    var cartArray = JSON.parse(localStorage.getItem('cart')) || [];
    for (var i in cartArray) {
        if (cartArray[i].maSanPham == productCode) {
            cartArray.splice(i, 1); // Remove product from cart
            break; // Stop loop once product is found and removed
        }
    }
    localStorage.setItem('cart', JSON.stringify(cartArray));
    // Update cart display
}

function setCountForItem(productcode, count) {
    var cartArray = JSON.parse(localStorage.getItem('cart')) || [];
    for (var i in cartArray) {
        if (cartArray[i].maSanPham === productcode) {
            cartArray[i].quantity = count;
            break;
        }
    }
    localStorage.setItem('cart', JSON.stringify(cartArray));
}


//function format thousand 1234 => 1,234
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
function getCountCart() {
    var cartArray = JSON.parse(localStorage.getItem('cart')) || [];
    var totalCount = 0;

    for (var i in cartArray) {
            totalCount += cartArray[i].quantity;
        }
        return totalCount;
}

// Add event listeners to +/- buttons
$('#show-cart').on('click', '.bt_plus', function() {
    var productCode = $(this).data('product-code');
    increaseProductQty(productCode);
    displayCart();
});

$('#show-cart').on('click', '.bt_minus', function() {
    var productCode = $(this).data('product-code');
    decreaseProductQty(productCode);
    displayCart();
});

// Add event listener to "Remove" button
$('#show-cart').on('click', '.bt_remove_product', function() {
    var productCode = $(this).data('product-code');
    removeProduct(productCode);
    displayCart();
});

$("#show-cart").on("change", ".product_qty", function (event) {
    var productcode = $(this).data('product-code');
    var count = Number($(this).val());
    setCountForItem(productcode, count);
    displayCart();
});

$("#show-item-cart").on("click", ".remove_product", function (event) {
    var productCode = $(this).data('product-code');
    removeProduct(productCode);
    displayCartPageCart();
});

$("#show-item-cart").on("click", ".minus", function (event) {
    var productCode = $(this).data('product-code');
    decreaseProductQty(productCode);
    displayCartPageCart();
});

$("#show-item-cart").on("click", ".plus", function (event) {
    var productCode = $(this).data('product-code');
    increaseProductQty(productCode);
    displayCartPageCart();
});

$("#show-item-cart").on("change", ".item-count", function (event) {
    var productcode = $(this).data('product-code');
    var count = Number($(this).val());
    setCountForItem(productcode, count);
    displayCartPageCart();
});


displayCart();
displayCartPageCart();
displayCartPageCheckOut();



