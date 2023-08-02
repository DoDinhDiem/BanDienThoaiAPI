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
    public class NhaCungCapController : ControllerBase
    {
        private readonly INhaCungCapBLL _nhacungcap;
        public NhaCungCapController(INhaCungCapBLL nhacungcapbll)
        {
            _nhacungcap = nhacungcapbll;
        }
        [Route("get-all-supplier")]
        [HttpGet]
        public List<NhaCungCap> GetAllSupplier()
        {
            return _nhacungcap.GetAllSupplier();
        }
        [Route("get-supplier-by-id/{id}")]
        [HttpGet]
        public NhaCungCap LayTheoMaNhaCungCap(int id)
        {
            return _nhacungcap.LayTheoMaNhaCungCap(id);
        }
        [Route("supplier-create")]
        [HttpPost]
        public NhaCungCap Them([FromBody] NhaCungCap model)
        {
            _nhacungcap.Them(model);
            return model;
        }

        [Route("supplier-update")]
        [HttpPut]
        public NhaCungCap Sua([FromBody] NhaCungCap model)
        {
            _nhacungcap.Sua(model);
            return model;
        }

        [Route("supplier-delete/{id}")]
        [HttpDelete]
        public IActionResult Xoa(int id)
        {
            _nhacungcap.Xoa(id);
            return Ok();
        }
        [Route("supplier-search-name")]
        [HttpPost]
        public Search Search([FromBody] Dictionary<string, object> formData)
        {
            var response = new Search();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                string name = "";
                if (formData.Keys.Contains("tenNhaCungCap") && !string.IsNullOrEmpty(Convert.ToString(formData["tenNhaCungCap"]))) { name = Convert.ToString(formData["tenNhaCungCap"]); }
                long total = 0;
                var data = _nhacungcap.Search(page, pageSize, out total, name);
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
