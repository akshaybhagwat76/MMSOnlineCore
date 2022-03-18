using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
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
        public async Task<IActionResult> detail(string msg)
        {
            ViewBag.Message = msg;
            var obj = new TransportationModel();
            List<data.Entities.TransportationCommodities> comdata = new List<data.Entities.TransportationCommodities>();
            var idata = await _uowProvider.TransportationCommoditiesRepository.Search(1, 50000);

                var comdataSelectList = new List<SelectListItem>();
            if (idata != null && idata.Count() > 0)
            {
                comdata = idata.Where(x => x.AccountID == HttpContext.Session.GetString("AccountId")).OrderBy(c => c.CommodityID).ToList();


                comdataSelectList= comdata.Select(state => new SelectListItem
                {
                    Text = state.Commodity_Name.ToString(),
                    Value = state.CommodityID.ToString(),
                    Group = new SelectListGroup() { Name = state.LocationID.ToString() }
                })
                 .ToList();
            }
            ViewBag.lstCommodities = new SelectList(comdataSelectList, "Value", "Text");

            List<data.Entities.TransportationLocations> Locationdata = new List<data.Entities.TransportationLocations>();
            var ldata = await _uowProvider.TransportationLocationsRepository.Search(1, 50000);

            var locSelectList = new List<SelectListItem>();
            if (ldata != null && ldata.Count() > 0)
            {
                Locationdata = ldata.Where(x => x.AccountID == HttpContext.Session.GetString("AccountId")).OrderBy(c => c.LocationID).ToList();
                locSelectList = Locationdata.Select(state => new SelectListItem
                {
                    Text = state.LocationName.ToString(),
                    Value = state.LocationID.ToString()
                })
               .ToList();
            }
            ViewBag.lstLocations = new SelectList(locSelectList, "Value", "Text");

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
                            CreatedBy = Convert.ToInt32(UserID),
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

        [HttpGet]
        public JsonResult GetCommodityByLocation(string locationId)
        {
            if (!string.IsNullOrEmpty(locationId)) {
                List<data.Entities.TransportationCommodities> Commoditiesdata = new List<data.Entities.TransportationCommodities>();
                var ldata = _uowProvider.TransportationCommoditiesRepository.Search(1, 50000).Result;

                var commSelectList = new List<SelectListItem>();
                if (ldata != null && ldata.Count() > 0)
                {
                    Commoditiesdata = ldata.Where(x => x.AccountID == HttpContext.Session.GetString("AccountId") && x.LocationID == Convert.ToInt32(locationId)).OrderBy(c => c.LocationID).ToList();
                    commSelectList = Commoditiesdata.Select(state => new SelectListItem
                    {
                        Text = state.Commodity_Name.ToString(),
                        Value = state.CommodityID.ToString(),
                        Group = new SelectListGroup() { Name = state.LocationID.ToString() }
                    })
                   .ToList();
                }
                return Json(commSelectList);
            }
            else
            {
                return Json("");
            }
        }
    }
}
