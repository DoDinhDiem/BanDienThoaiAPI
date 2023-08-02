using BLL.Interfaces;
using DAL;
using DAL.Interfaces;
using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class LoaiSPBLL :  ILoaiSPBLL
    {
        ILoaiSPDAL _loaidal;
        public LoaiSPBLL(ILoaiSPDAL loaidal)
        {
            _loaidal = loaidal;
        }
        public List<LoaiSP> GetAllCategory()
        {
           return _loaidal.GetAllCategory();
        }
        public LoaiSP LayTheoMaLoai(int id)
        {
            return _loaidal.LayTheoMaLoai(id);
        }
        public bool Them(LoaiSP model)
        {
            return _loaidal.Them(model);
        }
        public bool Sua(LoaiSP model)
        {
            return _loaidal.Sua(model);
        }
        public bool Xoa(int id)
        {
            return _loaidal.Xoa(id);
        }
        public List<LoaiSP> Search(int pageIndex, int pageSize, out long total, string name)
        {
            return _loaidal.Search(pageIndex, pageSize, out total, name);
        }
    }
}
