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
    public class NhanVienBLL : INhanVienBLL
    {
        INhanVienDAL _nhanviendal;
        public NhanVienBLL(INhanVienDAL nhanviendal)
        {
            _nhanviendal = nhanviendal;
        }
        public List<NhanVien> GetAllStaff()
        {
            return _nhanviendal.GetAllStaff();
        }
        public NhanVien LayTheoMaNhanVien(int id)
        {
            return _nhanviendal.LayTheoMaNhanVien(id);
        }
        public bool Them(NhanVien model)
        {
            return _nhanviendal.Them(model);
        }
        public bool Sua(NhanVien model)
        {
            return _nhanviendal.Sua(model);
        }
        public bool Xoa(int id)
        {
            return _nhanviendal.Xoa(id);
        }
        public List<NhanVien> Search(int pageIndex, int pageSize, out long total, string name)
        {
            return _nhanviendal.Search(pageIndex, pageSize, out total, name);
        }
    }
}
