using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Http;
using QLCHS.Entities;
using QLCHS.Helpers;
using System.Threading.Tasks;
using System.IdentityModel.Tokens.Jwt;
using System.Text;
using System.Security.Claims;
using Microsoft.IdentityModel.Tokens;

namespace QLCHS.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        private readonly QLBANSACHContext _context;
        public LoginController(QLBANSACHContext context)
        {
            _context = context;
        }
        
        [HttpPost("signup")]
        public async Task<IActionResult> SignUp([FromBody] Customer customer)
        {
           if(customer == null)
            {
                return BadRequest();
            }
           else
            {
                customer.Password = EncDscPassword.EncryptPassword(customer.Password);
                _context.Customers.Add(customer);
                _context.SaveChanges();
                return Ok(new
                {
                    StatusCode = 200,
                    Message = "Sign Up Successfully"
                });
            }
        }
        
        [HttpPost("signin")]
        public async Task<IActionResult> SignIn(Customer customer)
        {
            if(customer == null)
                return BadRequest();
            var user = await _context.Customers.FirstOrDefaultAsync(x => x.Phone == customer.Phone);
            if(user == null)
                return NotFound(new { Message = "User not found!" });
            if (!(EncDscPassword.DecryptPassword(user.Password) == customer.Password))
                return NotFound(new { StatusCode = 404, Message = "Customer Not Found" });

            
            return Ok(new
            {
                Token = "",
                Message = "Logged In Successfully"
            });
        }

        private string CreateJwt(Customer customer)
        {
            var jwtTokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes("@anga14082003");
            var identity = new ClaimsIdentity(new Claim[]
            {
                new Claim(ClaimTypes.Name, customer.FullName)
            });

            var credentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256);

            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = identity,
                Expires = DateTime.Now.AddDays(1),
                SigningCredentials = credentials
            };
            var token = jwtTokenHandler.CreateToken(tokenDescriptor);
            return jwtTokenHandler.WriteToken(token);
        }

    }
}
