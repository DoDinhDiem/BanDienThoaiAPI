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
    public class LoaiSPBLL : ILoaiSPBLL
    {
        ILoaiSPDAL _categorydal;
        public LoaiSPBLL(ILoaiSPDAL categorydal)
        {
            _categorydal = categorydal;
        }
        public List<LoaiSP> GetAllCategory()
        {
            return _categorydal.GetAllCategory();
        }
    }
}
