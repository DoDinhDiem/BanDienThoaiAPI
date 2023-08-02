using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Interfaces
{
    public interface ITinTucBLL
    {
        bool Them(TinTuc model);
        bool Sua(TinTuc model);
        bool Xoa(int id);
        TinTuc LayTheoMaTinTuc(int id);
        List<TinTuc> Search(int pageIndex, int pageSize, out long total, string name);
    }
}
