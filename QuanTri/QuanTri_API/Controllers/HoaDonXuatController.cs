using BLL.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Models;

namespace QuanTri_API.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class HoaDonXuatController : ControllerBase
    {
        private readonly IHoaDonXuatBLL _HoaDonXuatbll;
        public HoaDonXuatController(IHoaDonXuatBLL HoaDonXuatbll)
        {
            _HoaDonXuatbll = HoaDonXuatbll;
        }

        [Route("get-exportinvoice-by-id/{id}")]
        [HttpGet]
        public HoaDonXuat LayTheoMaHoaDonXuat(int id)
        {
            return _HoaDonXuatbll.LayTheoMaHoaDonXuat(id);
        }
        [Route("exportinvoice-create")]
        [HttpPost]
        public HoaDonXuat Them([FromBody] HoaDonXuat model)
        {
            _HoaDonXuatbll.Them(model);
            return model;
        }

        [Route("exportinvoice-update")]
        [HttpPut]
        public HoaDonXuat Sua([FromBody] HoaDonXuat model)
        {
            _HoaDonXuatbll.Sua(model);
            return model;
        }

        [Route("exportinvoice-delete/{id}")]
        [HttpDelete]
        public IActionResult Xoa(int id)
        {
            _HoaDonXuatbll.Xoa(id);
            return Ok();
        }
        [Route("exportinvoice-search-id")]
        [HttpPost]
        public Search Search([FromBody] Dictionary<string, object> formData)
        {
            var response = new Search();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                string name = "";
                if (formData.Keys.Contains("maHoaDonXuat") && !string.IsNullOrEmpty(Convert.ToString(formData["maHoaDonXuat"]))) { name = Convert.ToString(formData["maHoaDonXuat"]); }
                long total = 0;
                var data = _HoaDonXuatbll.Search(page, pageSize, out total, name);
                response.TotalItems = total;
                response.Data = data;
                response.Page = page;
                response.PageSize = pageSize;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return response;
        }
    }
}

