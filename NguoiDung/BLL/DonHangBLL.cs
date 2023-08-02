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
        private IDonHangDAL _donhangdal;
        public DonHangBLL(IDonHangDAL donhangdal)
        {
            _donhangdal = donhangdal;
        }
        public bool Create(DonHang model)
        {
            return _donhangdal.Create(model);
        }
    }
}
