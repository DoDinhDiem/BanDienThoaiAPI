using BLL.Interfaces;
using DAL;
using DAL.Interfaces;
using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class NhaSanXuatBLL : INhaSanXuatBLL
    {
        INhaSanXuatDAL _nhasanxuatdal;
        public NhaSanXuatBLL(INhaSanXuatDAL categoryReponsitory)
        {
            _nhasanxuatdal = categoryReponsitory;
        }
        public List<NhaSanXuat> GetAllProducer()
        {
            return _nhasanxuatdal.GetAllProducer();
        }
        public NhaSanXuat LayTheoMaNhaSanXuat(int id)
        {
            return _nhasanxuatdal.LayTheoMaNhaSanXuat(id);
        }
        public bool Them(NhaSanXuat model)
        {
            return _nhasanxuatdal.Them(model);
        }
        public bool Sua(NhaSanXuat model)
        {
            return _nhasanxuatdal.Sua(model);
        }
        public bool Xoa(int id)
        {
            return _nhasanxuatdal.Xoa(id);
        }
        public List<NhaSanXuat> Search(int pageIndex, int pageSize, out long total, string name)
        {
            return _nhasanxuatdal.Search(pageIndex, pageSize, out total, name);
        }
    }
}
