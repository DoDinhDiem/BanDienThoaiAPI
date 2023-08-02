using BLL;
using BLL.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Models;

namespace QuanTri_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoaiSPController : ControllerBase
    {
        private readonly ILoaiSPBLL _loaibll;
        public LoaiSPController(ILoaiSPBLL loaibll)
        {
            _loaibll = loaibll;
        }
        [Route("get-all-category")]
        [HttpGet]
        public List<LoaiSP> GetAllCategory()
        {
            return _loaibll.GetAllCategory();
        }
        [Route("get-category-by-id/{id}")]
        [HttpGet]
        public LoaiSP LayTheoMaLoai(int id)
        {
            return _loaibll.LayTheoMaLoai(id);
        }
        [Route("category-create")]
        [HttpPost]
        public LoaiSP Them([FromBody] LoaiSP model)
        {
            _loaibll.Them(model);
            return model;
        }

        [Route("category-update")]
        [HttpPut]
        public LoaiSP Sua([FromBody] LoaiSP model)
        {
            _loaibll.Sua(model);
            return model;
        }

        [Route("category-delete/{id}")]
        [HttpDelete]
        public IActionResult Xoa(int id)
        {
            _loaibll.Xoa(id);
            return Ok();
        }
        [Route("category-search-name")]
        [HttpPost]
        public Search Search([FromBody] Dictionary<string, object> formData)
        {
            var response = new Search();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                string name = "";
                if (formData.Keys.Contains("tenLoai") && !string.IsNullOrEmpty(Convert.ToString(formData["tenLoai"]))) { name = Convert.ToString(formData["tenLoai"]); }
                long total = 0;
                var data = _loaibll.Search(page, pageSize, out total, name);
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
