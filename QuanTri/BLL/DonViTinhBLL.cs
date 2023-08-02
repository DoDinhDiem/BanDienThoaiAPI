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
    public class DonViTinhBLL : IDonViTinhBLL
    {
        IDonViTinhDAL _donvitinhdal;
        public DonViTinhBLL(IDonViTinhDAL donvitinhdal)
        {
            _donvitinhdal = donvitinhdal;
        }
        public List<DonViTinh> GetAllUnit()
        {
            return _donvitinhdal.GetAllUnit();
        }
        public DonViTinh LayTheoMaDonViTinh(int id)
        {
            return _donvitinhdal.LayTheoMaDonViTinh(id);
        }
        public bool Them(DonViTinh model)
        {
            return _donvitinhdal.Them(model);
        }
        public bool Sua(DonViTinh model)
        {
            return _donvitinhdal.Sua(model);
        }
        public bool Xoa(int id)
        {
            return _donvitinhdal.Xoa(id);
        }
        public List<DonViTinh> Search(int pageIndex, int pageSize, out long total, string name)
        {
            return _donvitinhdal.Search(pageIndex, pageSize, out total, name);
        }
    }
}
