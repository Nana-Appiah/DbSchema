using EmployeeTrainingSystem.BusinessRules.Classes;
using EmployeeTrainingSystem.BusinessRules.ViewModels;
using EmployeeTrainingSystem.Services.Interfaces;
using EmployeeTraningSystemAPI.Classes;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using System;
using System.Net.Http;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace EmployeeTraningSystemAPI.Controllers
{
    [Authorize]
    [Route("/v1/[controller]")]
    [Produces("application/json")]
    [ApiController]
    public class UsersController : BaseController
    {       
        private readonly IUserSessionHelper _sessionHelper;
        private readonly IUserService _userService;   
       

     
        public UsersController(IConfiguration config, IUserService userService, IUserSessionHelper sessionHelper) : base(config)
        {          
            _sessionHelper = sessionHelper;
            _userService = userService;          
        }

        

       

        [AllowAnonymous]
        [HttpPost("login")]
        public async Task<JsonResult> Post([FromBody] LogInVM loginDetail)
        {
            var _jsonSetting = new JsonSerializerOptions()
            {
                WriteIndented = true,
                IgnoreNullValues = true,
                IgnoreReadOnlyProperties = true
            };

            var loginJson = new StringContent(JsonSerializer.Serialize(loginDetail, _jsonSetting), Encoding.UTF8,
       "application/json");

            var httpResponse = await httpClient.PostAsync("authuser", loginJson);


            if (httpResponse.IsSuccessStatusCode)
            {

                try
                {
                    var userDataString = await httpResponse.Content.ReadAsStringAsync();
                    ApiResponse userData = JsonSerializer.Deserialize<ApiResponse>(userDataString);

                    if (userData.Entity == null)
                        return new JsonResult(userData);

                    User _user = Utilities.DeSerializeObject<User>(userData.Entity.ToString());                    

                    await _userService.Add_Update_Employee(new EmployeeTrainingSystem.Models.Entities.Employee()
                    {
                        Description = _user.Description,
                        Email = _user.Email,
                        FullName = _user.FullName,
                        UserId = _user.Id,
                        UserName = _user.Username
                    });

                    _user.Token = _userService.GenerateUserJwtToken(_user);

                    userData.Entity = _user;

                    return new JsonResult(userData);
                }
                catch (Exception e)
                {                   
                    return new JsonResult(new ApiResponse() { Entity = e.Message, Message = "Failed" });
                }
            }
            else
            {
                Response.StatusCode = 404;
                return new JsonResult(JsonSerializer.Serialize(new ApiResponse { Entity = null, ResponseCode = "400", Status = false, Message = "Failed" }));
            }

        }


        [HttpGet("list")]       
        public async Task<JsonResult> GetList()
        {
            var _list = await _userService.Get_User_List();
            return new JsonResult(_list);
        }


        [HttpGet("validate/{userName}")]      
        public async Task<JsonResult> GetValidate([FromRoute] string userName)
        {
            return await Task.Factory.StartNew(() =>
             {
                 var _user = _sessionHelper.ReadItem<SessionInfo<User>>(userName);

                 if (_user != null)
                     if (_user.Expires > DateTime.UtcNow)
                     {
                         if (DateTime.UtcNow.AddMinutes(10) >= _user.Expires)
                         {
                             _user.Renew();
                             _sessionHelper.AddRenewItem(userName, _user);
                         }

                         return new JsonResult(_user.SessionData);
                     }

                 return new JsonResult(default(User));
             });
        }
               
        [HttpPost("logout/{userName}")]
        public async Task<ActionResult> PostLogout([FromRoute] string userName)
        {
            return await Task.Factory.StartNew(() =>
            {
                _sessionHelper.Remove(userName);
                return Ok();
            });
        }


        


    }
}
