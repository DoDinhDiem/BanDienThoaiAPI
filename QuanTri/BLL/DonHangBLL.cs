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
    public class DonHangBLL : IDonHangBLL
    {
        IDonHangDAL _donhangdal;
        public DonHangBLL(IDonHangDAL DonHangdal)
        {
            _donhangdal = DonHangdal;
        }
        public DonHang LayTheoMaDonHang(int id)
        {
            return _donhangdal.LayTheoMaDonHang(id);
        }
        public bool Sua(DonHang model)
        {
            return _donhangdal.Sua(model);
        }
        public List<DonHang> Search(int pageIndex, int pageSize, out long total, string name)
        {
            return _donhangdal.Search(pageIndex, pageSize, out total, name);
        }
    }
}
