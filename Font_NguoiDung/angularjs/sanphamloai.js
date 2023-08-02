myApp.controller("SanPhamLoaiCtrl", function ($scope, $http) {
    var baseurl = 'https://localhost:44377/api/'
    $scope.sanpham;  
    $scope.LoadSanPhambyID = function () { 
		var key = 'id';
		var value = window.location.search.substring(window.location.search.indexOf(key)+key.length+1);		 
        $http({
            method: 'GET', 
            url: baseurl + 'SanPham/get-products-by-category/'+value,
        }).then(function (response) { 
            $scope.listSanPham = response.data;
        });
    };  
    $scope.pageIndex = 1;
    $scope.pageSizes = [10, 15, 20, 25];
    $scope.pageSize = $scope.pageSizes[0]; 
    $scope.totalItems = 0;
    $scope.listSearch=[];
    $scope.tenSanPham ='';
    
    // Hàm tìm kiếm sản phẩm với phân trang
    $scope.searchProduct = function() {
      var data = {
        page: $scope.pageIndex,
        pageSize: $scope.pageSize,
        tenSanPham: $scope.tenSanPham
      };
      $http({
        method: 'post',
        url: baseurl + "SanPham/search-products",
        data: data
      }).then(function(response) {
        $scope.listSearch = response.data;
        console.log($scope.listSearch)
        $scope.totalItems = response.data.TotalItems;
      });
    };
    
    // Hàm chuyển trang
    $scope.changePage = function(pageIndex) {
      $scope.pageIndex = pageIndex;
      $scope.searchProduct();
    };

    $scope.changePageSize = function() {
        $scope.currentPage = 1; // Trở về trang đầu tiên khi thay đổi kích thước trang
        $scope.searchProduct(); // Cập nhật danh sách sản phẩm với kích thước trang mới
      }
    $scope.LoadSanPhambyID()
});