var _user = JSON.parse(localStorage.getItem("user"));
myApp.controller("SlideCtrl", function ($scope, $http) {
  var baseurl = 'https://localhost:44381/api/'

  $scope.submit = "Thêm mới";
  $scope.listSlide = [];
  $scope.maSlide;
  $scope.anh;
  $scope.link;
  $scope.ngayTao;
  $scope.maSlideSearch = "";

  $scope.Reset = function () {
    $scope.maSlide = "";
    $scope.submit = "Thêm mới";
  }




  // Load danh sách loại sản phẩm
  $scope.pageIndex = 1;
  $scope.pageSizes = [5, 10, 15, 20, 25];
  $scope.pageSize = $scope.pageSizes[0];
  $scope.totalItems = 0;
  $scope.listSearch = [];



  // Hàm tìm kiếm sản phẩm với phân trang

  $scope.searchSlide = function () {
    var data = {
      page: $scope.pageIndex,
      pageSize: $scope.pageSize,
      maSlide: $scope.maSlideSearch
    };
    $http({
      method: 'post',
      headers: { "Authorization": 'Bearer ' + _user.token },
      url: baseurl + "Slide/slide-search-id",
      data: data
    }).then(function (response) {
      $scope.listSearch = response.data;
      $scope.totalItems = response.data.totalItems;
    });
  };

  // Hàm chuyển trang
  $scope.changePage = function (pageIndex) {
    $scope.pageIndex = pageIndex;
    $scope.searchSlide();
  };

  $scope.changePageSize = function () {
    $scope.currentPage = 1; // Trở về trang đầu tiên khi thay đổi kích thước trang
    $scope.searchSlide(); // Cập nhật danh sách sản phẩm với kích thước trang mới
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
    obj.link = $scope.link
    var file = document.getElementById('example-fileinput').files[0];
    if (file) {
      const formData = new FormData();
      formData.append('file', file);
      $http({
        method: 'POST',
        data: formData,
        headers: {
          'Content-Type': undefined,
        },
        url: baseurl + 'Slide/upload'
      }).then(function (response) {
        obj.anh = response.data.filePath;
        if ($scope.submit == "Thêm mới") {
          $http({
            method: 'POST',
            data: obj,
            headers: { "Authorization": 'Bearer ' + _user.token },
            url: baseurl + 'Slide/slide-create',
          }).then(function (response) {
            $scope.searchSlide();
            alert('Thêm sản phẩm thành công!');
          });
        }
        else {
          $http({
            method: 'PUT',
            data: obj,
            headers: { "Authorization": 'Bearer ' + _user.token },
            url: baseurl + 'Slide/slide-update',
          }).then(function (response) {
            $scope.searchSlide();
            alert('Cập nhật sản phẩm thành công!');
          });
        }
      })
    }
    else {
      obj.anh = $scope.anhDaiDien;
      if ($scope.submit === "Thêm mới") {
        $http({
          method: 'POST',
          data: obj,
          headers: { "Authorization": 'Bearer ' + _user.token },
          url: baseurl + 'Slide/slide-create',
        }).then(function (response) {
          $scope.searchSlide();
          alert('Thêm sản phẩm thành công!');
        });
      }
      else {
        $http({
          method: 'PUT',
          data: obj,
          headers: { "Authorization": 'Bearer ' + _user.token },
          url: baseurl + 'Slide/slide-update',
        }).then(function (response) {
          $scope.searchSlide();
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
      url: baseurl + 'Slide/get-slide-by-id/' + id,
    }).then(function (response) {
      let slide = response.data;
      $scope.maSlide = slide.maSlide;
      $scope.anh = slide.anh;
      $scope.link = slide.link
    });
  };

  // Xóa loại sản phẩm
  $scope.Xoa = function (id) {
    var result = confirm("Bạn có thực sự muốn xóa không?");
    if (result) {
      $http({
        method: 'DELETE',
        headers: { "Authorization": 'Bearer ' + _user.token },
        url: baseurl + 'Slide/slide-delete/' + id,
      }).then(function (response) {
        $scope.searchSlide();
        alert('Xóa thành công!');
      });
    }
  }
  $scope.searchSlide();
});