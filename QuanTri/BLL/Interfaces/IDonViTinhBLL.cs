using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Interfaces
{
    public interface IDonViTinhBLL
    {
        List<DonViTinh> GetAllUnit();
        bool Them(DonViTinh model);
        bool Sua(DonViTinh model);
        bool Xoa(int id);
        DonViTinh LayTheoMaDonViTinh(int id);
        List<DonViTinh> Search(int pageIndex, int pageSize, out long total, string name);
    }
}
