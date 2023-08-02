using BLL.Interfaces;
using DAL.Interfaces;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using Models;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class TaiKhoanBLL : ITaiKhoanBLL
    {
        private ITaiKhoanDAL _res;
        private string Secret;
        public TaiKhoanBLL(ITaiKhoanDAL res, IConfiguration configuration)
        {
            Secret = configuration["AppSettings:Secret"];
            _res = res;
        }
        public NhanVien Authenticate(string username, string password)
        {
            var user = _res.GetAccount(username, password);
            // return null if user not found
            if (user == null)
                return null;

            // authentication successful so generate jwt token
            // authentication successful so generate jwt token
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(Secret);
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new Claim[]
                {
                    new Claim(ClaimTypes.Name, user.HoTen.ToString()),
                    new Claim(ClaimTypes.Role, user.LoaiQuyen),
                }),
                Expires = DateTime.UtcNow.AddDays(7),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };
            var tmp = tokenHandler.CreateToken(tokenDescriptor);
            user.ToKen = tokenHandler.WriteToken(tmp);

            return user;

        }
    }
}
