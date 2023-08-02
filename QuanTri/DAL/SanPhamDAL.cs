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
    public class SanPhamDAL : ISanPhamDAL
    {
        private IDatabaseHelper _dbHelper;
        public SanPhamDAL(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }   
        public SanPham LayTheoMaSanPham(int id)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_sanpham_id",
                     "@MaSanPham", id);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return result.ConvertTo<SanPham>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<SanPham> GetAllSanPham()
        {
            string mgsError = "";
            try
            {
                var result = _dbHelper.ExecuteSProcedureReturnDataTable(out mgsError, "sp_sanpham_full");
                if(!string.IsNullOrEmpty(mgsError))
                    throw new Exception(mgsError);
                return result.ConvertTo<SanPham>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
               
        }
        public bool Them(SanPham model)
        {
          
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_sanpham_create",
                "@MaLoai", model.MaLoai,
                "@TenSanPham", model.TenSanPham,
                "@MoTaSanPham", model.MoTaSanPham,
                "@AnhDaiDien", model.AnhDaiDien,
                "@MaNSX", model.MaNSX,
                "@MaDonViTinh", model.MaDonViTinh,
                "@GiaBan", model.GiaBan,
                "@listjson_chitietanh", model.listjson_chitietanh != null ? MessageConvert.SerializeObject(model.listjson_chitietanh) : null,
                "@listjson_thongsokythuat", model.listjson_thongsokythuat != null ? MessageConvert.SerializeObject(model.listjson_thongsokythuat) : null);
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

        public bool Sua(SanPham model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_sanpham_update",
                "@MaSanPham", model.MaSanPham,
                "@MaLoai", model.MaLoai,
                "@TenSanPham", model.TenSanPham,
                "@MoTaSanPham", model.MoTaSanPham,
                "@AnhDaiDien", model.AnhDaiDien,
                "@MaNSX", model.MaNSX,
                "@MaDonViTinh", model.MaDonViTinh,
                "@GiaBan", model.GiaBan,
                "@listjson_chitietanh", model.listjson_chitietanh != null ? MessageConvert.SerializeObject(model.listjson_chitietanh) : null,
                "@listjson_thongsokythuat", model.listjson_thongsokythuat != null ? MessageConvert.SerializeObject(model.listjson_thongsokythuat) : null);
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
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_sanpham_delete",
                "@MaSanPham", id);
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
        public List<SanPham> Search(int pageIndex, int pageSize, out long total, string name)
        {
            string msgError = "";
            total = 0;
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_sanpham_search",
                    "@page_index", pageIndex,
                    "@page_size", pageSize,
                    "@product_name", name
                    );
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
                return dt.ConvertTo<SanPham>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
