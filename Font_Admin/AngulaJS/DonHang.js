var _user = JSON.parse(localStorage.getItem("user"));
myApp.controller("DonHangCtrl", function ($scope, $http){
    var baseurl = 'https://localhost:44381/api/'
    
    $scope.submit = "Thêm mới";
    $scope.listDonHang = [];
    $scope.trangThaiDonHang;
    $scope.listjson_chitietdonhang = [];
    $scope.maDonHang;
    $scope.maDonHangSearch ="";

    $scope.Reset = function(){
        $scope.maDonHang = "";
        $scope.submit = "Thêm mới";
    }

    // Load danh sách loại sản phẩm
    $scope.pageIndex = 1;
    $scope.pageSizes = [5, 10, 15, 20, 25];
    $scope.pageSize = $scope.pageSizes[0]; 
    $scope.totalItems = 0;
    $scope.listSearch=[];
 

    
    // Hàm tìm kiếm sản phẩm với phân trang

    $scope.searchOrder = function() {
      var data = {
        page: $scope.pageIndex,
        pageSize: $scope.pageSize,
        maDonHang: $scope.maDonHangSearch
      };
      $http({
        method: 'post',
        headers: { "Authorization": 'Bearer ' + _user.token },
        url: baseurl + "DonHang/order-search-id",
        data: data
      }).then(function(response) {
        $scope.listSearch = response.data;
        $scope.totalItems = response.data.totalItems;
      });
    };
    
    // Hàm chuyển trang
    $scope.changePage = function(pageIndex) {
      $scope.pageIndex = pageIndex;
      $scope.searchOrder();
    };

    $scope.changePageSize = function() {
        $scope.currentPage = 1; // Trở về trang đầu tiên khi thay đổi kích thước trang
        $scope.searchOrder(); // Cập nhật danh sách sản phẩm với kích thước trang mới
    }


    $scope.getPages = function() {
      var pages = [];
      var startPage, endPage;
      var totalPages = Math.ceil($scope.totalItems / $scope.pageSize);
      
      if (totalPages <= 5) {
        startPage = 1;
        endPage = totalPages;
      } else {
        if ($scope.pageIndex <= 3) {
          startPage = 1;
          endPage = 5;
        } else if ($scope.pageIndex + 1 >= totalPages) {
          startPage = totalPages - 4;
          endPage = totalPages;
        } else {
          startPage = $scope.pageIndex - 2;
          endPage = $scope.pageIndex + 2;
        }
      }
    
      for (var i = startPage; i <= endPage; i++) {
        pages.push(i);
      }
    
      return pages;
    };
    
    $scope.newOrder = {
        chitiet:[]
      };
      
      $scope.addNewAnh = function() {
        $scope.listjson_chitietdonhang.push({});
      };

    // Thêm hoặc cập nhật loại sản phẩm
    $scope.Update = function () {
        let obj = {}
        obj.maDonHang = $scope.maKhachHgang;
        obj.trangThaiDonHang = $scope.trangThaiDonHang;
        obj.listjson_chitietdonhang = $scope.listjson_chitietdonhang;
        // Thực hiện thêm mới
            $http({
                method: 'PUT',
                // headers: { "Authorization": 'Bearer ' + _user.token },
                data: obj,
                headers: { "Authorization": 'Bearer ' + _user.token },
                url: baseurl + 'DonHang/order-update',
            }).then(function (response) {
                $scope.searchOrder();
                alert('Cập nhật sản phẩm thành công!');
            });
        }

    // Lấy thông tin loại sản phẩm để sửa
    $scope.Sua = function (id) {
        $scope.submit = "Lưu lại";
        $http({
            method: 'GET',
            headers: { "Authorization": 'Bearer ' + _user.token },
            url: baseurl + 'DonHang/get-order-by-id/' + id,
        }).then(function (response) {
          $scope.item = response.data
            let DonHang = response.data;
            $scope.maKhachHang = DonHang.maKhachHang;
            $scope.trangThaiDonHang = DonHang.trangThaiDonHang;
            $scope.listjson_chitietdonhang = DonHang.listjson_chitietdonhang;
        });
    };

    // Xóa loại sản phẩm
    $scope.Xoa = function (id) {
        var result = confirm("Bạn có thực sự muốn xóa không?");
        if (result) {
            $http({
                method: 'DELETE',
                headers: { "Authorization": 'Bearer ' + _user.token },
                url: baseurl + 'DonHang/order-delete/' + id,
            }).then(function (response) {
                $scope.searchOrder();
                alert('Xóa thành công!');
            });
        }
    }
     $scope.searchOrder();
});