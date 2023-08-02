var _user = JSON.parse(localStorage.getItem("user"));
myApp.controller("NhaCungCapCtrl", function ($scope, $http){
    var baseurl = 'https://localhost:44381/api/'
    
    $scope.submit = "Thêm mới";
    $scope.maNhaCungCap;
    $scope.tenNhaCungCap;
    $scope.diaChi;
    $scope.soDienThoai;
    $scope.email;
    $scope.tenNhaCungCapSearch ="";
    $scope.Reset = function(){
        $scope.maNhaCungCap = "";
        $scope.tenNhaCungCap = "";
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

    $scope.searchSupplier = function() {
      var data = {
        page: $scope.pageIndex,
        pageSize: $scope.pageSize,
        tenNhaCungCap: $scope.tenNhaCungCapSearch
      };
      $http({
        method: 'post',
        headers: { "Authorization": 'Bearer ' + _user.token },
        url: baseurl + "NhaCungCap/supplier-search-name",
        data: data
      }).then(function(response) {
        $scope.listSearch = response.data.data;
        $scope.totalItems = response.data.totalItems;
      });
    };
    
    // Hàm chuyển trang
    $scope.changePage = function(pageIndex) {
      $scope.pageIndex = pageIndex;
      $scope.searchSupplier();
    };

    $scope.changePageSize = function() {
        $scope.currentPage = 1; // Trở về trang đầu tiên khi thay đổi kích thước trang
        $scope.searchSupplier(); // Cập nhật danh sách sản phẩm với kích thước trang mới
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
        let obj = {}
        obj.tenNhaCungCap = $scope.tenNhaCungCap,
        obj.diaChi = $scope.diaChi;
        obj.soDienThoai = $scope.soDienThoai;
        obj.email = $scope.email;
        // Thực hiện thêm mới
        if ($scope.submit == "Thêm mới") {
            $http({
                method: 'POST',
                headers: { "Authorization": 'Bearer ' + _user.token },
                data: obj,
                url: baseurl + 'NhaCungCap/supplier-create',
            }).then(function (response) {
                $scope.searchSupplier();
                alert('Thêm sản phẩm thành công!');
            });
        } 
        // Thực hiện cập nhật
        else {
          obj.maNhaCungCap = $scope.maNhaCungCap,
            $http({
                method: 'PUT',
                headers: { "Authorization": 'Bearer ' + _user.token },
                data: obj,
                url: baseurl + 'NhaCungCap/supplier-update',
            }).then(function (response) {
                $scope.searchSupplier();
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
            url: baseurl + 'NhaCungCap/get-supplier-by-id/' + id,
        }).then(function (response) {
            let nhacungcap = response.data;
            $scope.maNhaCungCap = nhacungcap.maNhaCungCap;
            $scope.tenNhaCungCap = nhacungcap.tenNhaCungCap;
            $scope.diaChi = nhacungcap.diaChi;
            $scope.soDienThoai = nhacungcap.soDienThoai;
            $scope.email = nhacungcap.email;
            
        });
    };

    // Xóa loại sản phẩm
    $scope.Xoa = function (id) {
        var result = confirm("Bạn có thực sự muốn xóa không?");
        if (result) {
            $http({
                method: 'DELETE',
                headers: { "Authorization": 'Bearer ' + _user.token },
                url: baseurl + 'NhaCungCap/supplier-delete/' + id,
            }).then(function (response) {
                $scope.searchSupplier();
                alert('Xóa thành công!');
            });
        }
    }
     $scope.searchSupplier();
});