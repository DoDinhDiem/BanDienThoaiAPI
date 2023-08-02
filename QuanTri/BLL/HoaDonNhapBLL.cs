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
    public class HoaDonNhapBLL : IHoaDonNhapBLL
    {
        IHoaDonNhapDAL _hoadonnhapdal;
        public HoaDonNhapBLL(IHoaDonNhapDAL hoadonnhapdal)
        {
            _hoadonnhapdal = hoadonnhapdal;
        }
        public HoaDonNhap LayTheoMaHoaDonNhap(int id)
        {
            return _hoadonnhapdal.LayTheoMaHoaDonNhap(id);
        }
        public bool Them(HoaDonNhap model)
        {
            return _hoadonnhapdal.Them(model);
        }
        public bool Sua(HoaDonNhap model)
        {
            return _hoadonnhapdal.Sua(model);
        }
        public bool Xoa(int id)
        {
            return _hoadonnhapdal.Xoa(id);
        }
        public List<HoaDonNhap> Search(int pageIndex, int pageSize, out long total, string name)
        {
            return _hoadonnhapdal.Search(pageIndex, pageSize, out total, name);
        }
    }
}
