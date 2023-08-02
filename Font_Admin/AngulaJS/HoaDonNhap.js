var _user = JSON.parse(localStorage.getItem("user"));
myApp.controller("HoaDonNhapCtrl", function ($scope, $http){
    var baseurl = 'https://localhost:44381/api/'
    
    $scope.submit = "Thêm mới";
    $scope.maHoaDonNhap;
    $scope.maNhanVien;
    $scope.maNhaCungCap;
    $scope.listjson_chitiethoadonnhap = [];
    $scope.maSanPham;
    $scope.soLuong;
    $scope.donGia;
    $scope.maHoaDonNhapSearch ="";

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

    $scope.searchMenuized = function() {
      var data = {
        page: $scope.pageIndex,
        pageSize: $scope.pageSize,
        maHoaDonNhap: $scope.tenHoaDonNhapSearch
      };
      $http({
        method: 'post',
        headers: { "Authorization": 'Bearer ' + _user.token },
        url: baseurl + "HoaDonNhap/menuized-search-id",
        data: data
      }).then(function(response) {
        $scope.listSearch = response.data;
        $scope.totalItems = response.data.totalItems;
      });
    };
    
    // Hàm chuyển trang
    $scope.changePage = function(pageIndex) {
      $scope.pageIndex = pageIndex;
      $scope.searchMenuized();
    };

    $scope.changePageSize = function() {
        $scope.currentPage = 1; // Trở về trang đầu tiên khi thay đổi kích thước trang
        $scope.searchMenuized(); // Cập nhật danh sách sản phẩm với kích thước trang mới
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
    $scope.LoadNhaCungCap = function(){
      $http({
        method: 'GET',
        headers: { "Authorization": 'Bearer ' + _user.token },
        url: baseurl + 'NhaCungCap/get-all-supplier'
      }).then(function (response){
        $scope.listNhaCungCap = response.data;
      })
    }


    $scope.newOrder = {
      chitiet:[]
    };
    
    $scope.addNewOrder = function() {
      $scope.listjson_chitiethoadonnhap.push({});
    };
    $scope.removeOrder = function (index) {
      $scope.listjson_chitiethoadonnhap.splice(index, 1);
    };


    // Thêm hoặc cập nhật loại sản phẩm
    $scope.CreateUpdate = function () {
        let obj = {}
        obj.maNhanVien = $scope.maNhanVien;
        obj.maNhaCungCap = $scope.maNhaCungCap;
        obj.listjson_chitiethoadonnhap = $scope.listjson_chitiethoadonnhap
        // Thực hiện thêm mới
        if ($scope.submit == "Thêm mới") {
            $http({
                method: 'POST',
                headers: { "Authorization": 'Bearer ' + _user.token },
                data: obj,
                url: baseurl + 'HoaDonNhap/menuized-create',
            }).then(function (response) {
                $scope.searchMenuized();
                alert('Thêm sản phẩm thành công!');
            });
        } 
        // Thực hiện cập nhật
        else {
            $http({
                method: 'PUT',
                headers: { "Authorization": 'Bearer ' + _user.token },
                data: obj,
                url: baseurl + 'HoaDonNhap/menuized-update',
            }).then(function (response) {
                $scope.searchMenuized();
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
            url: baseurl + 'HoaDonNhap/get-menuized-by-id/' + id,
        }).then(function (response) {
            let hoadonnhap = response.data;
            $scope.maHoaDonNhap = hoadonnhap.maHoaDonNhap;
            $scope.maNhaCungCap = hoadonnhap.maNhaCungCap;
            $scope.listjson_chitiethoadonnhap = hoadonnhap.listjson_chitiethoadonnhap;
        });
    };

    // Xóa loại sản phẩm
    $scope.Xoa = function (id) {
        var result = confirm("Bạn có thực sự muốn xóa không?");
        if (result) {
            $http({
                method: 'DELETE',
                headers: { "Authorization": 'Bearer ' + _user.token },
                url: baseurl + 'HoaDonNhap/menuized-delete/' + id,
            }).then(function (response) {
                $scope.searchMenuized();
                alert('Xóa thành công!');
            });
        }
    }
     $scope.searchMenuized();
     $scope.LoadSanPham();
     $scope.LoadNhanVien();
     $scope.LoadNhaCungCap();
});