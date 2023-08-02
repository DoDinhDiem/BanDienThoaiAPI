using BLL.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Models;

namespace QuanTri_API.Controllers
{
    [Authorize]
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class KiemKhoController : ControllerBase
    {
        private readonly IKiemKhoBLL _kiemkhobll;
        public KiemKhoController(IKiemKhoBLL kiemkhobll)
        {
            _kiemkhobll = kiemkhobll;
        }

        [Route("get-inventory-by-id/{id}")]
        [HttpGet]
        public KiemKho LayTheoMaKiemKho(int id)
        {
            return _kiemkhobll.LayTheoMaKiemKho(id);
        }
        [Route("inventory-create")]
        [HttpPost]
        public KiemKho Them([FromBody] KiemKho model)
        {
            _kiemkhobll.Them(model);
            return model;
        }

        [Route("inventory-update")]
        [HttpPut]
        public KiemKho Sua([FromBody] KiemKho model)
        {
            _kiemkhobll.Sua(model);
            return model;
        }

        [Route("inventory-delete/{id}")]
        [HttpDelete]
        public IActionResult Xoa(int id)
        {
            _kiemkhobll.Xoa(id);
            return Ok();
        }
        [Route("inventory-search-id")]
        [HttpPost]
        public Search Search([FromBody] Dictionary<string, object> formData)
        {
            var response = new Search();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                string name = "";
                if (formData.Keys.Contains("maKiemKho") && !string.IsNullOrEmpty(Convert.ToString(formData["maKiemKho"]))) { name = Convert.ToString(formData["maKiemKho"]); }
                long total = 0;
                var data = _kiemkhobll.Search(page, pageSize, out total, name);
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

