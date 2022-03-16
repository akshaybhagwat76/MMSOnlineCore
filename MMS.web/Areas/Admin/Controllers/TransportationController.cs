using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MMS.data.UnitOfWork;
using MMS.web.Areas.Admin.ViewModels.Input;
using MMS.web.Filters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MMS.web.Areas.Admin.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    [ServiceFilter(typeof(AuditFilterAttribute))]
    public class TransportationController : BaseController
    {
        private readonly IUnitOfWork _uowProvider;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="uowProvider"></param>
        public TransportationController(IUnitOfWork uowProvider)
        {
            _uowProvider = uowProvider;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="msg"></param>
        /// <returns></returns>
        public IActionResult detail(string msg)
        {
            ViewBag.Message = msg;
            var obj = new TransportationModel();
            return View(obj);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="m"></param>
        /// <returns></returns>
        [HttpPost]
       // [ValidateAntiForgeryToken]
        public async Task<IActionResult> detail(TransportationModel m)
        {
            if (!string.IsNullOrEmpty(UserID))
            {
                if (ModelState.IsValid)
                {
                    try
                    {
                        await _uowProvider.TransectionSettingRepository.Insert(new data.Entities.TransectionSetting
                        {
                            CommodityID = (int)m.CommodityId.ToDecode(),
                            LocationID = (int)m.LocationId.ToDecode(),
                            Notes = m.Notes,
                            CreatedOn = DateTime.UtcNow,
                            CreatedBy = Guid.Parse(UserID),
                        });

                        return RedirectToAction("detail", new { msg = "Transportation successfully added." });
                    }
                    catch (Exception ex)
                    {
                        ModelState.AddModelError("", ex.Message);
                        return View(m);
                    }

                }
                return View(m);
            }
            return RedirectToAction("login", "Home");
        }
    }
}
