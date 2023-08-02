var _user = JSON.parse(localStorage.getItem("user"));
var hoTen = _user.hoTen;
var accountUserName = document.querySelector(".account-user-name");
accountUserName.textContent = hoTen;
var loaiQuyen = _user.loaiQuyen;
var accountPosition = document.querySelector(".account-position");
accountPosition.textContent = loaiQuyen;
var accountUserAvatarImg = document.querySelector(".account-user-avatar img");
var user = JSON.parse(localStorage.getItem("user"));
var imgUrl = "/uploads/" + user.anhDaiDien;
accountUserAvatarImg.src = imgUrl;

const logoutButton = document.getElementById('logout');
logoutButton.addEventListener('click', function() {
  localStorage.removeItem('user');
  window.location.href = 'Login.html';
});


