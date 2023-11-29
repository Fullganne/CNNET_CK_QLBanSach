using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Http;
using QLCHS.Entities;
using QLCHS.Helpers;
using System.Threading.Tasks;

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
            {
                return BadRequest();
            }    
            else
            {
                var user = await _context.Customers
                    .FirstOrDefaultAsync(x => x.Email == customer.Email);
                if(user == null)
                {
                    return NotFound(new { Message = "User not found!" });
                }
                if (user != null && EncDscPassword.DecryptPassword(user.Password) == customer.Password)
                {
                    return Ok(new
                    {
                        StatusCode = 200,
                        Message = "Logged In Successfully"
                    });
                }
                else
                {
                    return NotFound(new
                    {
                        StatusCode = 404,
                        Message = "Customer Not Found"
                    });
                }
            }
        }
    }
}
