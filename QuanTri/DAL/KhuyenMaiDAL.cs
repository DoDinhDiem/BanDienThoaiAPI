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
    public class KhuyenMaiDAL : IKhuyenMaiDAL
    {
        private IDatabaseHelper _dbHelper;
        public KhuyenMaiDAL(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }
        public KhuyenMai LayTheoMaKhuyenMai(int id)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_khuyenmai_id",
                     "@MaKhuyenMai", id);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return result.ConvertTo<KhuyenMai>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool Them(KhuyenMai model)
        {

            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_khuyenmai_create",
                "@TenKhuyenMai", model.TenKhuyenMai,
                "@MoTa", model.MoTa,
                "@listjson_chitietkhuyenmai", model.listjson_chitietkhuyenmai != null ? MessageConvert.SerializeObject(model.listjson_chitietkhuyenmai) : null
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

        public bool Sua(KhuyenMai model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_khuyenmai_update",
                "@MaKhuyenMai", model.MaKhuyenMai,
                "@TenKhuyenMai", model.TenKhuyenMai,
                "@MoTa", model.MoTa,
                "@listjson_chitietkhuyenmai", model.listjson_chitietkhuyenmai != null ? MessageConvert.SerializeObject(model.listjson_chitietkhuyenmai) : null
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
        public bool Xoa(int id)
        {

            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_khuyenmai_delete",
                "@MaKhuyenMai", id);
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
        public List<KhuyenMai> Search(int pageIndex, int pageSize, out long total, string name)
        {
            string msgError = "";
            total = 0;
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_khuyenmai_search",
                    "@page_index", pageIndex,
                    "@page_size", pageSize,
                    "@promotion_name", name
                    );
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
                return dt.ConvertTo<KhuyenMai>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
