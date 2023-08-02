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
    public class KhuyenMaiController : ControllerBase
    {
        private readonly IKhuyenMaiBLL _khuyenmaibll;
        public KhuyenMaiController(IKhuyenMaiBLL khuyenmaibll)
        {
            _khuyenmaibll = khuyenmaibll;
        }

        [Route("get-promotion-by-id/{id}")]
        [HttpGet]
        public KhuyenMai LayTheoMaKhuyenMai(int id)
        {
            return _khuyenmaibll.LayTheoMaKhuyenMai(id);
        }
        [Route("promotion-create")]
        [HttpPost]
        public KhuyenMai Them([FromBody] KhuyenMai model)
        {
            _khuyenmaibll.Them(model);
            return model;
        }

        [Route("promotion-update")]
        [HttpPut]
        public KhuyenMai Sua([FromBody] KhuyenMai model)
        {
            _khuyenmaibll.Sua(model);
            return model;
        }

        [Route("promotion-delete/{id}")]
        [HttpDelete]
        public IActionResult Xoa(int id)
        {
            _khuyenmaibll.Xoa(id);
            return Ok();
        }
        [Route("promotion-search-name")]
        [HttpPost]
        public Search Search([FromBody] Dictionary<string, object> formData)
        {
            var response = new Search();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                string name = "";
                if (formData.Keys.Contains("tenKhuyenMai") && !string.IsNullOrEmpty(Convert.ToString(formData["tenKhuyenMai"]))) { name = Convert.ToString(formData["tenKhuyenMai"]); }
                long total = 0;
                var data = _khuyenmaibll.Search(page, pageSize, out total, name);
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
