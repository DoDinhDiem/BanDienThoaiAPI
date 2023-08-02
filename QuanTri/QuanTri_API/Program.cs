using BLL.Interfaces;
using BLL;
using DAL.Helper;
using DAL.Interfaces;
using DAL;
using Models;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Text;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
var appSettingsSection = builder.Configuration.GetSection("AppSettings");
builder.Services.Configure<AppSettings>(appSettingsSection);
// configure jwt authentication
var appSettings = appSettingsSection.Get<AppSettings>();
var key = Encoding.ASCII.GetBytes(appSettings.Secret);
builder.Services.AddAuthentication(x =>
{
    x.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    x.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
})
.AddJwtBearer(x =>
{
    x.RequireHttpsMetadata = false;
    x.SaveToken = true;
    x.TokenValidationParameters = new TokenValidationParameters
    {
        ValidateIssuerSigningKey = true,
        IssuerSigningKey = new SymmetricSecurityKey(key),
        ValidateIssuer = false,
        ValidateAudience = false
    };
});


builder.Services.AddControllers();

builder.Services.AddTransient<IDatabaseHelper, DatabaseHelper>();

builder.Services.AddTransient<IDonHangDAL, DonHangDAL>();
builder.Services.AddTransient<IDonHangBLL, DonHangBLL>();

builder.Services.AddTransient<IDonViTinhDAL, DonViTinhDAL>();
builder.Services.AddTransient<IDonViTinhBLL, DonViTinhBLL>();

builder.Services.AddTransient<IHoaDonNhapDAL, HoaDonNhapDAL>();
builder.Services.AddTransient<IHoaDonNhapBLL, HoaDonNhapBLL>();

builder.Services.AddTransient<IHoaDonXuatDAL, HoaDonXuatDAL>();
builder.Services.AddTransient<IHoaDonXuatBLL, HoaDonXuatBLL>();

builder.Services.AddTransient<IKhachHangDAL, KhachHangDAL>();
builder.Services.AddTransient<IKhachHangBLL, KhachHangBLL>();

builder.Services.AddTransient<IKhoDAL, KhoDAL>();
builder.Services.AddTransient<IKhoBLL, KhoBLL>();


builder.Services.AddTransient<IKhuyenMaiDAL, KhuyenMaiDAL>();
builder.Services.AddTransient<IKhuyenMaiBLL, KhuyenMaiBLL>();

builder.Services.AddTransient<IKiemKhoDAL, KiemKhoDAL>();
builder.Services.AddTransient<IKiemKhoBLL, KiemKhoBLL>();

builder.Services.AddTransient<ILoaiSPDAL, LoaiSPDAL>();
builder.Services.AddTransient<ILoaiSPBLL, LoaiSPBLL>();

builder.Services.AddTransient<INhaCungCapDAL, NhaCungCapDAL>();
builder.Services.AddTransient<INhaCungCapBLL, NhaCungCapBLL>();

builder.Services.AddTransient<INhanVienDAL, NhanVienDAL>();
builder.Services.AddTransient<INhanVienBLL, NhanVienBLL>();

builder.Services.AddTransient<INhaSanXuatDAL, NhaSanXuatDAL>();
builder.Services.AddTransient<INhaSanXuatBLL, NhaSanXuatBLL>();

builder.Services.AddTransient<ISanPhamDAL, SanPhamDAL>();
builder.Services.AddTransient<ISanPhamBLL, SanPhamBLL>();

builder.Services.AddTransient<ISlideDAL, SlideDAL>();
builder.Services.AddTransient<ISlideBLL, SlideBLL>();

builder.Services.AddTransient<ITaiKhoanDAL, TaiKhoanDAL>();
builder.Services.AddTransient<ITaiKhoanBLL, TaiKhoanBLL>();

builder.Services.AddTransient<ITinTucDAL, TinTucDAL>();
builder.Services.AddTransient<ITinTucBLL, TinTucBLL>();

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}
app.UseRouting();

app.UseCors(x => x
    .AllowAnyOrigin()
    .AllowAnyMethod()
    .AllowAnyHeader());

app.UseAuthentication();

app.UseAuthorization();
app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
