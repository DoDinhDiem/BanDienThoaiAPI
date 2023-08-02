function Login() {		
    var user = {};
    user.taiKhoan = $("#taikhoan").val();
    user.matKhau = $("#matkhau").val();
    
    $.ajax({
        type: "POST",
        url: "https://localhost:44381/api/TaiKhoan/login",
        dataType: "json",
        contentType: 'application/json',
        data: JSON.stringify(user)
    }).done(function (data) {         
        if (data != null && data.message != null && data.message != 'undefined') {
            alert(data.message);
        } else {
            localStorage.setItem("user", JSON.stringify(data));
            window.location.href = "index.html";
        }	   
    }) .fail(function() {
    alert('Tài khoản hoặc mật khẩu không chính xác');
    });
};

// JavaScript code

