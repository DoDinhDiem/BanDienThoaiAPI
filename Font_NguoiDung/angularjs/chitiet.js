myApp.controller("ChitietCtrl", function ($scope, $http) {
    var baseurl = 'https://localhost:44377/api/'
    $scope.sanpham;  
    $scope.LoadSanPhambyID = function () { 
		var key = 'id';
		var value = window.location.search.substring(window.location.search.indexOf(key)+key.length+1);		 
        $http({
            method: 'GET', 
            url: baseurl + 'SanPham/get-products-by-id/'+value,
        }).then(function (response) { 
            $scope.sanpham = response.data;
        });
    };  
    $scope.updateProductImage = function(imageUrl) {
        $scope.sanpham.anhDaiDien = imageUrl;
      };
      $scope.addToCart = function (item) {
        var list = null;
        item.quantity = 1;       
        var list;
        if (localStorage.getItem('cart') == null) {
            list = [item];
        } else {
            list = JSON.parse(localStorage.getItem('cart')) || [];
            let ok = true;
            for (let x of list) {
                if (x.maSanPham == item.maSanPham) {
                    x.quantity += 1;
                    ok = false;
                    break;
                }
            }
            if (ok) {
                list.push(item);
            }
        }
        localStorage.setItem('cart', JSON.stringify(list));
        location.reload();
    } 
    $scope.LoadSanPhambyID()
});