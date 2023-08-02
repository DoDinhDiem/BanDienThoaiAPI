using BLL.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Models;

namespace NguoiDung_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SlideController : ControllerBase
    {
        private readonly ISlideBLL _slidebll;
        public SlideController(ISlideBLL slidebll)
        {
            _slidebll = slidebll;
        }
        [Route("get-all-slide")]
        [HttpGet]
        public IEnumerable<Slide> GetAllSlide()
        {
            return _slidebll.GetAllSlide();
        }
    }
}
