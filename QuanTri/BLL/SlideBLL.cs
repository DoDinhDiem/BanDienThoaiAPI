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
    public class SlideBLL : ISlideBLL
    {
        ISlideDAL _slidedal;
        public SlideBLL(ISlideDAL slidedal)
        {
            _slidedal = slidedal;
        }
        public Slide LayTheoMaSlide(int id)
        {
            return _slidedal.LayTheoMaSlide(id);
        }
        public bool Them(Slide model)
        {
            return _slidedal.Them(model);
        }
        public bool Sua(Slide model)
        {
            return _slidedal.Sua(model);
        }
        public bool Xoa(int id)
        {
            return _slidedal.Xoa(id);
        }
        public List<Slide> Search(int pageIndex, int pageSize, out long total, string name)
        {
            return _slidedal.Search(pageIndex, pageSize, out total, name);
        }
    }
}
