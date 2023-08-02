using BLL.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Models;

namespace NguoiDung_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DonHangController : ControllerBase
    {

        private IDonHangBLL _donhangbll;
        public DonHangController(IDonHangBLL donhangbll)
        {
            _donhangbll = donhangbll;
        }
        [Route("create-order")]
        [HttpPost]
        public DonHang Create([FromBody] DonHang model)
        {
            _donhangbll.Create(model);
            return model;
        }
    }
}
