using BLL.Interfaces;
using DAL.Interfaces;
using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class SanPhamBLL : ISanPhamBLL
    {

        private ISanPhamDAL _sanphamdal;
        public SanPhamBLL(ISanPhamDAL sanphamdal)
        {
            _sanphamdal = sanphamdal;
        }
        public SanPham GetProductsByID(int id)
        {
            return _sanphamdal.GetProductsByID(id);
        }
        public List<SanPham> GetProductsByCategory(int id)
        {
            return _sanphamdal.GetProductsByCategory(id);
        }
        public List<SanPham> GetSimilarProducts(int masp, int maloai)
        {
            return _sanphamdal.GetSimilarProducts(masp, maloai);
        }
        public List<SanPham> SellingProducts(int id)
        {
            return _sanphamdal.SellingProducts(id);
        }
        public List<SanPham> NewProduct(int id)
        {
            return _sanphamdal.NewProduct(id);
        }
        public List<SanPham> DiscountProducts(int id)
        {
            return _sanphamdal.DiscountProducts(id);
        }
        public List<SanPham> Search(int pageIndex, int pageSize, out long total, string TenSanPham)
        {
            return _sanphamdal.Search(pageIndex, pageSize, out total, TenSanPham);
        }
    }
}
