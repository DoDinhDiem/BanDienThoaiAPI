myApp.controller('CartCtrl', function ($scope, $http) {
    $scope.listcart = [];
    $scope.tenKhachHang;
    $scope.diaChi;
    $scope.soDienThoai;
    $scope.email;
    $scope.LoadCart = function () {
        $scope.listcart = JSON.parse(localStorage.getItem('cart')) || [];
    };
    
    $scope.save = function () {
         let obj= {};
         obj.khach = {};
         obj.khach.TenKhachHang= $scope.tenKhachHang;
         obj.khach.DiaChi= $scope.diaChi;
         obj.khach.SoDienThoai= $scope.soDienThoai;
         obj.khach.Email= $scope.email;
         obj.listchitiet = [];
         let list = JSON.parse(localStorage.getItem('cart'));
         for(var i = 0; i < list.length; i++) {
            obj.listchitiet.push({MaSanPham:list[i].maSanPham, SoLuong: list[i].quantity,GiaMua: list[i].giaGiamGia})
        }
        $http({
            method: 'POST', 
            data: obj, 
            url: baseurl + 'DonHang/create-donhang',
        }).then(function (response) {
           alert('Thêm đơn hàng thành công');
        });
    };
    
    $scope.LoadCart();
});
