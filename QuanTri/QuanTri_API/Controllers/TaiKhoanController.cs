using BLL.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Models;

namespace QuanTri_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TaiKhoanController : ControllerBase
    {
        private ITaiKhoanBLL _taikhoanBusiness;
        private string _path;
        public TaiKhoanController(ITaiKhoanBLL taikhoanBusiness, IConfiguration configuration)
        {
            _taikhoanBusiness = taikhoanBusiness;
            _path = configuration["AppSettings:PATH"];
        }

        [AllowAnonymous]
        [HttpPost("login")]
        public IActionResult Login([FromBody] AuthenticateModel model)
        {
            var user = _taikhoanBusiness.Authenticate(model.TaiKhoan, model.MatKhau);

            if (user == null)
                return BadRequest(new { message = "Tài khoản hoặc mật khẩu không đúng" });
            return Ok(new { MaNhanVien = user.MaNhanVien, HoTen = user.HoTen, AnhDaiDien = user.AnhDaiDien, TaiKhoan = user.TaiKhoan, LoaiQuyen = user.LoaiQuyen, Token = user.ToKen });
        }
    }
}
