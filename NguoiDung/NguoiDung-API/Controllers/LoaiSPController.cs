using BLL.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Models;

namespace NguoiDung_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoaiSPController : ControllerBase
    {
        private readonly ILoaiSPBLL _categorybll;
        public LoaiSPController(ILoaiSPBLL categorybll)
        {
            _categorybll = categorybll;
        }
        [Route("get-all-category")]
        [HttpGet]
        public IEnumerable<LoaiSP> GetAllCategory()
        {
            return _categorybll.GetAllCategory();
        }
    }
}
