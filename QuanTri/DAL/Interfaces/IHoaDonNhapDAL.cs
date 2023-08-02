using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Interfaces
{
    public interface IHoaDonNhapDAL
    {
        bool Them(HoaDonNhap model);
        bool Sua(HoaDonNhap model);
        bool Xoa(int id);
        HoaDonNhap LayTheoMaHoaDonNhap(int id);
        List<HoaDonNhap> Search(int pageIndex, int pageSize, out long total, string name);
    }
}
