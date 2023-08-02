using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Interfaces
{
    public interface IKhuyenMaiDAL
    {
        bool Them(KhuyenMai model);
        bool Sua(KhuyenMai model);
        bool Xoa(int id);
        KhuyenMai LayTheoMaKhuyenMai(int id);
        List<KhuyenMai> Search(int pageIndex, int pageSize, out long total, string name);
    }
}
