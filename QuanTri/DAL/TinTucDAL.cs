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
    public class TinTucDAL : ITinTucDAL
    {
        private IDatabaseHelper _dbHelper;
        public TinTucDAL(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }
        public TinTuc LayTheoMaTinTuc(int id)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_tintuc_id",
                     "@MaTinTuc", id);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return result.ConvertTo<TinTuc>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool Them(TinTuc model)
        {

            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_tintuc_create",
                "@MaNhanVien", model.MaNhanVien,
                "@TieuDe", model.TieuDe,
                "@TomTat", model.TomTat,
                "@Anh", model.Anh,
                "@listjson_chitiettintuc", model.listjson_chitiettintuc != null ? MessageConvert.SerializeObject(model.listjson_chitiettintuc) : null
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

        public bool Sua(TinTuc model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_tintuc_update",
                "@MaTinTuc", model.MaTinTuc,
                "@MaNhanVien", model.MaNhanVien,
                "@TieuDe", model.TieuDe,
                "@TomTat", model.TomTat,
                "@Anh", model.Anh,
                "@listjson_chitiettintuc", model.listjson_chitiettintuc != null ? MessageConvert.SerializeObject(model.listjson_chitiettintuc) : null
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
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_tintuc_delete",
                "@MaTinTuc", id);
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
        public List<TinTuc> Search(int pageIndex, int pageSize, out long total, string name)
        {
            string msgError = "";
            total = 0;
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_tintuc_search",
                    "@page_index", pageIndex,
                    "@page_size", pageSize,
                    "@news_name", name
                    );
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
                return dt.ConvertTo<TinTuc>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
