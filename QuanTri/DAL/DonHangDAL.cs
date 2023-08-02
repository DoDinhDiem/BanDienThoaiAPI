using DAL.Helper;
using DAL.Interfaces;
using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DonHangDAL : IDonHangDAL
    {
        private IDatabaseHelper _dbHelper;
        public DonHangDAL(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }
        public DonHang LayTheoMaDonHang(int id)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_donhang_id",
                     "@MaDonHang", id);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return result.ConvertTo<DonHang>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool Sua(DonHang model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_donhang_update",
                "@MaDonHang", model.MaDonHang,
                "@MaKhachHang", model.MaKhachHang,
                "@TrangThai", model.TrangThaiDonHang,
                "@listjson_chitietdonhang", model.listjson_chitietdonhang != null ? MessageConvert.SerializeObject(model.listjson_chitietdonhang) : null
                );
                if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(Convert.ToString(result) + msgError);
                }
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<DonHang> Search(int pageIndex, int pageSize, out long total, string name)
        {
            string msgError = "";
            total = 0;
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_donhang_search",
                    "@page_index", pageIndex,
                    "@page_size", pageSize,
                    "@order_id", name
                    );
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
                return dt.ConvertTo<DonHang>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}

