var _user = JSON.parse(localStorage.getItem("user"));
myApp.controller("KhachHangCtrl", function ($scope, $http){
    var baseurl = 'https://localhost:44381/api/'
    
    $scope.submit = "Thêm mới";
    $scope.listkhachhang = [];
    $scope.maKhachHang;
    $scope.tenKhachHang;
    $scope.diaChi;
    $scope.soDienThoai;
    $scope.email;
    $scope.tenKhachHangSearch ="";
    $scope.Reset = function(){
        $scope.maKhachHang = "";
        $scope.tenKhachHang = "";
        $scope.diaChi = "";
        $scope.soDienThoai = "";
        $scope.email = "";
        $scope.submit = "Thêm mới";
    }

    // Load danh sách loại sản phẩm
    $scope.pageIndex = 1;
    $scope.pageSizes = [5, 10, 15, 20, 25];
    $scope.pageSize = $scope.pageSizes[0]; 
    $scope.totalItems = 0;
    $scope.listSearch=[];
 

    
    // Hàm tìm kiếm sản phẩm với phân trang

    $scope.searchCustumer = function() {
      var data = {
        page: $scope.pageIndex,
        pageSize: $scope.pageSize,
        tenKhachHang: $scope.tenKhachHangSearch
      };
      $http({
        method: 'post',
        headers: { "Authorization": 'Bearer ' + _user.token },
        url: baseurl + "KhachHang/custumer-search-name",
        data: data
      }).then(function(response) {
        $scope.listSearch = response.data.data;
        $scope.totalItems = response.data.totalItems;
      });
    };
    
    // Hàm chuyển trang
    $scope.changePage = function(pageIndex) {
      $scope.pageIndex = pageIndex;
      $scope.searchCustumer();
    };

    $scope.changePageSize = function() {
        $scope.currentPage = 1; // Trở về trang đầu tiên khi thay đổi kích thước trang
        $scope.searchCustumer(); // Cập nhật danh sách sản phẩm với kích thước trang mới
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
    


    // Thêm hoặc cập nhật loại sản phẩm
    $scope.CreateUpdate = function () {
         var obj = {}
        obj.tenKhachHang = $scope.tenKhachHang,
        obj.diaChi = $scope.diaChi,
        obj.soDienThoai = $scope.soDienThoai,
        obj.email = $scope.email;
        // Thực hiện thêm mới
        if ($scope.submit == "Thêm mới") {
            $http({
                method: 'POST',
                headers: { "Authorization": 'Bearer ' + _user.token },
                data: obj,
                url: baseurl + 'KhachHang/custumer-create',
            }).then(function (response) {
                $scope.searchCustumer();
                alert('Thêm sản phẩm thành công!');
            });
        } 
        // Thực hiện cập nhật
        else {
            obj.maKhachHang = $scope.maKhachHang
            $http({
                method: 'PUT',
                headers: { "Authorization": 'Bearer ' + _user.token },
                data: obj,
                url: baseurl + 'KhachHang/custumer-update',
            }).then(function (response) {
                $scope.searchCustumer();
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
            url: baseurl + 'KhachHang/get-custumer-by-id/' + id,
        }).then(function (response) {
            let khachhang = response.data;
            $scope.maKhachHang = khachhang.maKhachHang;
            $scope.tenKhachHang = khachhang.tenKhachHang;
            $scope.diaChi = khachhang.diaChi;
            $scope.soDienThoai = khachhang.soDienThoai;
            $scope.email = khachhang.email;
            
        });
    };

    // Xóa loại sản phẩm
    $scope.Xoa = function (id) {
        var result = confirm("Bạn có thực sự muốn xóa không?");
        if (result) {
            $http({
                method: 'DELETE',
                headers: { "Authorization": 'Bearer ' + _user.token },
                url: baseurl + 'KhachHang/custumer-delete/' + id,
            }).then(function (response) {
                $scope.searchCustumer();
                alert('Xóa thành công!');
            });
        }
    }
     $scope.searchCustumer();
});