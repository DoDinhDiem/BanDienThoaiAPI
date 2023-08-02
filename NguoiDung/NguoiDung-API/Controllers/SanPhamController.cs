using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using BLL.Interfaces;
using Models;
using System.Drawing.Printing;
using System.Xml.Linq;

namespace NguoiDung_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SanPhamController : ControllerBase
    {
        private ISanPhamBLL _sanphambll;
        public SanPhamController(ISanPhamBLL sanphambll)
        {
            _sanphambll = sanphambll;
        }
        [Route("get-products-by-category/{id}")]
        [HttpGet]
        public IEnumerable<SanPham> GetProductsByCategory(int id)
        {
            return _sanphambll.GetProductsByCategory(id);
        }
        [Route("get-products-by-id/{id}")]
        [HttpGet]
        public SanPham GetProductsByID(int id)
        {
            return _sanphambll.GetProductsByID(id);
        }
        [Route("get-similar-products/{masp}/{maloai}")]
        [HttpGet]
        public IEnumerable<SanPham> GetSimilarProducts(int masp, int maloai)
        {
            return _sanphambll.GetSimilarProducts(masp, maloai);
        }
        [Route("selling-products/{sl}")]
        [HttpGet]
        public IEnumerable<SanPham> SellingProducts(int sl)
        {
            return _sanphambll.SellingProducts(sl);
        }

        [Route("new-product/{sl}")]
        [HttpGet]
        public IEnumerable<SanPham> NewProduct(int sl)
        {
            return _sanphambll.NewProduct(sl);
        }
        [Route("discount-products/{sl}")]
        [HttpGet]
        public IEnumerable<SanPham> DiscountProducts(int sl)
        {
            return _sanphambll.DiscountProducts(sl);
        }
        [Route("search-products")]
        [HttpPost]
        public Search Search([FromBody] Dictionary<string, object> formData)
        {
            var response = new Search();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                string product_name = "";
                if (formData.Keys.Contains("tenSanPham") && !string.IsNullOrEmpty(Convert.ToString(formData["tenSanPham"]))) { product_name = Convert.ToString(formData["tenSanPham"]); }
                long total = 0;
                var data = _sanphambll.Search(page, pageSize, out total, product_name);
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
