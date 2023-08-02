using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Interfaces
{
    public interface IKhoBLL
    {
        bool Them(Kho model);
        bool Sua(Kho model);
        bool Xoa(int id);
        Kho LayTheoMaKho(int id);
        List<Kho> Search(int pageIndex, int pageSize, out long total, string name);
    }
}
