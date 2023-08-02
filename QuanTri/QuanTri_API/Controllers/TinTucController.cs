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
    public class TinTucController : ControllerBase
    {
        private readonly ITinTucBLL _tintucbll;
        public TinTucController(ITinTucBLL tintucbll)
        {
            _tintucbll = tintucbll;
        }

        [Route("get-news-by-id/{id}")]
        [HttpGet]
        public TinTuc LayTheoMaTinTuc(int id)
        {
            return _tintucbll.LayTheoMaTinTuc(id);
        }
        [Route("news-create")]
        [HttpPost]
        public TinTuc Them([FromBody] TinTuc model)
        {
            _tintucbll.Them(model);
            return model;
        }

        [Route("news-update")]
        [HttpPut]
        public TinTuc Sua([FromBody] TinTuc model)
        {
            _tintucbll.Sua(model);
            return model;
        }

        [Route("news-delete/{id}")]
        [HttpDelete]
        public IActionResult Xoa(int id)
        {
            _tintucbll.Xoa(id);
            return Ok();
        }
        [Route("news-search-name")]
        [HttpPost]
        public Search Search([FromBody] Dictionary<string, object> formData)
        {
            var response = new Search();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                string name = "";
                if (formData.Keys.Contains("tieuDe") && !string.IsNullOrEmpty(Convert.ToString(formData["tieuDe"]))) { name = Convert.ToString(formData["tieuDe"]); }
                long total = 0;
                var data = _tintucbll.Search(page, pageSize, out total, name);
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
