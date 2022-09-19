using System;
using System.Linq;
using System.Threading.Tasks;
using MMS.data.UnitOfWork;
using MMS.web.Areas.Admin.ViewModels.Input;
using MMS.web.Extensions;
using MMS.web.Models;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Caching.Memory;

namespace MMS.web.Areas.Admin.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    public class UserController : BaseController
    {

        private readonly UserManager<ApplicationUser> _userManager;
        private readonly IUnitOfWork _uowProvider;
        private readonly IHostingEnvironment _appEnvironment;
        private IMemoryCache cache;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="uowProvider"></param>
        /// <param name="userManager"></param>
        /// <param name="appEnvironment"></param>
        /// <param name="cache"></param>
        public UserController(IUnitOfWork uowProvider, UserManager<ApplicationUser> userManager, IHostingEnvironment appEnvironment, IMemoryCache cache)
        {
            _userManager = userManager;
            _uowProvider = uowProvider;
            _appEnvironment = appEnvironment;
            this.cache = cache;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public IActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public async Task<JsonResult> getUsers()
        {
            try
            {
                var draw = HttpContext.Request.Form["draw"].FirstOrDefault();
                var start = Request.Form["start"].FirstOrDefault();
                var length = Request.Form["length"].FirstOrDefault();
                var sortColumn = Request.Form["columns[" + Request.Form["order[0][column]"].FirstOrDefault() + "][name]"].FirstOrDefault();
                var sortColumnDir = Request.Form["order[0][dir]"].FirstOrDefault();
                var searchValue = Request.Form["search[value]"].FirstOrDefault();

                int pageSize = length != null ? Convert.ToInt32(length) : 0;
                var page = (Convert.ToInt32(start) / Convert.ToInt32(length)) + 1;
                int recordsTotal = 0;

                var data = await _uowProvider.AspNetUsersRepository.Search_Old(page, pageSize, sortColumn, sortColumnDir, searchValue);
                if (data.Count() > 0)
                {
                    recordsTotal = data.FirstOrDefault().TotalRecord;
                    //
                    var query = data.Select(o => new
                    {
                        key = o.Id,
                        o.FirstName,
                        o.LastName,
                        o.Address,
                        o.RoleName,
                        o.PhoneNumber,
                        o.Email,
                        IsActive = (o.IsActive == true ? "Active" : "Inactive"),
                        EmailConfirmed = (o.EmailConfirmed == true ? "Verified" : "Unverified")
                    });

                    return Json(new { draw = draw, recordsFiltered = recordsTotal, recordsTotal = recordsTotal, data = query });
                }
                else
                    return Json(new { draw = draw, recordsFiltered = 0, recordsTotal = 0, data = "" });

            }
            catch (Exception ex)
            {
                throw ex;
            }
        } 

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<IActionResult> detail(string id)
        {
            UserModel obj = new UserModel();
            obj.isEdit = false;

            if (!string.IsNullOrEmpty(id))
            {
                var data = await _uowProvider.AspNetUsersRepository.Get2(id);
                if (data != null)
                {
                    obj.isEdit = true;
                    obj.Email = data.Email;
                    obj.FirstName = data.FirstName;
                    obj.LastName = data.LastName;
                    obj.Phone = data.PhoneNumber;
                    obj.isActive = data.IsActive.Value;
                    obj.isEmailVerified = data.EmailConfirmed.Value;
                    obj.userid = data.Id.ToString();         
                    obj.Password = "********";

                    if (!string.IsNullOrEmpty(data.UserImage))
                        obj.Imagname = "/uploads/ProfileImage/" + data.UserImage;
                }

            }

            return View(obj);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<IActionResult> detail(UserModel obj)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (!obj.isEdit)
                    {
                        var user = new ApplicationUser
                        {
                            UserName = obj.Email,
                            Email = obj.Email,
                            FirstName = obj.FirstName,
                            IsActive = obj.isActive.Value,
                            EmailConfirmed = obj.isEmailVerified.Value,
                            LastName = obj.LastName,
                            PhoneNumber = obj.Phone,

                          //  UserImage = obj.UploadLogo != null ? await Uploadfiles.Uplaod(obj.UploadLogo, _appEnvironment.WebRootPath, "ProfileImage") : ""
                        };

                        var result = await _userManager.CreateAsync(user, obj.Password);
                        if (result.Succeeded)
                        {
                            await _userManager.AddToRoleAsync(user, "Learner");
                            var data = await _uowProvider.AspNetUsersRepository.Get(user.Id);
                            await _uowProvider.AspNetUsersRepository.Update(data);
                        }
                        else
                        {
                            var dd = result.Errors.Where(c => c.Code == "DuplicateEmail");
                            if (dd.Count() > 0)
                            {
                                ModelState.AddModelError("Email", dd.FirstOrDefault().Description);
                            }
                            return View(obj);
                        }
                    }
                    else
                    {
                        var data = await _uowProvider.AspNetUsersRepository.Get(new Guid(obj.userid));
                        if (data != null)
                        {
                            data.FirstName = obj.FirstName;
                            data.IsActive = obj.isActive;
                            data.LastName = obj.LastName;
                            data.PhoneNumber = obj.Phone;
                            data.EmailConfirmed = obj.isEmailVerified;
                        }

                        var user = await _userManager.FindByIdAsync(data.Id.ToString());

                        if (user != null)
                        {
                            if (obj.Password != "********")
                            {
                                await _userManager.RemovePasswordAsync(user);
                                await _userManager.AddPasswordAsync(user, obj.Password);
                                data.PasswordHash = user.PasswordHash;
                            }
                             
                            if (obj.UploadLogo != null)
                            {
                                data.UserImage = await Uploadfiles.Uplaod(obj.UploadLogo, _appEnvironment.WebRootPath, "ProfileImage");
                            } 

                            await _uowProvider.AspNetUsersRepository.Update(data);
                        }
                        else
                            throw new Exception("Invalid user details");
                    }

                    cache.Remove("user");

                    return LocalRedirect(Url.GetLocalUrl("~/admin/user"));

                }
                else
                {
                    var allErrors = ModelState.Values.SelectMany(v => v.Errors);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return View(obj);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<JsonResult> delete(string id)
        {
            try
            {
                bool isDeleted = false;
                var message = "";
                try
                {

                    var user = await _userManager.FindByIdAsync(id);

                    Random random = new Random();
                    const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
                    var rand = new string(Enumerable.Repeat(chars, 6).Select(s => s[random.Next(s.Length)]).ToArray());
                    if (user != null)
                    {
                        user.IsDeleted = true;
                        user.UserName = user.UserName + "_DELETED_" + rand;
                        user.Email = user.Email + "_DELETED_" + rand;
                        user.PhoneNumber = user.PhoneNumber + "_DELETED_" + rand;
                        user.LockoutEnd = new DateTime(9999, 12, 30);
                        await _userManager.UpdateAsync(user);
                        await _userManager.IsLockedOutAsync(user);
                    }
                    //await _uowProvider.RecipeIngredientRepository.Delete(id.ToDecode());
                    isDeleted = true;
                }
                catch (Exception ex)
                {
                    message = ex.Message;
                }

                return Json(new { status = isDeleted, message = message });
            }
            catch (Exception ex)
            {
                return Json(new { status = false, message = ex.Message });
            }

        }
        
    }
}