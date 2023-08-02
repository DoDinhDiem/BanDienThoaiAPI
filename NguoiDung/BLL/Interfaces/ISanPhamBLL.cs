using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Interfaces
{
    public interface ISanPhamBLL
    {
        SanPham GetProductsByID(int id);
        List<SanPham> GetSimilarProducts(int masp, int maloai);
        List<SanPham> GetProductsByCategory(int id);
        List<SanPham> SellingProducts(int id);
        List<SanPham> NewProduct(int id);
        List<SanPham> DiscountProducts(int id);
        List<SanPham> Search(int pageIndex, int pageSize, out long total, string TenSanPham);
    }
}
