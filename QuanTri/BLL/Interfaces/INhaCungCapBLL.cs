using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Interfaces
{
    public interface INhaCungCapBLL
    {
        bool Them(NhaCungCap model);
        bool Sua(NhaCungCap model);
        bool Xoa(int id);
        NhaCungCap LayTheoMaNhaCungCap(int id);
        List<NhaCungCap> GetAllSupplier();
        List<NhaCungCap> Search(int pageIndex, int pageSize, out long total, string name);
    }
}
