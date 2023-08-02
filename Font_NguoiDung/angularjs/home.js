myApp.controller('HomeCtrl', function ($scope, $http) {
    var baseurl = 'https://localhost:44377/api/'
    $scope.listSanPhamBanChay;
    $scope.listSanPhamGiamGia;
    $scope.listSanPhamMoi;
    $scope.listLoaiSP;
    $scope.listSlide;

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
    //Slide
    $scope.LoadSlide = function () {
        $http({
            method: 'GET', 
            url: baseurl + "Slide/get-all-slide",
        }).then(function (resl) {
            $scope.listSlide = resl.data;       
        });
    }

    //Lấy sản phẩm mới
    $scope.LoadSanPhamMoi = function () {
        $http({
            method: 'GET', 
            url: baseurl + "SanPham/new-product/10",
        }).then(function (resl) {
            $scope.listSanPhamMoi = resl.data;       
        });
    }
    //Lấy sản phẩm bán chạy
    $scope.LoadSanPhamBanChay = function () {
        $http({
            method: 'GET', 
            url: baseurl + "SanPham/selling-products/10",
        }).then(function (resl) {
            $scope.listSanPhamBanChay = resl.data;       
        });
    }
    //Lấy sản phẩm giảm giá
    $scope.LoadSanPhamGiamGia = function () {
        $http({
            method: 'GET', 
            url: baseurl + "SanPham/discount-products/10",
        }).then(function (resl) {
            $scope.listSanPhamGiamGia = resl.data;       
        });
    }
    //Lấy loại sản phẩm
    $scope.LoadLoaiSP = function () {
        $http({
            method: 'GET', 
            url: baseurl + "LoaiSP/get-all-category",
        }).then(function (resl) {
            $scope.listLoaiSP = resl.data;     
        });
    }
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
    $scope.LoadSlide();
    $scope.LoadLoaiSP();
    $scope.LoadSanPhamMoi();
    $scope.LoadSanPhamGiamGia();
    $scope.LoadSanPhamBanChay();
});