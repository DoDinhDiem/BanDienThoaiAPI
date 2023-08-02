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
    public class NhaCungCapBLL : INhaCungCapBLL
    {
        INhaCungCapDAL _nhacungcapdal;
        public NhaCungCapBLL(INhaCungCapDAL nhacungcapdal)
        {
            _nhacungcapdal = nhacungcapdal;
        }
        public List<NhaCungCap> GetAllSupplier()
        {
            return _nhacungcapdal.GetAllSupplier();
        }
        public NhaCungCap LayTheoMaNhaCungCap(int id)
        {
            return _nhacungcapdal.LayTheoMaNhaCungCap(id);
        }
        public bool Them(NhaCungCap model)
        {
            return _nhacungcapdal.Them(model);
        }
        public bool Sua(NhaCungCap model)
        {
            return _nhacungcapdal.Sua(model);
        }
        public bool Xoa(int id)
        {
            return _nhacungcapdal.Xoa(id);
        }
        public List<NhaCungCap> Search(int pageIndex, int pageSize, out long total, string name)
        {
            return _nhacungcapdal.Search(pageIndex, pageSize, out total, name);
        }
    }
}
