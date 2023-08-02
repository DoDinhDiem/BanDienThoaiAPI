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
    public class TinTucBLL : ITinTucBLL
    {
        ITinTucDAL _tintucdal;
        public TinTucBLL(ITinTucDAL TinTucdal)
        {
            _tintucdal = TinTucdal;
        }
        public TinTuc LayTheoMaTinTuc(int id)
        {
            return _tintucdal.LayTheoMaTinTuc(id);
        }
        public bool Them(TinTuc model)
        {
            return _tintucdal.Them(model);
        }
        public bool Sua(TinTuc model)
        {
            return _tintucdal.Sua(model);
        }
        public bool Xoa(int id)
        {
            return _tintucdal.Xoa(id);
        }
        public List<TinTuc> Search(int pageIndex, int pageSize, out long total, string name)
        {
            return _tintucdal.Search(pageIndex, pageSize, out total, name);
        }
    }
}
