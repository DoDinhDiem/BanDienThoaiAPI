var _user = JSON.parse(localStorage.getItem("user"));
myApp.controller("HoaDonXuatCtrl", function ($scope, $http){
    var baseurl = 'https://localhost:44381/api/'
    
    $scope.submit = "Thêm mới";
    $scope.maHoaDonXuat;
    $scope.maNhanVien;
    $scope.maKhachHang;
    $scope.listjson_chitiethoadonxuat = [];
    $scope.maHoaDonXuatSearch ="";

    $scope.Reset = function(){
        $scope.submit = "Thêm mới";
    }

    // Load danh sách loại sản phẩm
    $scope.pageIndex = 1;
    $scope.pageSizes = [5, 10, 15, 20, 25];
    $scope.pageSize = $scope.pageSizes[0]; 
    $scope.totalItems = 0;
    $scope.listSearch=[];
 
    
    // Hàm tìm kiếm sản phẩm với phân trang

    $scope.searchExportinvoice = function() {
      var data = {
        page: $scope.pageIndex,
        pageSize: $scope.pageSize,
        maHoaDonXuat: $scope.tenHoaDonXuatSearch
      };
      $http({
        method: 'post',
        headers: { "Authorization": 'Bearer ' + _user.token },
        url: baseurl + "HoaDonXuat/exportinvoice-search-id",
        data: data
      }).then(function(response) {
        $scope.listSearch = response.data;
        $scope.totalItems = response.data.totalItems;
      });
    };
    
    // Hàm chuyển trang
    $scope.changePage = function(pageIndex) {
      $scope.pageIndex = pageIndex;
      $scope.searchExportinvoice();
    };

    $scope.changePageSize = function() {
        $scope.currentPage = 1; // Trở về trang đầu tiên khi thay đổi kích thước trang
        $scope.searchExportinvoice(); // Cập nhật danh sách sản phẩm với kích thước trang mới
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

    $scope.LoadSanPham = function(){
      $http({
        method: 'GET',
        headers: { "Authorization": 'Bearer ' + _user.token },
        url: baseurl + 'SanPham/get-all-products'
      }).then(function (response){
        $scope.listSanPham = response.data;
      })
    }
    $scope.LoadNhanVien = function(){
      $http({
        method: 'GET',
        headers: { "Authorization": 'Bearer ' + _user.token },
        url: baseurl + 'NhanVien/get-all-staff'
      }).then(function (response){
        $scope.listNhanVien = response.data;
      })
    }
    $scope.LoadKhachHang = function(){
      $http({
        method: 'GET',
        headers: { "Authorization": 'Bearer ' + _user.token },
        url: baseurl + 'KhachHang/get-all-custumer'
      }).then(function (response){
        $scope.listKhachHang = response.data;
      })
    }


    $scope.newOrder = {
      chitiet:[]
    };
    
    $scope.addNewOrder = function() {
      $scope.listjson_chitiethoadonxuat.push({});
    };
    $scope.removeOrder = function (index) {
      $scope.listjson_chitiethoadonxuat.splice(index, 1);
    };

    // Thêm hoặc cập nhật loại sản phẩm
    $scope.CreateUpdate = function () {
        let obj = {}
        obj.maNhanVien = $scope.maNhanVien;
        obj.maKhachHang = $scope.maKhachHang;
        obj.listjson_chitiethoadonxuat = $scope.listjson_chitiethoadonxuat
        // Thực hiện thêm mới
        if ($scope.submit == "Thêm mới") {
            $http({
                method: 'POST',
                data: obj,
                headers: { "Authorization": 'Bearer ' + _user.token },
                url: baseurl + 'HoaDonXuat/exportinvoice-create',
            }).then(function (response) {
                $scope.searchExportinvoice();
                alert('Thêm sản phẩm thành công!');
            });
        } 
        // Thực hiện cập nhật
        else {
            $http({
                method: 'PUT',
                data: obj,
                headers: { "Authorization": 'Bearer ' + _user.token },
                url: baseurl + 'HoaDonXuat/exportinvoice-update',
            }).then(function (response) {
                $scope.searchExportinvoice();
                alert('Cập nhật sản phẩm thành công!');
            });
        }
    };

    // Lấy thông tin loại sản phẩm để sửa
    $scope.Sua = function (id) {
        $scope.submit = "Lưu lại";
        $http({
            method: 'GET',
            headers: { "Authorization": 'Bearer ' + _user.token },
            url: baseurl + 'HoaDonXuat/get-exportinvoice-by-id/' + id,
        }).then(function (response) {
            $scope.item = response.data;
            let obj = response.data;
            $scope.maHoaDonXuat = obj.maHoaDonXuat;
            $scope.tenHoaDonXuat = obj.tenHoaDonXuat;
            $scope.listjson_chitiethoadonxuat = obj.listjson_chitiethoadonxuat;
        });
    };

    // Xóa loại sản phẩm
    $scope.Xoa = function (id) {
        var result = confirm("Bạn có thực sự muốn xóa không?");
        if (result) {
            $http({
                method: 'DELETE',
                headers: { "Authorization": 'Bearer ' + _user.token },
                url: baseurl + 'HoaDonXuat/exportinvoice-delete/' + id,
            }).then(function (response) {
                $scope.searchExportinvoice();
                alert('Xóa thành công!');
            });
        }
    }
     $scope.searchExportinvoice();
     $scope.LoadSanPham();
     $scope.LoadNhanVien();
     $scope.LoadKhachHang();
     
});