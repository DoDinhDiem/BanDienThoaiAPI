var _user = JSON.parse(localStorage.getItem("user"));
myApp.controller("NhanVienCtrl", function ($scope, $http) {
  var baseurl = 'https://localhost:44381/api/'

  $scope.submit = "Thêm mới";
  $scope.maNhanVien;
  $scope.hoTen;
  $scope.ngaySinh;
  $scope.gioiTinh;
  $scope.anhDaiDien;
  $scope.diaChi;
  $scope.email;
  $scope.dienThoai;
  $scope.taiKhoan;
  $scope.matKhau;
  $scope.trangThai;
  $scope.loaiQuyen;
  $scope.tenNhanVienSearch = "";
  $scope.Reset = function () {
    $scope.maNhanVien;
    $scope.hoTen = "";
    $scope.ngaySinh = "";
    $scope.gioiTinh = "";
    $scope.anhDaiDien = "";
    $scope.diaChi = "";
    $scope.email = "";
    $scope.dienThoai = "";
    $scope.taiKhoan = "";
    $scope.matKhau = "";
    $scope.trangThai = "";
    $scope.loaiQuyen = "";
    $scope.submit = "Thêm mới";
  }

  // Load danh sách loại sản phẩm
  $scope.pageIndex = 1;
  $scope.pageSizes = [5, 10, 15, 20, 25];
  $scope.pageSize = $scope.pageSizes[0];
  $scope.totalItems = 0;
  $scope.listSearch = [];



  // Hàm tìm kiếm sản phẩm với phân trang

  $scope.searchStaff = function () {
    var data = {
      page: $scope.pageIndex,
      pageSize: $scope.pageSize,
      hoTen: $scope.tenNhanVienSearch
    };
    $http({
      method: 'post',
      headers: { "Authorization": 'Bearer ' + _user.token },
      url: baseurl + "NhanVien/staff-search-name",
      data: data
    }).then(function (response) {
      $scope.listSearch = response.data.data;
      $scope.totalItems = response.data.totalItems;
    });
  };

  // Hàm chuyển trang
  $scope.changePage = function (pageIndex) {
    $scope.pageIndex = pageIndex;
    $scope.searchStaff();
  };

  $scope.changePageSize = function () {
    $scope.currentPage = 1; // Trở về trang đầu tiên khi thay đổi kích thước trang
    $scope.searchStaff(); // Cập nhật danh sách sản phẩm với kích thước trang mới
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



  // Thêm hoặc cập nhật loại sản phẩm
  $scope.CreateUpdate = function () {
    let obj = {}
    obj.maNhanVien = $scope.maNhanVien
    obj.hoTen = $scope.hoTen
    obj.ngaySinh = $scope.ngaySinh
    obj.gioiTinh = ($scope.gioiTinh === "Nam") ? 'Nam' : 'Nữ'
    obj.diaChi = $scope.diaChi
    obj.email = $scope.email
    obj.dienThoai = $scope.dienThoai
    obj.taiKhoan = $scope.taiKhoan
    obj.matKhau = $scope.matKhau
    obj.trangThai = ($scope.trangThai === "true") ? true : false
    obj.loaiQuyen = ($scope.loaiQuyen === "Quản lý") ? 'Quản lý' : 'Nhân viên'
    // Thực hiện thêm mới
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
        url: baseurl + 'NhanVien/upload'
      }).then(function (response) {
        obj.anhDaiDien = response.data.filePath;
        if ($scope.submit == "Thêm mới") {
          $http({
            method: 'POST',
            data: obj,
            headers: { "Authorization": 'Bearer ' + _user.token },
            url: baseurl + 'NhanVien/staff-create',
          }).then(function (response) {
            $scope.searchStaff();
            alert('Thêm sản phẩm thành công!');
          });
        }
        else {
          $http({
            method: 'PUT',
            headers: { "Authorization": 'Bearer ' + _user.token },
            data: obj,
            url: baseurl + 'NhanVien/staff-update',
          }).then(function (response) {
            $scope.searchStaff();
            alert('Cập nhật sản phẩm thành công!');
          });
        }
      })
    }
    else {
      obj.anhDaiDien = $scope.anhDaiDien;
      if ($scope.submit === "Thêm mới") {
        $http({
          method: 'POST',
          data: obj,
          headers: { "Authorization": 'Bearer ' + _user.token },
          url: baseurl + 'NhanVien/staff-create',
        }).then(function (response) {
          $scope.searchStaff();
          alert('Thêm sản phẩm thành công!');
        });
      }
      else {
        $http({
          method: 'PUT',
          headers: { "Authorization": 'Bearer ' + _user.token },
          data: obj,
          url: baseurl + 'NhanVien/staff-update',
        }).then(function (response) {
          $scope.searchStaff();
          alert('Cập nhật sản phẩm thành công!');
        });
      }
    }
  }

  // Lấy thông tin loại sản phẩm để sửa
  $scope.Sua = function (id) {
    $scope.submit = "Lưu lại";
    $http({
      method: 'GET',
      headers: { "Authorization": 'Bearer ' + _user.token },
      url: baseurl + 'NhanVien/get-staff-by-id/' + id,
    }).then(function (response) {
      $scope.item = response.data;
      let nhanVien = response.data;
      $scope.maNhanVien = nhanVien.maNhanVien;
      $scope.hoTen = nhanVien.hoTen;
      $scope.ngaySinh = nhanVien.ngaySinh;
      $scope.gioiTinh = nhanVien.gioiTinh;
      $scope.anhDaiDien = nhanVien.anhDaiDien;
      $scope.diaChi = nhanVien.diaChi;
      $scope.email = nhanVien.email;
      $scope.dienThoai = nhanVien.dienThoai;
      $scope.taiKhoan = nhanVien.taiKhoan;
      $scope.matKhau = nhanVien.matKhau;
      $scope.trangThai = nhanVien.trangThai;
      $scope.loaiQuyen = nhanVien.loaiQuyen;

    });
  };

  // Xóa loại sản phẩm
  $scope.Xoa = function (id) {
    var result = confirm("Bạn có thực sự muốn xóa không?");
    if (result) {
      $http({
        method: 'DELETE',
        headers: { "Authorization": 'Bearer ' + _user.token },
        url: baseurl + 'NhanVien/staff-delete/' + id,
      }).then(function (response) {
        $scope.searchStaff();
        alert('Xóa thành công!');
      });
    }
  }
  $scope.searchStaff();
});