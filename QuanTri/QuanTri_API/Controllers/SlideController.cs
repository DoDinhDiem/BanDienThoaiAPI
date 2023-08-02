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
    public class SlideController : ControllerBase
    {
        private readonly ISlideBLL _slidebll; 
        private string _path;
        public SlideController(ISlideBLL slidebll, IConfiguration configuration)
        {
            _slidebll = slidebll;
            _path = configuration["AppSettings:WEB_SERVER_FULL_PATH"];
        }

        [Route("get-slide-by-id/{id}")]
        [HttpGet]
        public Slide LayTheoMaSlide(int id)
        {
            return _slidebll.LayTheoMaSlide(id);
        }
        [Route("slide-create")]
        [HttpPost]
        public Slide Them([FromBody] Slide model)
        {
            _slidebll.Them(model);
            return model;
        }

        [Route("slide-update")]
        [HttpPut]
        public Slide Sua([FromBody] Slide model)
        {
            _slidebll.Sua(model);
            return model;
        }

        [Route("slide-delete/{id}")]
        [HttpDelete]
        public IActionResult Xoa(int id)
        {
            _slidebll.Xoa(id);
            return Ok();
        }
        [Route("slide-search-id")]
        [HttpPost]
        public Search Search([FromBody] Dictionary<string, object> formData)
        {
            var response = new Search();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                string name = "";
                if (formData.Keys.Contains("maSlide") && !string.IsNullOrEmpty(Convert.ToString(formData["maSlide"]))) { name = Convert.ToString(formData["maSlide"]); }
                long total = 0;
                var data = _slidebll.Search(page, pageSize, out total, name);
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
                    string filePath = $"slide/{file.FileName}";
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

