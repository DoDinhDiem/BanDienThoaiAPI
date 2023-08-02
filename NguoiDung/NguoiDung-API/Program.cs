using BLL;
using BLL.Interfaces;
using DAL;
using DAL.Helper;
using DAL.Interfaces;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();

builder.Services.AddTransient<IDatabaseHelper, DatabaseHelper>();

builder.Services.AddTransient<ISanPhamDAL, SanPhamDAL>();
builder.Services.AddTransient<ISanPhamBLL, SanPhamBLL>();

builder.Services.AddTransient<ILoaiSPDAL, LoaiSPDAL>();
builder.Services.AddTransient<ILoaiSPBLL, LoaiSPBLL>();

builder.Services.AddTransient<IDonHangDAL, DonHangDAL>();
builder.Services.AddTransient<IDonHangBLL, DonHangBLL>();

builder.Services.AddTransient<ISlideDAL, SlideDAL>();
builder.Services.AddTransient<ISlideBLL, SlideBLL>();
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