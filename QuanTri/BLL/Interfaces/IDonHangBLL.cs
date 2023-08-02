using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Interfaces
{
    public interface IDonHangBLL
    {
        bool Sua(DonHang model);
        DonHang LayTheoMaDonHang(int id);
        List<DonHang> Search(int pageIndex, int pageSize, out long total, string name);
    }
}
