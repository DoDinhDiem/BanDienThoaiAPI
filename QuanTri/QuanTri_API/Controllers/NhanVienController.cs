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
    public class NhanVienController : ControllerBase
    {
        private readonly INhanVienBLL _nhanvienbll;
        private string _path;
        public NhanVienController(INhanVienBLL nhanvienbll, IConfiguration configuration)
        {
            _nhanvienbll = nhanvienbll;
            _path = configuration["AppSettings:WEB_SERVER_FULL_PATH"];
        }

        [Route("get-all-staff")]
        [HttpGet]
        public List<NhanVien> GetAllStaff()
        {
            return _nhanvienbll.GetAllStaff();
        }
        [Route("get-staff-by-id/{id}")]
        [HttpGet]
        public NhanVien LayTheoMaNhanVien(int id)
        {
            return _nhanvienbll.LayTheoMaNhanVien(id);
        }
        [Route("staff-create")]
        [HttpPost]
        public NhanVien Them([FromBody] NhanVien model)
        {
            _nhanvienbll.Them(model);
            return model;
        }

        [Route("staff-update")]
        [HttpPut]
        public NhanVien Sua([FromBody] NhanVien model)
        {
            _nhanvienbll.Sua(model);
            return model;
        }

        [Route("staff-delete/{id}")]
        [HttpDelete]
        public IActionResult Xoa(int id)
        {
            _nhanvienbll.Xoa(id);
            return Ok();
        }
        [Route("staff-search-name")]
        [HttpPost]
        public Search Search([FromBody] Dictionary<string, object> formData)
        {
            var response = new Search();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                string name = "";
                if (formData.Keys.Contains("tenNhanVien") && !string.IsNullOrEmpty(Convert.ToString(formData["tenNhanVien"]))) { name = Convert.ToString(formData["tenNhanVien"]); }
                long total = 0;
                var data = _nhanvienbll.Search(page, pageSize, out total, name);
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
                    string filePath = $"staff/{file.FileName}";
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
