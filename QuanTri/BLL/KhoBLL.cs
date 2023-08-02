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
    public class KhoBLL : IKhoBLL
    {
        IKhoDAL _khodal;
        public KhoBLL(IKhoDAL khodal)
        {
            _khodal = khodal;
        }
        public Kho LayTheoMaKho(int id)
        {
            return _khodal.LayTheoMaKho(id);
        }
        public bool Them(Kho model)
        {
            return _khodal.Them(model);
        }
        public bool Sua(Kho model)
        {
            return _khodal.Sua(model);
        }
        public bool Xoa(int id)
        {
            return _khodal.Xoa(id);
        }
        public List<Kho> Search(int pageIndex, int pageSize, out long total, string name)
        {
            return _khodal.Search(pageIndex, pageSize, out total, name);
        }
    }
}
