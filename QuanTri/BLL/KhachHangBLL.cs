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
    public class KhachHangBLL : IKhachHangBLL
    {
        IKhachHangDAL _khachhangdal;
        public KhachHangBLL(IKhachHangDAL khachhangdal)
        {
            _khachhangdal = khachhangdal;
        }
        public List<KhachHang> GetAllCustumer()
        {
            return _khachhangdal.GetAllCustumer();
        }
        public KhachHang LayTheoMaKhachHang(int id)
        {
            return _khachhangdal.LayTheoMaKhachHang(id);
        }
        public bool Them(KhachHang model)
        {
            return _khachhangdal.Them(model);
        }
        public bool Sua(KhachHang model)
        {
            return _khachhangdal.Sua(model);
        }
        public bool Xoa(int id)
        {
            return _khachhangdal.Xoa(id);
        }
        public List<KhachHang> Search(int pageIndex, int pageSize, out long total, string name)
        {
            return _khachhangdal.Search(pageIndex, pageSize, out total, name);
        }
    }
}
