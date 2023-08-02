var _user = JSON.parse(localStorage.getItem("user"));
myApp.controller("DonViTinhCtrl", function ($scope, $http){
    var baseurl = 'https://localhost:44381/api/'
    
    $scope.submit = "Thêm mới";
    $scope.listDonViTinh = [];
    $scope.maDonViTinh;
    $scope.tenDonViTinh;
    $scope.tenDonViTinhSearch ="";

    $scope.Reset = function(){
        $scope.tenDonViTinh = "";
        $scope.submit = "Thêm mới";
    }




    // Load danh sách loại sản phẩm
    $scope.pageIndex = 1;
    $scope.pageSizes = [5, 10, 15, 20, 25];
    $scope.pageSize = $scope.pageSizes[0]; 
    $scope.totalItems = 0;
    $scope.listSearch=[];
 

    
    // Hàm tìm kiếm sản phẩm với phân trang

    $scope.searchUnit = function() {
      var data = {
        page: $scope.pageIndex,
        pageSize: $scope.pageSize,
        tenDonViTinh: $scope.tenDonViTinhSearch
      };
      $http({
        method: 'post',
        headers: { "Authorization": 'Bearer ' + _user.token },
        url: baseurl + "DonViTinh/unit-search-name",
        data: data
      }).then(function(response) {
        $scope.listSearch = response.data;
        $scope.totalItems = response.data.totalItems;
      });
    };
    
    // Hàm chuyển trang
    $scope.changePage = function(pageIndex) {
      $scope.pageIndex = pageIndex;
      $scope.searchUnit();
    };

    $scope.changePageSize = function() {
        $scope.currentPage = 1; // Trở về trang đầu tiên khi thay đổi kích thước trang
        $scope.searchUnit(); // Cập nhật danh sách sản phẩm với kích thước trang mới
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
        obj.maDonViTinh = $scope.maDonViTinh,
        obj.tenDonViTinh = $scope.tenDonViTinh
        // Thực hiện thêm mới
        if ($scope.submit == "Thêm mới") {
            $http({
                method: 'POST',
                data: obj,
                headers: { "Authorization": 'Bearer ' + _user.token },
                url: baseurl + 'DonViTinh/unit-create',
            }).then(function (response) {
                $scope.searchUnit();
                alert('Thêm sản phẩm thành công!');
            });
        } 
        // Thực hiện cập nhật
        else {
            $http({
                method: 'PUT',
                data: obj,
                headers: { "Authorization": 'Bearer ' + _user.token },
                url: baseurl + 'DonViTinh/unit-update',
            }).then(function (response) {
                $scope.searchUnit();
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
            url: baseurl + 'DonViTinh/get-unit-by-id/' + id,
        }).then(function (response) {
            let DonViTinh = response.data;
            $scope.maDonViTinh = DonViTinh.maDonViTinh;
            $scope.tenDonViTinh = DonViTinh.tenDonViTinh;
        });
    };

    // Xóa loại sản phẩm
    $scope.Xoa = function (id) {
        var result = confirm("Bạn có thực sự muốn xóa không?");
        if (result) {
            $http({
                method: 'DELETE',
                headers: { "Authorization": 'Bearer ' + _user.token },
                url: baseurl + 'DonViTinh/unit-delete/' + id,
            }).then(function (response) {
                $scope.searchUnit();
                alert('Xóa thành công!');
            });
        }
    }
     $scope.searchUnit();
});