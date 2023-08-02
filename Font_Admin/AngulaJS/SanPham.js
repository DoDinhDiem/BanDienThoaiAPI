var _user = JSON.parse(localStorage.getItem("user"));
myApp.controller("SanPhamCtrl", function ($scope, $http) {
  var baseurl = 'https://localhost:44381/api/'

  //Lấy full loại
  $scope.LoadLoaiSP = function () {
    $http({
      method: 'GET',
      headers: { "Authorization": 'Bearer ' + _user.token },
      url: baseurl + "LoaiSP/get-all-category"
    }).then(function (response) {
      $scope.listLoaiSP = response.data;
    });
  }
  //Lấy full nhà sản xuất
  $scope.LoadNhaSanXuat = function () {
    $http({
      method: 'GET',
      headers: { "Authorization": 'Bearer ' + _user.token },
      url: baseurl + "NhaSanXuat/get-producer-all"
    }).then(function (response) {
      $scope.listNhaSanXuat = response.data;
    });
  }
  //Lấy full đơn vị tính
  $scope.LoadDonViTinh = function () {
    $http({
      method: 'GET',
      headers: { "Authorization": 'Bearer ' + _user.token },
      url: baseurl + "DonViTinh/get-unit-all"
    }).then(function (response) {
      $scope.listDonViTinh = response.data;
    });
  }



  // Load danh sách sản phẩm
  $scope.pageIndex = 1;
  $scope.pageSizes = [5, 10, 15, 20, 25];
  $scope.pageSize = $scope.pageSizes[0];
  $scope.totalItems = 0;
  $scope.tenSanPhamSearch = "";
  $scope.listSearch = [];



  // Hàm tìm kiếm sản phẩm với phân trang

  $scope.searchProduct = function () {
    var data = {
      page: $scope.pageIndex,
      pageSize: $scope.pageSize,
      tenSanPham: $scope.tenSanPhamSearch
    };
    $http({
      method: 'post',
      url: baseurl + "SanPham/products-search-name",
      data: data
    }).then(function (response) {
      $scope.listSearch = response.data.data;
      $scope.totalItems = response.data.totalItems;
    });
  };

  // Hàm chuyển trang
  $scope.changePage = function (pageIndex) {
    $scope.pageIndex = pageIndex;
    $scope.searchProduct();
  };

  $scope.changePageSize = function () {
    $scope.currentPage = 1; // Trở về trang đầu tiên khi thay đổi kích thước trang
    $scope.searchProduct(); // Cập nhật danh sách sản phẩm với kích thước trang mới
  }


  $scope.getPages = function () {
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




  //Khỏi tạo dữ liệu
  $scope.submit = "Thêm mới";

  $scope.maSanPham;
  $scope.tenSanPham;
  $scope.maLoai;
  $scope.anhDaiDien;
  $scope.moTa;
  $scope.maNSX;
  $scope.maDonViTinh;
  $scope.giaBan;
  $scope.listjson_chitietanh = [];
  $scope.listjson_thongsokythuat = [];



  $scope.Reset = function () {
    $scope.maSanPham = "";
    $scope.tenSanPham = "";
    $scope.maLoai = "";
    $scope.anhDaiDien = "";
    $scope.moTa = "";
    $scope.maNSX = "";
    $scope.maDonViTinh = "";
    $scope.giaBan = "";
    $scope.submit = "Thêm mới";
  }

  $scope.newProduct = {
    anh: [],
    thongso: []
  };

  $scope.addNewAnh = function () {
    $scope.listjson_chitietanh.push({});

  };

  $scope.removeAnh = function (index) {
    $scope.listjson_chitietanh.splice(index, 1);
  };

  $scope.addNewThongSo = function () {
    $scope.listjson_thongsokythuat.push({});
  };

  $scope.removeThongSo = function (index) {
    $scope.listjson_thongsokythuat.splice(index, 1);
  };

  $scope.CreateUpdate = function () {

    let product = {}
    product.maSanPham = $scope.maSanPham;
    product.maLoai = $scope.maLoai;
    product.tenSanPham = $scope.tenSanPham;
    product.moTaSanPham = $scope.moTaSanPham;
    // product.anhDaiDien = $scope.anhDaiDien;
    product.maNSX = $scope.maNSX;
    product.maDonViTinh = $scope.maDonViTinh;
    product.giaBan = $scope.giaBan;
    // product.listjson_chitietanh = $scope.listjson_chitietanh;
    product.listjson_thongsokythuat = $scope.listjson_thongsokythuat;


    var file = document.getElementById('example-fileinput').files[0];
    if (file) {
      const formData = new FormData();
      formData.append('file', file);
      $http({
        method: 'POST',
        data: formData,
        headers: {
          'Content-Type': undefined
        },
        url: baseurl + 'SanPham/upload'
      }).then(function (response) {
        var listAnhChiTiet = [];
        if(listAnhChiTiet.length > 0 ){
          product.anhDaiDien = response.data.filePath;
          for (var i = 0; i < $scope.listjson_chitietanh.length; i++) {
            var fileCT = document.getElementById("anhct" + i).files[0];
            if (fileCT) {
              const formDataCT = new FormData();
              formDataCT.append('file', fileCT);
              $http({
                method: 'POST',
                data: formDataCT,
                headers: {
                  'Content-Type': undefined
                },
                url: baseurl + 'SanPham/upload'
              }).then(function (responseCT) {
                listAnhChiTiet.push(responseCT.data.filePath);
                if (listAnhChiTiet.length == $scope.listjson_chitietanh.length) {
                  product.listjson_chitietanh = listAnhChiTiet;
                  if ($scope.submit == "Thêm mới") {
                    $http({
                      method: 'POST',
                      headers: { "Authorization": 'Bearer ' + _user.token },
                      data: product,
                      url: baseurl + 'SanPham/products-create',
                    }).then(function (response) {
                      $scope.searchProduct();
                      alert('Thêm sản phẩm thành công!');
                    });
                  }
                  else {
                    $http({
                      method: 'PUT',
                      data: product,
                      headers: { "Authorization": 'Bearer ' + _user.token },
                      url: baseurl + 'SanPham/products-update',
                    }).then(function (response) {
                      $scope.searchProduct();
                      alert('Cập nhật sản phẩm thành công!');
                    });
                  }
                }
              });
            } else {
              listAnhChiTiet.push($scope.listjson_chitietanh[i].anh);
              if (listAnhChiTiet.length == $scope.listjson_chitietanh.length) {
                product.listjson_chitietanh = listAnhChiTiet;
                if ($scope.submit == "Thêm mới") {
                  $http({
                    method: 'POST',
                    data: product,
                    headers: { "Authorization": 'Bearer ' + _user.token },
                    url: baseurl + 'SanPham/products-create',
                  }).then(function (response) {
                    $scope.searchProduct();
                    alert('Thêm sản phẩm thành công!');
                  });
                }
                else {
                  $http({
                    method: 'PUT',
                    data: product,
                    headers: { "Authorization": 'Bearer ' + _user.token },
                    url: baseurl + 'SanPham/products-update',
                  }).then(function (response) {
                    $scope.searchProduct();
                    alert('Cập nhật sản phẩm thành công!');
                  });
                }
              }
            }
          }
        }
        else{
          product.anhDaiDien = response.data.filePath;
          if ($scope.submit == "Thêm mới") {
            $http({
              method: 'POST',
              data: product,
              headers: { "Authorization": 'Bearer ' + _user.token },
              url: baseurl + 'SanPham/products-create',
            }).then(function (response) {
              $scope.searchProduct();
              alert('Thêm sản phẩm thành công!');
            });
          }
          else {
            product.maSanPham = $scope.maSanPham
            $http({
              method: 'PUT',
              data: product,
              headers: { "Authorization": 'Bearer ' + _user.token },
              url: baseurl + 'SanPham/products-update',
            }).then(function (response) {
              $scope.searchProduct();
              alert('Cập nhật sản phẩm thành công!');
            });
          }
        }
      });
    }
    else {
      
      var listAnhChiTiet = [];
      if(listAnhChiTiet.length > 0){
        product.anhDaiDien = $scope.anhDaiDien;
        for (var i = 0; i < $scope.listjson_chitietanh.length; i++) {
          var fileCT = document.getElementById("anhct" + i).files[0];
          if (fileCT) {
            const formDataCT = new FormData();
            formDataCT.append('file', fileCT);
            $http({
              method: 'POST',
              data: formDataCT,
              headers: {
                'Content-Type': undefined
              },
              url: baseurl + 'SanPham/upload'
            }).then(function (responseCT) {
              listAnhChiTiet.push(responseCT.data.filePath);
              if (listAnhChiTiet.length == $scope.listjson_chitietanh.length) {
                product.listjson_chitietanh = listAnhChiTiet;
                if ($scope.submit == "Thêm mới") {
                  $http({
                    method: 'POST',
                    data: product,
                    headers: { "Authorization": 'Bearer ' + _user.token },
                    url: baseurl + 'SanPham/products-create',
                  }).then(function (response) {
                    $scope.searchProduct();
                    alert('Thêm sản phẩm thành công!');
                  });
                }
                else {
                  $http({
                    method: 'PUT',
                    data: product,
                    headers: { "Authorization": 'Bearer ' + _user.token },
                    url: baseurl + 'SanPham/products-update',
                  }).then(function (response) {
                    $scope.searchProduct();
                    alert('Cập nhật sản phẩm thành công!');
                  });
                }
              }
            });
          } else {
            listAnhChiTiet.push($scope.listjson_chitietanh[i].anh);
            if (listAnhChiTiet.length == $scope.listjson_chitietanh.length) {
              product.listjson_chitietanh = listAnhChiTiet;
              if ($scope.submit == "Thêm mới") {
                $http({
                  method: 'POST',
                  data: product,
                  headers: { "Authorization": 'Bearer ' + _user.token },
                  url: baseurl + 'SanPham/products-create',
                }).then(function (response) {
                  $scope.searchProduct();
                  alert('Thêm sản phẩm thành công!');
                });
              }
              else {
                $http({
                  method: 'PUT',
                  data: product,
                  headers: { "Authorization": 'Bearer ' + _user.token },
                  url: baseurl + 'SanPham/products-update',
                }).then(function (response) {
                  $scope.searchProduct();
                  alert('Cập nhật sản phẩm thành công!');
                });
              }
            }
          }
        }
      }
      else{
        product.anhDaiDien = $scope.anhDaiDien;
          if ($scope.submit == "Thêm mới") {
            $http({
              method: 'POST',
              data: product,
              headers: { "Authorization": 'Bearer ' + _user.token },
              url: baseurl + 'SanPham/products-create',
            }).then(function (response) {
              $scope.searchProduct();
              alert('Thêm sản phẩm thành công!');
            });
          }
          else {
            product.maSanPham = $scope.maSanPham
            $http({
              method: 'PUT',
              data: product,
              headers: { "Authorization": 'Bearer ' + _user.token },
              url: baseurl + 'SanPham/products-update',
            }).then(function (response) {
              $scope.searchProduct();
              alert('Cập nhật sản phẩm thành công!');
            });
          }
      }
      
    }
  }
    

// Lấy thông tin loại sản phẩm để sửa
$scope.Sua = function (id) {
  $scope.submit = "Lưu lại";
  $http({
    method: 'GET',
    // headers: { "Authorization": 'Bearer ' + _user.token },
    url: baseurl + 'SanPham/get-products-by-id/' + id,
  }).then(function (response) {
    $scope.item = response.data;
    let sanpham = response.data;
    $scope.maSanPham = sanpham.maSanPham
    $scope.maLoai = sanpham.maLoai;
    $scope.tenSanPham = sanpham.tenSanPham;
    $scope.moTaSanPham = sanpham.moTaSanPham;
    $scope.anhDaiDien = sanpham.anhDaiDien;
    $scope.maNSX = sanpham.maNSX;
    $scope.maDonViTinh = sanpham.maDonViTinh;
    $scope.giaBan = sanpham.giaBan;
    $scope.listjson_chitietanh = sanpham.listjson_chitietanh;
    $scope.listjson_thongsokythuat = sanpham.listjson_thongsokythuat;
  });
};

// Xóa loại sản phẩm
$scope.Xoa = function (id) {
  var result = confirm("Bạn có thực sự muốn xóa không?");
  if (result) {
    $http({
      method: 'DELETE',
      // headers: { "Authorization": 'Bearer ' + _user.token },
      url: baseurl + 'SanPham/products-delete/' + id,
    }).then(function (response) {
      $scope.searchProduct();
      alert('Xóa thành công!');
    });
  }
}


$scope.LoadLoaiSP();
$scope.LoadNhaSanXuat();
$scope.LoadDonViTinh();
$scope.searchProduct();
  });