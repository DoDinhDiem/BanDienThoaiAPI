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
    public class KiemKhoBLL : IKiemKhoBLL
    {
        IKiemKhoDAL _kiemkhodal;
        public KiemKhoBLL(IKiemKhoDAL kiemkhodal)
        {
            _kiemkhodal = kiemkhodal;
        }
        public KiemKho LayTheoMaKiemKho(int id)
        {
            return _kiemkhodal.LayTheoMaKiemKho(id);
        }
        public bool Them(KiemKho model)
        {
            return _kiemkhodal.Them(model);
        }
        public bool Sua(KiemKho model)
        {
            return _kiemkhodal.Sua(model);
        }
        public bool Xoa(int id)
        {
            return _kiemkhodal.Xoa(id);
        }
        public List<KiemKho> Search(int pageIndex, int pageSize, out long total, string name)
        {
            return _kiemkhodal.Search(pageIndex, pageSize, out total, name);
        }
    }
}
