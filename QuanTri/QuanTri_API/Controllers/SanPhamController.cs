using BLL.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Models;
using System.Drawing.Printing;

namespace QuanTri_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SanPhamController : ControllerBase
    {
        private readonly ISanPhamBLL _sanphambll;
        private string _path;
        public SanPhamController(ISanPhamBLL sanphambll, IConfiguration configuration)
        {
            _sanphambll = sanphambll;
            _path = configuration["AppSettings:WEB_SERVER_FULL_PATH"];
        }
        [Route("get-all-products")]
        [HttpGet]
        public List<SanPham> GetAllSanPham()
        {
            return _sanphambll.GetAllSanPham();
        }
        [Route("get-products-by-id/{id}")]
        [HttpGet]
        public SanPham LayTheoMaSanPham(int id)
        {
            return _sanphambll.LayTheoMaSanPham(id);
        }
        [Route("products-create")]
        [HttpPost]
        public SanPham Them([FromBody] SanPham model)
        {
            _sanphambll.Them(model);
            return model;
        }

        [Route("products-update")]
        [HttpPut]
        public SanPham Sua([FromBody] SanPham model)
        {
            _sanphambll.Sua(model);
            return model;
        }

        [Route("products-delete/{id}")]
        [HttpDelete]
        public IActionResult Xoa(int id)
        {
            _sanphambll.Xoa(id);
            return Ok();
        }
        [Route("products-search-name")]
        [HttpPost]
        public Search Search([FromBody] Dictionary<string, object> formData)
        {
            var response = new Search();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                string name = "";
                if (formData.Keys.Contains("tenSanPham") && !string.IsNullOrEmpty(Convert.ToString(formData["tenSanPham"]))) { name = Convert.ToString(formData["tenSanPham"]); }
                long total = 0;
                var data = _sanphambll.Search(page, pageSize, out total, name);
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
        [AllowAnonymous]
        [Route("upload")]
        [HttpPost, DisableRequestSizeLimit]
        public async Task<IActionResult> Upload(IFormFile file)
        {
            try
            {
                if (file.Length > 0)
                {
                    string filePath = $"products/{file.FileName}";
                    var fullPath = CreatePathFile(filePath);
                    using (var fileStream = new FileStream(fullPath, FileMode.Create))
                    {
                        await file.CopyToAsync(fileStream);
                    }
                    return Ok(new { filePath });
                }
                else
                {
                    return BadRequest();
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Not found!");
            }
        }
        [NonAction]
        private string CreatePathFile(string RelativePathFileName)
        {
            try
            {
                string serverRootPathFolder = _path;
                string fullPathFile = $@"{serverRootPathFolder}\{RelativePathFileName}";
                string fullPathFolder = System.IO.Path.GetDirectoryName(fullPathFile);
                if (!Directory.Exists(fullPathFolder))
                    Directory.CreateDirectory(fullPathFolder);
                return fullPathFile;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }
    }
}
