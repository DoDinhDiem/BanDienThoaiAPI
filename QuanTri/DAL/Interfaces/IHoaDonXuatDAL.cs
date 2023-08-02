using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Interfaces
{
    public interface IHoaDonXuatDAL
    {
        bool Them(HoaDonXuat model);
        bool Sua(HoaDonXuat model);
        bool Xoa(int id);
        HoaDonXuat LayTheoMaHoaDonXuat(int id);
        List<HoaDonXuat> Search(int pageIndex, int pageSize, out long total, string name);
    }
}
