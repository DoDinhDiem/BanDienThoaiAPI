using BLL;
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
    public class KhachHangController : ControllerBase
    {
        private readonly IKhachHangBLL _khachhangbll;
        public KhachHangController(IKhachHangBLL khachhangbll)
        {
            _khachhangbll = khachhangbll;
        }
        [Route("get-all-custumer")]
        [HttpGet]
        public List<KhachHang> GetAllCustumer()
        {
            return _khachhangbll.GetAllCustumer();
        }
        [Route("get-custumer-by-id/{id}")]
        [HttpGet]
        public KhachHang LayTheoMaKhachHang(int id)
        {
            return _khachhangbll.LayTheoMaKhachHang(id);
        }
        [Route("custumer-create")]
        [HttpPost]
        public KhachHang Them([FromBody] KhachHang model)
        {
            _khachhangbll.Them(model);
            return model;
        }

        [Route("custumer-update")]
        [HttpPut]
        public KhachHang Sua([FromBody] KhachHang model)
        {
            _khachhangbll.Sua(model);
            return model;
        }

        [Route("custumer-delete/{id}")]
        [HttpDelete]
        public IActionResult Xoa(int id)
        {
            _khachhangbll.Xoa(id);
            return Ok();
        }
        [Route("custumer-search-name")]
        [HttpPost]
        public Search Search([FromBody] Dictionary<string, object> formData)
        {
            var response = new Search();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                string name = "";
                if (formData.Keys.Contains("tenKhachHang") && !string.IsNullOrEmpty(Convert.ToString(formData["tenKhachHang"]))) { name = Convert.ToString(formData["tenKhachHang"]); }
                long total = 0;
                var data = _khachhangbll.Search(page, pageSize, out total, name);
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
