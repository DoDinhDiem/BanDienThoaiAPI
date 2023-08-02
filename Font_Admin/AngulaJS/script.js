var user = JSON.parse(localStorage.getItem('user'));
if (!user) {
    window.location.href = "Login.html";
}