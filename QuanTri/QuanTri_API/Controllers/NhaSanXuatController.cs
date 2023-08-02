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
    public class NhaSanXuatController : ControllerBase
    {
        private readonly INhaSanXuatBLL _nhasanxuatbll;
        public NhaSanXuatController(INhaSanXuatBLL loaibll)
        {
            _nhasanxuatbll = loaibll;
        }
        [Route("get-producer-all")]
        [HttpGet]
        public List<NhaSanXuat> GetAllProducer()
        {
            return _nhasanxuatbll.GetAllProducer();
        }
        [Route("get-producer-by-id/{id}")]
        [HttpGet]
        public NhaSanXuat LayTheoMaNhaSanXuat(int id)
        {
            return _nhasanxuatbll.LayTheoMaNhaSanXuat(id);
        }
        [Route("producer-create")]
        [HttpPost]
        public NhaSanXuat Them([FromBody] NhaSanXuat model)
        {
            _nhasanxuatbll.Them(model);
            return model;
        }

        [Route("producer-update")]
        [HttpPut]
        public NhaSanXuat Sua([FromBody] NhaSanXuat model)
        {
            _nhasanxuatbll.Sua(model);
            return model;
        }

        [Route("producer-delete/{id}")]
        [HttpDelete]
        public IActionResult Xoa(int id)
        {
            _nhasanxuatbll.Xoa(id);
            return Ok();
        }
        [Route("producer-search-name")]
        [HttpPost]
        public Search Search([FromBody] Dictionary<string, object> formData)
        {
            var response = new Search();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                string name = "";
                if (formData.Keys.Contains("tenNSX") && !string.IsNullOrEmpty(Convert.ToString(formData["tenNSX"]))) { name = Convert.ToString(formData["tenNSX"]); }
                long total = 0;
                var data = _nhasanxuatbll.Search(page, pageSize, out total, name);
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
