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
    public class KhuyenMaiBLL : IKhuyenMaiBLL
    {
        IKhuyenMaiDAL _khuyenmaidal;
        public KhuyenMaiBLL(IKhuyenMaiDAL khuyenmaidal)
        {
            _khuyenmaidal = khuyenmaidal;
        }
        public KhuyenMai LayTheoMaKhuyenMai(int id)
        {
            return _khuyenmaidal.LayTheoMaKhuyenMai(id);
        }
        public bool Them(KhuyenMai model)
        {
            return _khuyenmaidal.Them(model);
        }
        public bool Sua(KhuyenMai model)
        {
            return _khuyenmaidal.Sua(model);
        }
        public bool Xoa(int id)
        {
            return _khuyenmaidal.Xoa(id);
        }
        public List<KhuyenMai> Search(int pageIndex, int pageSize, out long total, string name)
        {
            return _khuyenmaidal.Search(pageIndex, pageSize, out total, name);
        }
    }
}
