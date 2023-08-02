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
    public class DonHangController : ControllerBase
    {
        private readonly IDonHangBLL _donhangbll;
        public DonHangController(IDonHangBLL donhangbll)
        {
            _donhangbll = donhangbll;
        }

        [Route("get-order-by-id/{id}")]
        [HttpGet]
        public DonHang LayTheoMaDonHang(int id)
        {
            return _donhangbll.LayTheoMaDonHang(id);
        }
        //[Route("order-create")]
        //[HttpPost]
        //public DonHang Them([FromBody] DonHang model)
        //{
        //    _donhangbll.Them(model);
        //    return model;
        //}

        [Route("order-update")]
        [HttpPut]
        public DonHang Sua([FromBody] DonHang model)
        {
            _donhangbll.Sua(model);
            return model;
        }

        //[Route("order-delete/{id}")]
        //[HttpDelete]
        //public IActionResult Xoa(int id)
        //{
        //    _donhangbll.Xoa(id);
        //    return Ok();
        //}
        [Route("order-search-id")]
        [HttpPost]
        public Search Search([FromBody] Dictionary<string, object> formData)
        {
            var response = new Search();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                string name = "";
                if (formData.Keys.Contains("maDonHang") && !string.IsNullOrEmpty(Convert.ToString(formData["maDonHang"]))) { name = Convert.ToString(formData["maDonHang"]); }
                long total = 0;
                var data = _donhangbll.Search(page, pageSize, out total, name);
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
