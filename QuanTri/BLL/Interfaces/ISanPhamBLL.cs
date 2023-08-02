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
        bool Them(SanPham model);
        bool Sua(SanPham model);
        bool Xoa(int id);
        SanPham LayTheoMaSanPham(int id);
        List<SanPham> GetAllSanPham();
        List<SanPham> Search(int pageIndex, int pageSize, out long total, string name);
    }
}
