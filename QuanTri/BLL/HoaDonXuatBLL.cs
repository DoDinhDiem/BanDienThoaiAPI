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
    public class HoaDonXuatBLL : IHoaDonXuatBLL
    {
        IHoaDonXuatDAL _hoadonxuatdal;
        public HoaDonXuatBLL(IHoaDonXuatDAL loaidal)
        {
            _hoadonxuatdal = loaidal;
        }
        public HoaDonXuat LayTheoMaHoaDonXuat(int id)
        {
            return _hoadonxuatdal.LayTheoMaHoaDonXuat(id);
        }
        public bool Them(HoaDonXuat model)
        {
            return _hoadonxuatdal.Them(model);
        }
        public bool Sua(HoaDonXuat model)
        {
            return _hoadonxuatdal.Sua(model);
        }
        public bool Xoa(int id)
        {
            return _hoadonxuatdal.Xoa(id);
        }
        public List<HoaDonXuat> Search(int pageIndex, int pageSize, out long total, string name)
        {
            return _hoadonxuatdal.Search(pageIndex, pageSize, out total, name);
        }
    }
}
