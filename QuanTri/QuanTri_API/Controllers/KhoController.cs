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
    public class KhoController : ControllerBase
    {
        private readonly IKhoBLL _khobll;
        public KhoController(IKhoBLL khobll)
        {
            _khobll = khobll;
        }

        [Route("get-warehouse-by-id/{id}")]
        [HttpGet]
        public Kho LayTheoMaKho(int id)
        {
            return _khobll.LayTheoMaKho(id);
        }
        [Route("warehouse-create")]
        [HttpPost]
        public Kho Them([FromBody] Kho model)
        {
            _khobll.Them(model);
            return model;
        }

        [Route("warehouse-update")]
        [HttpPut]
        public Kho Sua([FromBody] Kho model)
        {
            _khobll.Sua(model);
            return model;
        }

        [Route("warehouse-delete/{id}")]
        [HttpDelete]
        public IActionResult Xoa(int id)
        {
            _khobll.Xoa(id);
            return Ok();
        }
        [Route("warehouse-search-name")]
        [HttpPost]
        public Search Search([FromBody] Dictionary<string, object> formData)
        {
            var response = new Search();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                string name = "";
                if (formData.Keys.Contains("tenKho") && !string.IsNullOrEmpty(Convert.ToString(formData["tenKho"]))) { name = Convert.ToString(formData["tenKho"]); }
                long total = 0;
                var data = _khobll.Search(page, pageSize, out total, name);
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
