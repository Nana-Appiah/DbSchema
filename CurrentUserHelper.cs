using EmployeeTrainingSystem.Wasm.Helpers.Interfaces;
using EmployeeTrainingSystem.Wasm.Models;
using EmployeeTraningSystem.Wasm.Models;
using Microsoft.AspNetCore.Components;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EmployeeTrainingSystem.Wasm.Helpers
{
    public class CurrentUserHelper : ICurrentUserHelper
    {

        private NavigationManager _navigationManager;
        private ILocalStorageHelper _localStorageHelper;
        private IHttpHelper _httpHelper;
        private string _userKey = "userSKey";
        private const string APPLICATION_NAME = "ETAS";
        private List<string> applicationParts
        {
            get
            {
                return new List<string>
                {
                    "employee",
                    "manager"
                };
            }
        }
        private List<string> appPermissions
        {
            get
            {
                return new List<string>
                {
                    "create",
                    "read",
                    "change",
                    "delete"
                };
            }
        }

        public BasicUser User { get; private set; }

        public CurrentUserHelper(
            NavigationManager navigationManager,
            ILocalStorageHelper localStorageHelper,
            IHttpHelper httpHelper
            )
        {
            _httpHelper = httpHelper;
            _navigationManager = navigationManager;
            _localStorageHelper = localStorageHelper;
        }


        public async Task Initialize()
        {
            User = await _localStorageHelper.GetItem<BasicUser>(_userKey);
        }

        public async Task<BasicUser> GetCurrentUser()
        {
            if (User == null)          
                User = await _localStorageHelper.GetItem<BasicUser>(_userKey);
           
            return User;
        }       

        public async Task<List<BasicUser>> Get_UserList()
        {
            return await _httpHelper.Get<List<BasicUser>>($"users/list");
        }


        public async Task Login(LogInVM model)
        {
            model.AppPartList = applicationParts;
            model.PermissionTypes = appPermissions;
            model.AppName = APPLICATION_NAME;

            var result = await _httpHelper.Post<ApiResponse>($"users/login", model);

            if (result.Status)
            {
                LogInResult _userInfo = Utilities.DeSerializeObject<LogInResult>(result.Entity.ToString());

                if (_userInfo != null)
                {
                    User = new BasicUser()
                    {
                        Description = _userInfo.Description,
                        Email = _userInfo.Email,
                        FullName = _userInfo.FullName,
                        Id = _userInfo.Id,
                        Token = _userInfo.Token,
                        UserGroupIds = _userInfo.UserGroupIds,
                        UserGroups = _userInfo.UserGroups,
                        UserMenu = _userInfo.UserMenu,
                        Username = _userInfo.Username,
                         Permissions = _userInfo.Permissions
                    };
                    await _localStorageHelper.SetItem(_userKey, User);
                }
            }
        }

        public bool HasPermission(string appPartName,string permission)
        {
            if(User == null)           
                Initialize().RunSynchronously();

            if (User == null)
                return false;

            if (string.IsNullOrWhiteSpace(permission))
                return false;

            var _perm =  User.Permissions.SingleOrDefault(x => x.AppPart.Equals(appPartName) && x.Permssion.Equals(permission));

            if (_perm == null)
                return false;

            return _perm.Allowed;
        }

        public void NavigateToUrl(string path)
        {
            _navigationManager.NavigateTo($"{_navigationManager.BaseUri}{path}");
        }

        public async Task Logout()
        {         
            await _localStorageHelper.RemoveItem(_userKey);
            User = null;
            _navigationManager.NavigateTo("account/login");
        }
        
    }
}
