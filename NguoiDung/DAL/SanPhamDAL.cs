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
        public SanPham GetProductsByID(int id)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_home_sanpham_id",
                    "@MaSanPham", id);
                if (!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(msgError);
                }
                return dt.ConvertTo<SanPham>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<SanPham> GetProductsByCategory(int id)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_home_loai_id",
                     "@MaLoai", id);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<SanPham>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<SanPham> GetSimilarProducts(int masp, int maloai)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_home_sanpham_tuongtu",
                    "@MaSanPham", masp,
                    "@MaLoai", maloai);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<SanPham>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<SanPham> SellingProducts(int id)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_home_banchay",
                    "@soluong", id);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<SanPham>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<SanPham> NewProduct(int id)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_home_moi",
                    "soluong", id);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<SanPham>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<SanPham> DiscountProducts(int id)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_home_giamgia",
                    "soluong", id);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<SanPham>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<SanPham> Search(int pageIndex, int pageSize, out long total, string TenSanPham)
        {
            string msgError = "";
            total = 0;
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_home_search",
                    "@page_index", pageIndex,
                    "@page_size", pageSize,
                    "@product_name", TenSanPham
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
