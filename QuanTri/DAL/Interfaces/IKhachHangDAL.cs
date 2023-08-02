using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Interfaces
{
    public interface IKhachHangDAL
    {
        bool Them(KhachHang model);
        bool Sua(KhachHang model);
        bool Xoa(int id);
        KhachHang LayTheoMaKhachHang(int id);
        List<KhachHang> GetAllCustumer();
        List<KhachHang> Search(int pageIndex, int pageSize, out long total, string name);
    }
}
