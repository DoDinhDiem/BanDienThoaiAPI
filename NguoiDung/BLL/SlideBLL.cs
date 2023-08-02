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
        public List<Slide> GetAllSlide()
        {
            return _slidedal.GetAllSlide();
        }
    }
}
