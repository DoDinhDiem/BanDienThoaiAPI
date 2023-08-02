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
    public class HoaDonNhapController : ControllerBase
    {
        private readonly IHoaDonNhapBLL _hoadonnhapbll;
        public HoaDonNhapController(IHoaDonNhapBLL hoadonnhapbll)
        {
            _hoadonnhapbll = hoadonnhapbll;
        }

        [Route("get-menuized-by-id/{id}")]
        [HttpGet]
        public HoaDonNhap LayTheoMaHoaDonNhap(int id)
        {
            return _hoadonnhapbll.LayTheoMaHoaDonNhap(id);
        }
        [Route("menuized-create")]
        [HttpPost]
        public HoaDonNhap Them([FromBody] HoaDonNhap model)
        {
            _hoadonnhapbll.Them(model);
            return model;
        }

        [Route("menuized-update")]
        [HttpPut]
        public HoaDonNhap Sua([FromBody] HoaDonNhap model)
        {
            _hoadonnhapbll.Sua(model);
            return model;
        }

        [Route("menuized-delete/{id}")]
        [HttpDelete]
        public IActionResult Xoa(int id)
        {
            _hoadonnhapbll.Xoa(id);
            return Ok();
        }
        [Route("menuized-search-id")]
        [HttpPost]
        public Search Search([FromBody] Dictionary<string, object> formData)
        {
            var response = new Search();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                string name = "";
                if (formData.Keys.Contains("maHoaDonNhap") && !string.IsNullOrEmpty(Convert.ToString(formData["maHoaDonNhap"]))) { name = Convert.ToString(formData["maHoaDonNhap"]); }
                long total = 0;
                var data = _hoadonnhapbll.Search(page, pageSize, out total, name);
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
