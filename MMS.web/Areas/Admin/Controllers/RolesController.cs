using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Threading.Tasks;
using MMS.web.Areas.Admin.ViewModels.Input;
using MMS.web.Models;
using MMS.web.Services;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

namespace MMS.web.Areas.Admin.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    public class RolesController : BaseController
    {

        private readonly IControllerDiscovery _mvcControllerDiscovery;
        private readonly RoleManager<ApplicationRole> _roleManager;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="mvcControllerDiscovery"></param>
        /// <param name="roleManager"></param>
        public RolesController(IControllerDiscovery mvcControllerDiscovery, RoleManager<ApplicationRole> roleManager)
        {
            _mvcControllerDiscovery = mvcControllerDiscovery;
            _roleManager = roleManager;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [DisplayName("List")]
        public async Task<ActionResult> Index()
        {
            var roles = await _roleManager.Roles.ToListAsync();

            return View(roles);
        }

        List<String> Getmenu()
        {
            List<String> menu = new List<string>();
            menu.Add("Dashboard");
            menu.Add("Learners");
            menu.Add("Clients");
            menu.Add("Courses");
            menu.Add("Facilitators");
            menu.Add("Assessors");
            menu.Add("Reports");
            menu.Add("Users");
            menu.Add("LFP VIDEOS");
            return menu;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public ActionResult Create()
        {
            ViewData["Controllers"] = _mvcControllerDiscovery.GetControllers();
            ViewData["menuList"] = Getmenu();
            return View();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="viewModel"></param>
        /// <returns></returns>
        // POST: Role/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(RoleViewModel viewModel)
        {
            if (!ModelState.IsValid)
            {
                ViewData["Controllers"] = _mvcControllerDiscovery.GetControllers();
                ViewData["menuList"] = Getmenu();
                return View(viewModel);
            }

            var role = new ApplicationRole { Name = viewModel.Name, RedirectUrl = viewModel.RedirectUrl };
            if (viewModel.SelectedControllers != null && viewModel.SelectedControllers.Any())
            {
                foreach (var controller in viewModel.SelectedControllers)
                    foreach (var action in controller.Actions)
                        action.ControllerId = controller.Id;

                var accessJson = JsonConvert.SerializeObject(viewModel.SelectedControllers);
                role.Permission = accessJson;
            }

            if (viewModel.MenuList != null && viewModel.MenuList.Any())
                role.Description = string.Join(',', viewModel.MenuList.ToArray());
            else
                role.Description = null;


            var result = await _roleManager.CreateAsync(role);
            if (result.Succeeded)
                return RedirectToAction(nameof(Index));

            foreach (var error in result.Errors)
                ModelState.AddModelError("", error.Description);

            ViewData["Controllers"] = _mvcControllerDiscovery.GetControllers();
            ViewData["menuList"] = Getmenu();
            return View(viewModel);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        // GET: Role/Edit/5
        public async Task<ActionResult> Edit(string id)
        {
            ViewData["Controllers"] = _mvcControllerDiscovery.GetControllers();
            ViewData["menuList"] = Getmenu();
            var role = await _roleManager.FindByIdAsync(id);
            if (role == null)
                return NotFound();

            var viewModel = new RoleViewModel
            {
                Name = role.Name,
                RedirectUrl = role.RedirectUrl,
                SelectedControllers = role.Permission != null ? JsonConvert.DeserializeObject<IEnumerable<ControllerInfo>>(role.Permission) : null,
                MenuList = (string.IsNullOrWhiteSpace(role.Description) ? null : role.Description.Split(',').ToList<String>())
            };

            return View(viewModel);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <param name="viewModel"></param>
        /// <returns></returns>
        // POST: Role/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit(string id, RoleViewModel viewModel)
        {
            if (!ModelState.IsValid)
            {
                ViewData["Controllers"] = _mvcControllerDiscovery.GetControllers();
                ViewData["menuList"] = Getmenu();
                return View(viewModel);
            }

            var role = await _roleManager.FindByIdAsync(id);
            if (role == null)
            {
                ModelState.AddModelError("", "Role not found");
                ViewData["Controllers"] = _mvcControllerDiscovery.GetControllers();
                ViewData["menuList"] = Getmenu();
                return View();
            }

            role.Name = viewModel.Name;
            role.RedirectUrl = viewModel.RedirectUrl;
            if (viewModel.SelectedControllers != null && viewModel.SelectedControllers.Any())
            {
                foreach (var controller in viewModel.SelectedControllers)
                    foreach (var action in controller.Actions)
                        action.ControllerId = controller.Id;

                var accessJson = JsonConvert.SerializeObject(viewModel.SelectedControllers);
                role.Permission = accessJson;
            }

            if (viewModel.MenuList != null && viewModel.MenuList.Any())
                role.Description = string.Join(',', viewModel.MenuList.ToArray());
            else
                role.Description = null;


            var result = await _roleManager.UpdateAsync(role);
            if (result.Succeeded)
                return RedirectToAction(nameof(Index));

            foreach (var error in result.Errors)
                ModelState.AddModelError("", error.Description);

            ViewData["Controllers"] = _mvcControllerDiscovery.GetControllers();
            ViewData["menuList"] = Getmenu();
            return View(viewModel);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        // Delete: role/5
        [HttpDelete("role/{id}")]
        public async Task<ActionResult> Delete(string id)
        {
            var role = await _roleManager.FindByIdAsync(id);
            if (role == null)
            {
                ModelState.AddModelError("Error", "Role not found");
                return BadRequest(ModelState);
            }

            var result = await _roleManager.DeleteAsync(role);
            if (result.Succeeded)
                return Ok(new { });

            foreach (var error in result.Errors)
                ModelState.AddModelError("Error", error.Description);

            return BadRequest(ModelState);
        }
    }
}