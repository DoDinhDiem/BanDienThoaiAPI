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
    public class DonViTinhController : ControllerBase
    {
        private readonly IDonViTinhBLL _donvitinhbll;
        public DonViTinhController(IDonViTinhBLL donvitinhbll)
        {
            _donvitinhbll = donvitinhbll;
        }
        [Route("get-unit-all")]
        [HttpGet]
        public List<DonViTinh> GetAllUnit()
        {
            return _donvitinhbll.GetAllUnit();
        }
        [Route("get-unit-by-id/{id}")]
        [HttpGet]
        public DonViTinh LayTheoMaDonViTinh(int id)
        {
            return _donvitinhbll.LayTheoMaDonViTinh(id);
        }
        [Route("unit-create")]
        [HttpPost]
        public DonViTinh Them([FromBody] DonViTinh model)
        {
            _donvitinhbll.Them(model);
            return model;
        }

        [Route("unit-update")]
        [HttpPut]
        public DonViTinh Sua([FromBody] DonViTinh model)
        {
            _donvitinhbll.Sua(model);
            return model;
        }

        [Route("unit-delete/{id}")]
        [HttpDelete]
        public IActionResult Xoa(int id)
        {
            _donvitinhbll.Xoa(id);
            return Ok();
        }
        [Route("unit-search-name")]
        [HttpPost]
        public Search Search([FromBody] Dictionary<string, object> formData)
        {
            var response = new Search();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                string name = "";
                if (formData.Keys.Contains("tenDonViTinh") && !string.IsNullOrEmpty(Convert.ToString(formData["tenDonViTinh"]))) { name = Convert.ToString(formData["tenDonViTinh"]); }
                long total = 0;
                var data = _donvitinhbll.Search(page, pageSize, out total, name);
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
