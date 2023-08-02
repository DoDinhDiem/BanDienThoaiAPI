using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Interfaces
{
    public interface ISlideBLL
    {
        bool Them(Slide model);
        bool Sua(Slide model);
        bool Xoa(int id);
        Slide LayTheoMaSlide(int id);
        List<Slide> Search(int pageIndex, int pageSize, out long total, string name);
    }
}
