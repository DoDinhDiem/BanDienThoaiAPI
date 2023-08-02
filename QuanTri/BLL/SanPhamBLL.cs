using BLL.Interfaces;
using DAL.Interfaces;
using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class SanPhamBLL  :  ISanPhamBLL
    {
        ISanPhamDAL _sanphamdal;
        public SanPhamBLL(ISanPhamDAL categoryReponsitory)
        {
            _sanphamdal = categoryReponsitory;
        }
        public SanPham LayTheoMaSanPham(int id)
        {
            return _sanphamdal.LayTheoMaSanPham(id);
        }
        public bool Them(SanPham model)
        {
            return _sanphamdal.Them(model);
        }
        public bool Sua(SanPham model)
        {
            return _sanphamdal.Sua(model);
        }
        public bool Xoa(int id)
        {
            return _sanphamdal.Xoa(id);
        }
        public List<SanPham> GetAllSanPham()
        {
            return _sanphamdal.GetAllSanPham();
        }
        public List<SanPham> Search(int pageIndex, int pageSize, out long total, string name)
        {
            return _sanphamdal.Search(pageIndex, pageSize, out total, name);
        }
    }
}
