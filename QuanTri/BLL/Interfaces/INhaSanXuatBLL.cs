using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Interfaces
{
    public interface INhaSanXuatBLL
    {
        List<NhaSanXuat> GetAllProducer();
        bool Them(NhaSanXuat model);
        bool Sua(NhaSanXuat model);
        bool Xoa(int id);
        NhaSanXuat LayTheoMaNhaSanXuat(int id);
        List<NhaSanXuat> Search(int pageIndex, int pageSize, out long total, string name);
    }
}
