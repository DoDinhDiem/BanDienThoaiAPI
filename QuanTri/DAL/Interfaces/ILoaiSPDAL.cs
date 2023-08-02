using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Interfaces
{
    public interface ILoaiSPDAL
    {
        List<LoaiSP> GetAllCategory();
        bool Them(LoaiSP model);
        bool Sua(LoaiSP model);
        bool Xoa(int id);
        LoaiSP LayTheoMaLoai(int id);
        List<LoaiSP> Search(int pageIndex, int pageSize, out long total, string name);
    }
}
