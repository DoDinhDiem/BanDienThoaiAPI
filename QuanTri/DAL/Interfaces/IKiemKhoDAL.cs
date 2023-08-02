using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Interfaces
{
    public interface IKiemKhoDAL
    {
        bool Them(KiemKho model);
        bool Sua(KiemKho model);
        bool Xoa(int id);
        KiemKho LayTheoMaKiemKho(int id);
        List<KiemKho> Search(int pageIndex, int pageSize, out long total, string name);
    }
}
