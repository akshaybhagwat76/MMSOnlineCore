using MMS.web.Models;
using System.Linq;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Options;
using System.Security.Claims;
using System.Threading.Tasks;
using MMS.data.UnitOfWork;
using MMS.web.Config;

namespace MMS.web.Extensions
{
    /// <summary>
    /// 
    /// </summary>
    public class AppClaimsPrincipalFactory : UserClaimsPrincipalFactory<ApplicationUser, ApplicationRole>
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly RoleManager<ApplicationRole> _roleManager;
        protected readonly IOptions<AppConfig> _appconfig;
        private readonly IUnitOfWork _uowProvider;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="uowProvider"></param>
        /// <param name="userManager"></param>
        /// <param name="roleManager"></param>
        /// <param name="optionsAccessor"></param>
        /// <param name="appconfig"></param>
        public AppClaimsPrincipalFactory(IUnitOfWork uowProvider, UserManager<ApplicationUser> userManager, RoleManager<ApplicationRole> roleManager, IOptions<IdentityOptions> optionsAccessor, IOptions<AppConfig> appconfig) : base(userManager, roleManager, optionsAccessor)
        {
            _userManager = userManager;
            _roleManager = roleManager;
            _uowProvider = uowProvider;
            _appconfig = appconfig;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public async override Task<ClaimsPrincipal> CreateAsync(ApplicationUser user)
        {
            var principal = await base.CreateAsync(user);

            var roles = await _userManager.GetRolesAsync(user);
            string roleName = roles.FirstOrDefault().ToString();
            var role = await _roleManager.FindByNameAsync(roles.FirstOrDefault());

            ((ClaimsIdentity)principal.Identity).AddClaims(
            new[] {
                     new Claim(ClaimTypes.GivenName, (user.FirstName != null ? user.FirstName  : " " )),
                     new Claim("AccountId", (user.AccountId != null ? user.AccountId.ToString()  : "" )),
                       new Claim("UserName", (user.FirstName != null ? user.FirstName.ToString()  : "" )),
                         new Claim("RoleId", (role.Id.ToString() != null ? role.Id.ToString()  : "" ))
                 }
            );

            if (roles.Contains("superadmin"))
                ((ClaimsIdentity)principal.Identity).AddClaims(new[] { new Claim("access", "any"), });

            ((ClaimsIdentity)principal.Identity).AddClaims(new[] { new Claim(ClaimTypes.Role, roleName), });

            return principal;
        }
    }
}
